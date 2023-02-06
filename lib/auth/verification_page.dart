import 'package:flutter/material.dart';

class VerificatorCode extends StatelessWidget {
  VerificatorCode({super.key});
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "+880 12345 67890", border: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
