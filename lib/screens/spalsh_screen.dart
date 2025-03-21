//
// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled2/screens/home_screen.dart';
// import 'package:untitled2/screens/login_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     Timer(Duration(seconds: 3),() {
//       final _auth = FirebaseAuth.instance;
//       if(_auth.currentUser==null){
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => LoginScreen(),
//             ));
//       }
//       else{
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HomeScreen(),
//             ));
//
//       }
//     },);
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           "firebase Testing ",
//           style: TextStyle(fontSize: 30),
//         ),
//       ),
//     );
//   }
// }
