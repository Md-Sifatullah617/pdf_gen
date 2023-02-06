import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/utilities/utilities.dart';

class VerificatorCode extends StatelessWidget {
  VerificatorCode({super.key});
  final bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        centerTitle: true,
        automaticallyImplyLeading: true,
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
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text.toString(),
                    verificationCompleted: (_) {},
                    verificationFailed: (e) {
                      Utilities().toastMessage(e.toString(), color: Colors.red);
                    },
                    codeSent: (String verificationId, int? token){
                        
                    },
                    codeAutoRetrievalTimeout: (e) {
                      Utilities().toastMessage(e.toString(), color: Colors.red);
                    });
              },
              style: const ButtonStyle(
                  minimumSize:
                      MaterialStatePropertyAll(Size(double.infinity, 50))),
              child: const Text("Send Code"),
            )
          ],
        ),
      ),
    );
  }
}
