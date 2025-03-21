import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/common/common_widgets.dart';
import 'package:untitled2/controller/login_controller.dart';
import 'package:untitled2/screens/login_screen.dart';
import 'package:untitled2/screens/products_screen.dart';
import 'package:untitled2/screens/show_product.dart';
import 'package:untitled2/screens/users_screen.dart';

class HomeScreen extends StatefulWidget {

   HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomeScreen"),centerTitle: true,
        actions: [
          ElevatedButton(onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.push(context ,MaterialPageRoute(builder: (context) => LoginScreen(),));

          }, child: Icon(Icons.login_outlined))
        ],

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SizedBox(height: 16,),
          CommonWidget.buildButton(text: "ADD PRODUCTS", onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen(),));
          }),
          SizedBox(height: 16,),

          CommonWidget.buildButton(text: "SHOW PRODUCTS", onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShowProduct(),));
          }),
          CommonWidget.buildButton(text: "SHOW Users", onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UsersScreen(),));
          }),

        ],
      ),
    );
  }
}
