import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/models/user_model.dart';
import 'package:untitled2/screens/login_screen.dart';

import '../screenHackthon/login_screen1.dart';
import '../util/toast.dart';

class SignupController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> signUpUser(
      String email, String password, String name, BuildContext context) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) async {
        Ftoast.toastMessage(" Registration Successful");
        String userId = value.user!.uid;
        userModel user = userModel(id: userId, email: email, name: name);
        _firestore.collection("Users").doc(userId).set(user.toMap()).then((value){
          debugPrint("Date stored sucesssfully");
        });

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen1(),
            ));
      },
    ).onError((error, stackTrace) {
      Ftoast.toastMessage(error.toString());
    });
  }


  Future<List<userModel>> fetchUsers() async {
   final users = await _firestore.collection("Users").get();
   final allUsers = users.docs.map((users)=>userModel.toModel(users.data())).toList();
    return allUsers;
  }


}
