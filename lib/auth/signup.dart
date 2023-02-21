import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/auth/login.dart';
import 'package:pdf_gen/homepage.dart';
import 'package:pdf_gen/utilities/utilities.dart';

class SignUpPage extends StatefulWidget {
  final String phoneNumber;
  const SignUpPage({super.key, required this.phoneNumber});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final phnController = TextEditingController();
  final pwdController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signUp() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: pwdController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(name: '${fnameController.text}+${lnameController.text}', ptUrl: '',),
          ));
    }).onError((error, stackTrace) {
      Utilities().toastMessage(error.toString(), color: Colors.red);
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              size: 30,
            )),
        title: const Text("SignUp"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: fnameController,
                decoration: const InputDecoration(
                    labelText: "First Name", border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: lnameController,
                decoration: const InputDecoration(
                    labelText: "Last Name", border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email", border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                // controller: phnController,
                initialValue: widget.phoneNumber,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    filled: true,
                    labelText: "Phone Number", border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pwdController,
                decoration: const InputDecoration(
                    labelText: "Password", border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Retype Password", border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signUp();
                    }
                  },
                  style: buttonStyle,
                  child: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("SignUp")),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have any account? "),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Signin",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
