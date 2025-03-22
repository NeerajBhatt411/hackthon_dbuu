import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/screenHackthon/patient_bottom_bar.dart';
import 'package:untitled2/screenHackthon/doctor_home_screen.dart';

import '../util/toast.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(
      String email, String password, String role, BuildContext context) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Ftoast.toastMessage("Login Successfully");


      if (role == "Patient") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PatientBottomBar(),
          ),
        );
      } else if (role == "Doctor") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorHomeScreen(),
          ),
        );
      }
    }).onError((error, stackTrace) {
      Ftoast.toastMessage(error.toString());
    });
  }
}