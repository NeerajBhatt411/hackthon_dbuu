import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/screens/login_screen.dart';

import '../util/toast.dart';

class SignupController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUpUser(String email, String password ,BuildContext context) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
          (value) {
            Ftoast.toastMessage(" Registration Successful");
            Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen(),));

          },
        )
        .onError((error, stackTrace) {
      Ftoast.toastMessage(error.toString());

    });
  }
}
