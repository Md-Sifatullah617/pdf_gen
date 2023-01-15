import 'package:flutter/material.dart';
import 'package:pdf_gen/auth/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(children: [
          const TextField(
            decoration: InputDecoration(
                labelText: "Email/Phone number", border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 30,
          ),
          const TextField(
            decoration: InputDecoration(
                labelText: "Password", border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {},
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
    );
  }
}
