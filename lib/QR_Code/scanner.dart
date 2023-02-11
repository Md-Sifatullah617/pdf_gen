import 'package:flutter/material.dart';

class ScannerPdf extends StatefulWidget {
  const ScannerPdf({super.key});

  @override
  State<ScannerPdf> createState() => _ScannerPdfState();
}

class _ScannerPdfState extends State<ScannerPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Scanner"),
            centerTitle: true,
        ),
        body: Column(
            children: [
                Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                        Text("Place the QR code in the area", style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1),),
                        SizedBox(height: 10,),
                        Text("Scanning will start automatically")
                    ],
                )),
                Expanded(
                    flex: 4,
                    child: Container(color: Colors.green,)),
                Expanded(child: Container(color: Colors.blue,)),
            ],
        ),
    );
  }
}