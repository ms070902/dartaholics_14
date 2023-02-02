import 'package:dartaholics/screens/login_signup_choice.dart';
import 'package:dartaholics/screens/swipe_screen.dart';
import 'package:dartaholics/state/auth/backend/google_sign_in.dart';
import 'package:dartaholics/state/providers/card_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardProvider()),
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dartaholics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginSignupChoiceScreen(),
    );
  }
}
