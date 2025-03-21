
import 'package:flutter/material.dart';


import '../common/common_widgets.dart';
import '../controller/signup_controller.dart';
import '../util/toast.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignUp Screen",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Login Screen",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            // username field
            CommonWidget.buildTextFormField(
                controller: nameController,
                prefixIcon: Icons.person,
                labelText: "Username"),
            SizedBox(
              height: 16,
            ),

            // email field
            CommonWidget.buildTextFormField(
                controller: emailController,
                prefixIcon: Icons.email,
                labelText: "Email"),
            SizedBox(
              height: 16,
            ),

            // password field
            CommonWidget.buildTextFormField(
                controller: passwordController,
                prefixIcon: Icons.lock,
                labelText: "password",
                suffixIocn: Icons.visibility_off_outlined),
            // login button
            SizedBox(
              height: 16,
            ),

            CommonWidget.buildButton(
              text: "Create Account ",
              onPressed: ()  async {
                Ftoast.toastMessage("Tapped");
                SignupController controller = SignupController();
                await controller.signUpUser(emailController.text.toString(),
                    passwordController.text.toString(), nameController.text.toString() ,context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have An Acoount ? "),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
