import 'package:flutter/material.dart';
import 'package:untitled2/screenHackthon/doctor_home_screen.dart';
import 'package:untitled2/screenHackthon/patient_bottom_bar.dart';
import 'package:untitled2/screenHackthon/signup_screen1.dart';
import '../common/text_form_field.dart';
import '../controller/login_controller.dart';
import '../util/app_theme.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedRole = "Patient";
  final LoginController _loginController = LoginController();

  // Email validation function
  bool _validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  // Password validation function
  bool _validatePassword(String password) {
    return password.length >= 6; // Minimum 6 characters
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN SCREEN", style: AppTheme.subHeadingStyle),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Take a deep breath and log in to continue your wellness journey.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 40),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
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
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Select Role",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: selectedRole,
                          items: ["Patient", "Doctor"].map((String role) {
                            return DropdownMenuItem(
                              value: role,
                              child: Text(
                                role,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedRole = newValue!;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () async {
                            String email = emailController.text.trim();
                            String password = passwordController.text.trim();

                            // Validate email and password
                            if (email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Please enter email and password"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else if (!_validateEmail(email)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Please enter a valid email"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else if (!_validatePassword(password)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Password must be at least 6 characters"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              // Call LoginController to authenticate
                              await _loginController.login(email, password, selectedRole, context);
                            }
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [AppTheme.primaryColor, Colors.blue.shade700],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Center(
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       // Add your forgot password logic here
                        //     },
                        //     child: Text(
                        //       "Forgot Password?",
                        //       style: TextStyle(
                        //         color: AppTheme.primaryColor,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 14,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "OR",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen1()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppTheme.primaryColor,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}