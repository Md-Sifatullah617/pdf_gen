import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pdf_gen/utilities/utilities.dart';

class GoogleSignInProvider {
  final _googleSignIn = GoogleSignIn();

  //signInWithGoogle
  Future signInWithGoogle(context) async {
    try {
      //trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        //obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        //create new credential
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        //once signed in return the userCredential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      Utilities().toastMessage(e.toString(), color: Colors.red);
    }
  }
  //signout
}
