import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/screenHackthon/onboarding_screen.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds and navigate to OnboardingScreen
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return; // Prevent navigation if widget is disposed

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/Splash screen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset("assets/icons/splash1-removebg-preview.png"),
        ),
      ),
    );
  }
}
