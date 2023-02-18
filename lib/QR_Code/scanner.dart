import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScannerPdf extends StatefulWidget {
  const ScannerPdf({super.key});

  @override
  State<ScannerPdf> createState() => _ScannerPdfState();
}

class _ScannerPdfState extends State<ScannerPdf> {
  int seletedItem = 0;
  void onItemTapped(int index) {
    setState(() {
      seletedItem = index;
    });
  }

  static const List widgetsOption = [Generator(), ScannerF()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: seletedItem,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.scanner),
              label: "generator",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code), label: "Scanner"),
          ]),
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: widgetsOption.elementAt(seletedItem)),
    );
  }
}

class Generator extends StatefulWidget {
  const Generator({super.key});

  @override
  State<Generator> createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  final txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            QrImage(
              data: txtController.text,
              size: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: TextField(
                    controller: txtController,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {});
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(Icons.done),
                ),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Developed by Md. Sifatullah",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScannerF extends StatefulWidget {
  const ScannerF({super.key});

  @override
  State<ScannerF> createState() => _ScannerFState();
}

class _ScannerFState extends State<ScannerF> {
  final txtController = TextEditingController();
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrCtrl;
  Barcode? barcode;

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await qrCtrl!.pauseCamera();
    }
    qrCtrl!.resumeCamera();
  }

  @override
  void dispose() {
    super.dispose();
    qrCtrl?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () async {
                        await qrCtrl?.toggleFlash();
                        setState(() {});
                      },
                      icon: FutureBuilder<bool?>(
                          future: qrCtrl?.getFlashStatus(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return Icon(snapshot.data!
                                  ? Icons.flash_on
                                  : Icons.flash_off);
                            } else {
                              return Container();
                            }
                          })),
                  IconButton(
                      onPressed: () async {
                        await qrCtrl?.flipCamera();
                        setState(() {});
                      },
                      icon: const Icon(Icons.switch_camera))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: QRView(
                key: qrKey,
                onQRViewCreated: (qrCtrl) {
                  setState(() {
                    this.qrCtrl = qrCtrl;
                  });
                  qrCtrl.scannedDataStream.listen((barcode) {
                    setState(() {
                      this.barcode = barcode;
                      txtController.text = '${barcode.code}';
                    });
                  });
                },
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.green,
                  borderRadius: 10,
                  borderLength: 20,
                  borderWidth: 10,
                  cutOutSize: MediaQuery.of(context).size.width * 1,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                "Scan Result",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromARGB(193, 0, 0, 0),
                    letterSpacing: 2),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      readOnly: true,
                      controller: txtController,
                      decoration: const InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: 'Scan First!'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: txtController.text));
                  },
                  child: const Icon(Icons.copy),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
