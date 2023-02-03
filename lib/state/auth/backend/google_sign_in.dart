import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;
  Future<void> signup(BuildContext context) async {
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
          bool isDone = await _googleLogin(context);
          if (!isDone) {
            await googleSignIn.disconnect();
          }
        } else {
          // FreqUsedWidgets.showSnackBar(context, "Something went wrong retry.");
        }
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> _googleLogin(BuildContext context) async {
    try {
      Navigator.of(context).pop();

      return true;
    } catch (e) {
      return false;
    }
  }

  // Future googleLogin() async {

  //   try {
  //     final googleUser = await googleSignIn.signIn();
  //     if (googleUser == null) return;

  //     _user = googleUser;
  //     final googleAuth = await googleUser.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     print(e.toString());
  //   }

  //   notifyListeners();
  // }

  Future logOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
