import 'package:flutter/material.dart';
import 'package:untitled2/screenHackthon/doctor_home_screen.dart';
import 'package:untitled2/screenHackthon/patient_bottom_bar.dart';
import 'package:untitled2/screenHackthon/signup_screen1.dart';

import '../common/text_form_field.dart';
import '../util/app_theme.dart';
import 'patient_home_screen.dart'; // Patient ka homepage
// Admin ka homepage

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedRole = "Patient";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN SCREEN", style: AppTheme.subHeadingStyle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("Welcome Back ! ", style: AppTheme.headingStyle),
                SizedBox(height: 10),
                Text(
                  "Take a deep breath and log in to continue your wellness journey",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                customTextFormField(
                  hintText: "Email",
                  prefixIcon: Icons.email,
                  controller: emailController,
                ),
                SizedBox(height: 20),
                customTextFormField(
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  controller: passwordController,
                ),
                SizedBox(height: 10),
                Text("Select Role"),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  items: ["Patient", "Admin"].map((String role) {
                    return DropdownMenuItem(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRole = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forget Password",
                        style: AppTheme.bodyTextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please Enter required Fields"),
                        backgroundColor: Colors.black,
                      ));
                    } else {
                      // Role ke basis par different homepage navigate karna
                      if (selectedRole == "Patient") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientBottomBar(),
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorHomeScreen(),
                          ),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Login Success"),
                        backgroundColor: Colors.green,
                      ));
                    }
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: AppTheme.TextWhite,
                      ),
                    ),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen1()),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: AppTheme.TextWhite,
                      ),
                    ),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}