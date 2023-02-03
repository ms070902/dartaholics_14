import 'dart:async';

import 'package:dartaholics/screens/login_signup_choice.dart';
import 'package:dartaholics/screens/navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = 'splash-scren';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.pushReplacementNamed(
            context,
            LoginSignupChoiceScreen.id,
          );
        } else {
          Navigator.pushReplacementNamed(context, NavigationScreen.id);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
              tag: 'logo',
              child: Image.asset(
                "assets/images/roommate.png",
                width: 200,
                height: 200,
              )),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Flatसाथी",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          )
        ],
      )),
    );
  }
}
