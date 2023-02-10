import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/QR_Code/scanner.dart';
import 'package:pdf_gen/auth/login.dart';
import 'package:pdf_gen/utilities/utilities.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //This code is for exit pop up but not complete one
    // Future<bool> showExitPopup() async {
    //   return await showDialog(
    //           context: context,
    //           builder: (context) => AlertDialog(
    //                 title: const Text("Exit"),
    //                 content: const Text("Are you sure!"),
    //                 actions: [
    //                   TextButton(
    //                       onPressed: () {
    //                         Navigator.of(context).pop(false);
    //                       },
    //                       child: const Text("No")),
    //                   TextButton(onPressed: () {
    //                     Navigator.of(context).pop(true);
    //                   }, child: const Text("Yes"))
    //                 ],
    //               )) ??
    //       false;
    // }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              _auth
                  .signOut()
                  .then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage())))
                  .onError((error, stackTrace) => Utilities()
                      .toastMessage(error.toString(), color: Colors.red));
            },
          )
        ],
        automaticallyImplyLeading: true,
        title: const Text("PDF_gen2.0"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text("Md. Sifatullah"),
              accountEmail: Text("sifatullahsanowar1@gmail.com"),
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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScannerPdf()));
              },
              child: const Image(
                  image: AssetImage("assets/images/qr_Scanner.gif"))),
        ]),
      ),
    );
  }
}
