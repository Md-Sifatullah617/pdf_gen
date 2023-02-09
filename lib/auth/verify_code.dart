import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../homepage.dart';
import '../utilities/utilities.dart';

class VerifyCode extends StatelessWidget {
  VerifyCode({super.key});

  final bool loading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        Text(
            "We have sent a verification code to this ${phoneNumberController.text} number"),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              labelText: "Enter the Code", border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () async {
            final credential = PhoneAuthProvider.credential(
                verificationId: verifyId!,
                smsCode: phoneNumberController.text.toString());

            try {
              await auth.signInWithCredential(credential);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
              setState(() {
                loading = true;
              });
            } catch (e) {
              Utilities().toastMessage(e.toString(), color: Colors.red);
              setState(() {
                loading = false;
              });
            }
          },
          style: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size(double.infinity, 50))),
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const Text("Verify"),
        )
      ]),
    );
  }
}
