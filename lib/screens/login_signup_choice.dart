import 'package:dartaholics/screens/complete_profile_screen.dart';
import 'package:dartaholics/state/auth/backend/google_sign_in.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'navigation_screen.dart';

class LoginSignupChoiceScreen extends StatefulWidget {
  const LoginSignupChoiceScreen({super.key});

  @override
  State<LoginSignupChoiceScreen> createState() =>
      _LoginSignupChoiceScreenState();
}

class _LoginSignupChoiceScreenState extends State<LoginSignupChoiceScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "assets/images/20944201.jpg",
              ),
            ),
            const Spacer(),
            const Text(
              "FlatMate",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                maximumSize: const Size(double.infinity, 150),
              ),
              icon: const FaIcon(FontAwesomeIcons.google),
              label: const Text(
                "Sign Up With Google",
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                var user = provider.googleLogin();

                if (user != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationScreen(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: RichText(
                text: const TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Log In",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
