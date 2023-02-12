import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class ScannerPdf extends StatefulWidget {
  const ScannerPdf({super.key});

  @override
  State<ScannerPdf> createState() => _ScannerPdfState();
}

class _ScannerPdfState extends State<ScannerPdf> {
  final txtController = TextEditingController();
  int seletedItem = 0;
  void onItemTapped(int index) {
    setState(() {
      seletedItem = index;
    });
  }

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
        BottomNavigationBarItem(icon: Icon(Icons.scanner), label: "generator",
        
        ),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "Scanner"),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: txtController,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
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
      ),
    );
  }
}
