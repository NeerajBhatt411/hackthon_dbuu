
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
          "SignUp Screen", style: AppTheme.subHeadingStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's Begin Your Journey",
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
              Text("Select Role"),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedRole,
                items: ["Patient", "Doctor"].map((String role) {
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
              SizedBox(height: 20,),
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
                        builder: (context) => LoginScreen1(),
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
      ),
    );
  }
}
