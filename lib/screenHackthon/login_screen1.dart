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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController _loginController = LoginController();
  String selectedRole = "Patient";

  bool _isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(email);
  }

  bool _isValidPassword(String password) => password.length >= 6;

  void _handleLogin() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackbar("Please fill in all fields.");
    } else if (!_isValidEmail(email)) {
      _showSnackbar("Invalid email format.");
    } else if (!_isValidPassword(password)) {
      _showSnackbar("Password must be at least 6 characters long.");
    } else {
      await _loginController.login(email, password, selectedRole, context);
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: AppTheme.subHeadingStyle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text("Welcome Back!", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
            const SizedBox(height: 10),
            Text("Log in to continue your journey.", style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
            const SizedBox(height: 40),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    customTextFormField(hintText: "Email", prefixIcon: Icons.email, controller: emailController),
                    const SizedBox(height: 20),
                    customTextFormField(hintText: "Password", prefixIcon: Icons.lock, controller: passwordController, obscureText: true),
                    const SizedBox(height: 20),
                    Text("Select Role", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey.shade700)),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedRole,
                      items: ["Patient", "Doctor"].map((role) => DropdownMenuItem(value: role, child: Text(role))).toList(),
                      onChanged: (newValue) => setState(() => selectedRole = newValue!),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Sign In", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(child: Text("OR", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700))),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen1())),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                side: BorderSide(color: AppTheme.primaryColor, width: 2),
              ),
              child: Text("Create Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
