import 'package:dartaholics/screens/swipe_screen.dart';
import 'package:flutter/material.dart';

import 'login_signup_choice.dart';


class RoomRommateSelectionScreen extends StatefulWidget {
  const RoomRommateSelectionScreen({super.key});
  @override
  State<RoomRommateSelectionScreen> createState() =>
      _RoomRommateSelectionScreenState();
}

class _RoomRommateSelectionScreenState
    extends State<RoomRommateSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Get Started by selecting what you are looking for",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset("assets/images/8458.jpg"),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoginSignupChoiceScreen()));
                    },
                    child: const Text("Room/Apartment"),
                  ),
                  const SizedBox(width: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SwipeScreen()));
                    },
                    child: const Text("Roommate"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
