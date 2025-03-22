import 'package:flutter/material.dart';
import 'package:untitled2/util/app_theme.dart';
import '../common/common_widgets.dart';
import '../controller/signup_controller.dart';
import '../util/toast.dart';
import 'login_screen1.dart';

class SignupScreen1 extends StatefulWidget {
  const SignupScreen1({super.key});

  @override
  State<SignupScreen1> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String selectedRole = "Patient";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: AppTheme.subHeadingStyle.copyWith(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Text
              Text(
                "Let's Begin Your Journey",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),

              // Username Field
              CommonWidget.buildTextFormField(
                controller: nameController,
                prefixIcon: Icons.person,
                labelText: "Username",
                fillColor: Colors.grey[200],
              ),
              SizedBox(height: 16),

              // Email Field
              CommonWidget.buildTextFormField(
                controller: emailController,
                prefixIcon: Icons.email,
                labelText: "Email",
                fillColor: Colors.grey[200],
              ),
              SizedBox(height: 16),

              // Password Field
              CommonWidget.buildTextFormField(
                controller: passwordController,
                prefixIcon: Icons.lock,
                labelText: "Password",
                suffixIocn: Icons.visibility_off_outlined,
                fillColor: Colors.grey[200],
              ),
              SizedBox(height: 16),

              // Role Selection
              Text(
                "Select Role",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
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
                      style: TextStyle(fontSize: 16),
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
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              SizedBox(height: 20),

              // Create Account Button
              CommonWidget.buildButton(
                text: "Create Account",
                onPressed: () async {
                  Ftoast.toastMessage("Tapped");
                  SignupController controller = SignupController();
                  await controller.signUpUser(
                    emailController.text.toString(),
                    passwordController.text.toString(),
                    nameController.text.toString(),
                    context,
                  );
                },
                backgroundColor: Colors.blueAccent,
                textColor: Colors.white,
              ),
              SizedBox(height: 20),

              // Login Redirect
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen1(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have An Account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}