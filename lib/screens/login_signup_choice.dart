import 'package:dartaholics/screens/complete_profile_screen.dart';
import 'package:dartaholics/state/auth/backend/google_sign_in.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'navigation_screen.dart';

class LoginSignupChoiceScreen extends StatefulWidget {
  const LoginSignupChoiceScreen({super.key});
  static const String id = 'welcome-screen';

  @override
  State<LoginSignupChoiceScreen> createState() =>
      _LoginSignupChoiceScreenState();
}

class _LoginSignupChoiceScreenState extends State<LoginSignupChoiceScreen> {
  late Size size;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signup() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        // Getting users credential
        UserCredential result = await auth.signInWithCredential(authCredential);
        Map? user = result.additionalUserInfo!.profile;

        if (user != null) {
          bool isDone = await _googleLogin();
          if (!isDone) {
            await googleSignIn.disconnect();
          }
        } else {
          // FreqUsedWidgets.showSnackBar(context, "Something went wrong retry.");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> _googleLogin() async {
    try {
      Navigator.of(context).pop();

      return true;
    } catch (e) {
      return false;
    }
  }

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
              onPressed: () async {
                // final provider =
                //     Provider.of<GoogleSignInProvider>(context, listen: false);
                // var user = provider.signup(context);
                await signup();

                // if (user != null) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const NavigationScreen(),
                //     ),
                //   );
                // }
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
