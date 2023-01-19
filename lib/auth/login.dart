import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/auth/signup.dart';
import 'package:pdf_gen/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    pwdController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle =
        ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                    labelText: "Email/Phone number",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your email/phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: pwdController,
                decoration: const InputDecoration(
                    labelText: "Password", border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your password";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Forget Password?"),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    
                  }
                },
                style: buttonStyle,
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have any account? "),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: const Text(
                      "Signup",
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
