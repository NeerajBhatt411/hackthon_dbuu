import 'package:flutter/material.dart';

class AppTheme {
  // Color Palette for UI Design
  static const Color primaryColor = Colors.blue; // Deep Indigo
  static const Color secondaryColor = Color(0xFFA3BFFA); // Soft Blue
  static const Color headerTextColor = Color(0xFF2D3748); // Charcoal Grey
  static const Color subtextColor = Color(0xFF4A5568); // Slate Grey

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 22, // Heading Size
    fontWeight: FontWeight.bold,
    color: headerTextColor,
  );

  static const TextStyle subHeadingStyle = TextStyle(
    fontSize: 18, // Subheading
    fontWeight: FontWeight.w600,
    color: primaryColor,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16, // Body Text
    fontWeight: FontWeight.normal,
    color: subtextColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle TextWhite = TextStyle(
    fontSize: 16,
    color: Colors.white,

  );

  // Button Style
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
  );
}
