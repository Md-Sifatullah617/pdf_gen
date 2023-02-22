import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider {
  final _googleSignIn = GoogleSignIn();

  //signInWithGoogle
  signInWithGoogle() async {
    //trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>['email']).signIn();

    //obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create new credential
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    //once signed in return the userCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  //signout
}
