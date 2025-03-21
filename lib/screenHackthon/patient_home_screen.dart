import 'package:flutter/material.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 400,
              width: double.infinity,
              color: Color(0xffd1e8f1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    Text("Welcome Neeraj",style: TextStyle(color: Colors.black),),

                  ],)
                ],
              ),
            )
      
          ],),
        ),
      ),
    );

  }
}
