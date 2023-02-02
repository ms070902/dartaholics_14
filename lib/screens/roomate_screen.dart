import 'package:flutter/material.dart';

class RoomMateScreen extends StatefulWidget {
  const RoomMateScreen({super.key});

  @override
  State<RoomMateScreen> createState() => _RoomMateScreenState();
}

class _RoomMateScreenState extends State<RoomMateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.red),
          width: double.infinity,
          child: Column(
            children: [Text("Hi")],
          )),
    );
  }
}
