import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/app_theme.dart';
class customTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController? controller;

  const customTextFormField({

    super.key, required this.hintText, required this.prefixIcon, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(hintText),
        prefixIcon: Icon(prefixIcon),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.subtextColor),borderRadius: BorderRadius.circular(12)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),);
  }
}