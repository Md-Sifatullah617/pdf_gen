import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
      body: Column(
        children: [
          Expanded(
            child: BarcodeWidget(
                data: txtController.text,
                color: Colors.red,
                width: 200,
                height: 200,
                barcode: Barcode.qrCode()),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
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
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                "Developed by Md. Sifatullah",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
          ),
        ],
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
  String qrCode = 'unknown';
  @override
  void initState() {
    super.initState();
    txtController.text = qrCode;
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancle', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failled to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: txtController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(width: 15,),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.copy),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                scanQRCode();
              },
              child: const Text("Scan QR Code"))
        ],
      ),
    );
  }
}
