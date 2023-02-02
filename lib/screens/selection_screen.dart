import 'package:dartaholics/screens/from_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RoomRommateSelectionScreen extends StatefulWidget {
  const RoomRommateSelectionScreen({super.key, required this.location});

  final String location;
  @override
  State<RoomRommateSelectionScreen> createState() =>
      _RoomRommateSelectionScreenState();
}

class _RoomRommateSelectionScreenState
    extends State<RoomRommateSelectionScreen> {
  Map userlocation = {};

  void getLatLong(String place) async {
    final uri = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$place&format=json');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      if (data.length > 0) {
        var latitude = data[0]['lat'];
        var longitude = data[0]['lon'];
        Map location = {'latitude': '$latitude', 'longitude': '$longitude'};
        userlocation = location;
        setState(() {});
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    getLatLong(widget.location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getLatLong(widget.location);
    // print("yes");
    // print(widget.location);
    // print(userlocation);
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
            Image.asset(
              "assets/roommate.png",
              width: 100,
              height: 100,
            ),
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
                              builder: (context) => const FromBottomNavBar(
                                    searchingRoomMate: false,
                                  )));
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
                              builder: (context) => const FromBottomNavBar(
                                    searchingRoomMate: true,
                                  )));
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
