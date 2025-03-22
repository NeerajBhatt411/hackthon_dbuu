import 'package:flutter/material.dart';
import '../util/app_theme.dart';

class customTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final bool filled;
  final Color? fillColor;

  const customTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.controller,
    this.obscureText = false,
    this.filled = false,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText, // Changed from label to hintText
        prefixIcon: Icon(prefixIcon),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.subtextColor),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        filled: filled,
        fillColor: fillColor,
      ),
    );
  }
}