
import 'package:flutter/material.dart';
import 'package:untitled2/screens/signup_screen.dart';

import '../common/common_widgets.dart';
import '../controller/login_controller.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Login Screen"), centerTitle: true),
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
            // email field
            CommonWidget. buildTextFormField(
                controller:emailController,
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

            CommonWidget.buildButton(text: "Login", onPressed: () async {
              LoginController controller = LoginController();
             await  controller.login(emailController.text, passwordController.text, context);

            },),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              
                children: [
                  Text("Don't Have An Acoount ? "),
                  Text("SignUp",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            //Google Button
            GestureDetector(
              onTap: () async {
              LoginController controller = LoginController();
              await controller.signInWithGoogle(context);
              },
                child: Image.asset(
                  height: 40,
                    width: 40,
                   'assets/icons/google.png')),
          ],
        ),
      ),
    );
  }


}
