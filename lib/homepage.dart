import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
                IconButton(onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                }, icon: const Icon(Icons.leave_bags_at_home))
            ],
            title: const Text("PDF_gen2.0"),
            centerTitle: true,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
            Text("Congo!")
        ]),
    );
  }
}