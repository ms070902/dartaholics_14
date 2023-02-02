import 'package:dartaholics/state/auth/models/auth_result.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../constants/constants.dart';


class Authenticator {
  const Authenticator();

  UserId? get userId => FirebaseAuth.instance.currentUser!.uid;
  String get displayName => FirebaseAuth.instance.currentUser!.displayName ?? '';
  bool get isAlreadyLoggedIn => userId != null;
  String? get email => FirebaseAuth.instance.currentUser?.email;

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      Constants.emailScope,
    ]);
    ///This will display the google accounts dialog to select the account for logging in
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      ///if this field is null it means that user has aborted google sign in
      ///and dialog is killed
      return AuthResult.aborted;
    }

    final googleAuth = await signInAccount.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(
        oauthCredentials,
      );
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }

  }
}