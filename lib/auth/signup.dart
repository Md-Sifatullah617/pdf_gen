import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/auth/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phnController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle =
        ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50));
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
                controller: phnController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: "Phone Number", border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
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
                      _auth.createUserWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: pwdController.text.toString());
                    }
                  },
                  style: buttonStyle,
                  child: const Text("SignUp")),
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
