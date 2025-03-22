import 'package:flutter/material.dart';
import 'package:untitled2/util/app_theme.dart';
import '../common/common_widgets.dart';
import '../controller/signup_controller.dart';
import '../util/toast.dart';
import 'login_screen1.dart';

class SignupScreen1 extends StatefulWidget {
  const SignupScreen1({super.key});

  @override
  State<SignupScreen1> createState() => _SignupScreen1State();
}

class _SignupScreen1State extends State<SignupScreen1> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String userRole = "Patient";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create Your Account",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
            const SizedBox(height: 20),

            // Username Input
            CommonWidget.buildTextFormField(
              controller: nameController,
              prefixIcon: Icons.person,
              labelText: "Full Name",
              fillColor: Colors.grey[200],
            ),
            const SizedBox(height: 16),

            // Email Input
            CommonWidget.buildTextFormField(
              controller: emailController,
              prefixIcon: Icons.email,
              labelText: "Email Address",
              fillColor: Colors.grey[200],
            ),
            const SizedBox(height: 16),

            // Password Input
            CommonWidget.buildTextFormField(
              controller: passwordController,
              prefixIcon: Icons.lock,
              labelText: "Password",
              suffixIocn: Icons.visibility_off_outlined,
              fillColor: Colors.grey[200],
            ),
            const SizedBox(height: 16),

            // Role Selection
            const Text("Select Your Role",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: userRole,
              items: ["Patient", "Doctor"].map((role) => DropdownMenuItem(value: role, child: Text(role))).toList(),
              onChanged: (newValue) => setState(() => userRole = newValue!),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            // Signup Button
            CommonWidget.buildButton(
              text: "Register",
              onPressed: () async {
                Ftoast.toastMessage("Processing...");
                SignupController controller = SignupController();
                await controller.signUpUser(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                  nameController.text.trim(),
                  context,
                );
              },
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
            ),
            const SizedBox(height: 20),

            // Redirect to Login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? ", style: TextStyle(fontSize: 16)),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen1())),
                  child: const Text("Login",
                      style: TextStyle(
                          color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}