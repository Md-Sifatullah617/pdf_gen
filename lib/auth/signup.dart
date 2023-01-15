import 'package:flutter/material.dart';
import 'package:pdf_gen/auth/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50)
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("SignUp"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            const TextField(
              decoration: InputDecoration(
                  labelText: "First Name", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: "Last Name", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration:
                  InputDecoration(labelText: "Email", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: "Phone Number", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: "Retype Password", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                style: buttonStyle,
                child: const Text("SignUp"))
          ]),
        ),
      ),
    );
  }
}
