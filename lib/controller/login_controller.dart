
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/home_screen.dart';
import '../util/toast.dart';

class LoginController {
// function to login user using email and password

  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> login(
      String email, String password, BuildContext context) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        Ftoast.toastMessage("Login Successfully");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      },
    ).onError(
      (error, stackTrace) {
        Ftoast.toastMessage(error.toString());
      },
    );
  }

  // function to login using Google
  Future<void> signInWithGoogle(BuildContext context) async {
    //select user account
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      Ftoast.toastMessage("User Successfully Logged in with Google ");
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen(),));
    },).onError((error, stackTrace) {
      Ftoast.toastMessage("usser failed to login ${error.toString()}");

    },);
  }


  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
