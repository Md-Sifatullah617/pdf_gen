import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/splash_sreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("Exit App"),
                    content: const Text("Do you really want to exit?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text("No")),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text("Yes"))
                    ],
                  )) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const SplashScreenn(),
      ),
    );
  }
}
