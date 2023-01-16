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
                }, icon: const Icon(Icons.exit_to_app))
            ],
            automaticallyImplyLeading: true,
            title: const Text("PDF_gen2.0"),
            centerTitle: true,
        ),
        drawer: Drawer(
            child: ListView(
                children: const [
                    UserAccountsDrawerHeader(accountName: Text("Md. Sifatullah"), accountEmail: Text("sifatullahsanowar1@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/dp.jpg")),
                    ),
                    ListTile(
                        leading: Icon(Icons.wallet),
                        title: Text("Donate us"),
                    ),
                    ListTile(
                        leading: Icon(Icons.info),
                        title: Text("About us"),
                    ),
                ],
            ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
            Text("Congo!")
        ]),
    );
  }
}