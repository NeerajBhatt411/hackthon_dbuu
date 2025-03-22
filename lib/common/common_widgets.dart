import 'package:flutter/material.dart';

class CommonWidget {
  // Method to build a button
  static SizedBox buildButton({
    required String text,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.blue, // Default blue color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: textColor ?? Colors.white, // Default white text color
          ),
        ),
      ),
    );
  }

  // Method to build a text form field
  static TextFormField buildTextFormField({
    required final controller,
    required String labelText,
    required IconData prefixIcon,
    IconData? suffixIocn,
    Color? fillColor,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16), // Rounded corners
        ),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIocn != null ? Icon(suffixIocn) : null,
        filled: fillColor != null, // Enable fill color if provided
        fillColor: fillColor, // Set fill color
      ),
    );
  }
}