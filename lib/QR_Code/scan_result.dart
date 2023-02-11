import 'package:flutter/material.dart';

class ScanResult extends StatelessWidget {
  const ScanResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Result")),
        body: Column(children: [
            ElevatedButton(onPressed: (){}, child: const Text("Copy"))
        ]),
    );
  }
}