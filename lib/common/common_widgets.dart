import 'package:flutter/material.dart';
class CommonWidget{
  static SizedBox buildButton(
      {required String text, required VoidCallback onPressed}) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Yeh line button ka background blue karegi
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white, // White text taaki blue background pe achha dikhe
          ),
        ),
      ),
    );
  }

  static  TextFormField buildTextFormField(
      {required final controller,
        required String labelText,
        required IconData prefixIcon,
        IconData? suffixIocn}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        prefixIcon: Icon(prefixIcon),
        suffixIcon:
        suffixIocn != null ? Icon(Icons.visibility_off_outlined) : null,
      ),
    );
  }
}