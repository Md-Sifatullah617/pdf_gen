import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/utilities/utilities.dart';

class VerificatorCode extends StatefulWidget {
  const VerificatorCode({super.key});

  @override
  State<VerificatorCode> createState() => _VerificatorCodeState();
}

class _VerificatorCodeState extends State<VerificatorCode> {
  bool loading = false;

  final phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      hintText: "+880 12345 67890", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      auth.verifyPhoneNumber(
                          phoneNumber: phoneNumberController.text.toString(),
                          verificationCompleted: (_) {
                            setState(() {
                              loading = false;
                            });
                          },
                          verificationFailed: (e) {
                            Utilities()
                                .toastMessage(e.toString(), color: Colors.red);
                            setState(() {
                              loading = false;
                            });
                          },
                          codeSent: (String verificationId, int? token) {
                            setState(() {
                              loading = false;
                            });
                          },
                          codeAutoRetrievalTimeout: (e) {
                            Utilities()
                                .toastMessage(e.toString(), color: Colors.red);
                            setState(() {
                              loading = false;
                            });
                          });
                    }
                  },
                  style: const ButtonStyle(
                      minimumSize:
                          MaterialStatePropertyAll(Size(double.infinity, 50))),
                  child: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Send Code"),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                    "We have sent a verification code to this ${phoneNumberController.text} number"),
                    const SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Enter the Code",
                          border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 30,),
                    ElevatedButton(onPressed: (){}, 
                    style: const ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 50))
                    ), child:const Text("Verify"),
                    )
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}
