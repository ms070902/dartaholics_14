import 'package:dartaholics/providers/ad_created_provider.dart';
import 'package:dartaholics/screens/home_screen.dart';
import 'package:dartaholics/screens/login_signup_choice.dart';
import 'package:dartaholics/screens/navigation_screen.dart';
import 'package:dartaholics/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart' as prov;
import 'state/auth/backend/google_sign_in.dart';
import 'state/providers/card_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(prov.MultiProvider(
    providers: [
      prov.ChangeNotifierProvider(create: (_) => CardProvider()),
      prov.ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
      prov.ChangeNotifierProvider(create: (_) => LocationProvider()),
    ],
    child: const ProviderScope(
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dartaholics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        LoginSignupChoiceScreen.id: (context) =>
            const LoginSignupChoiceScreen(),
        NavigationScreen.id: (context) =>
            const NavigationScreen(currentIndex: 0),
      },
    );
  }
}
