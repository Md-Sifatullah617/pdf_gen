import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/auth/login.dart';
import 'package:pdf_gen/homepage.dart';

class SplashScreenn extends StatefulWidget {
  const SplashScreenn({super.key});

  @override
  State<SplashScreenn> createState() => _SplashScreennState();
}

class _SplashScreennState extends State<SplashScreenn> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    final user = _auth.currentUser;
    if(user!=null){
        Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
    }else{
        Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: const Color.fromARGB(255, 241, 241, 241),
      child: const Image(image: AssetImage("assets/images/logo.gif")),
    );
  }
}
