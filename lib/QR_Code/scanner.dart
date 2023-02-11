import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

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
                        Text("Scanning will start automatically",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                        ),)
                    ],
                )),
                Expanded(
                    flex: 4,
                    child: MobileScanner(onDetect: (barcodes) {
                      
                    },),),
                Expanded(child: Container(
                    alignment: Alignment.center,
                    child: const Text("Developed by Md. Sifatullah",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54
                    ),),
                )),
            ],
        ),
    );
  }
}