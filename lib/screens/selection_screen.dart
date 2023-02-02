import 'package:dartaholics/screens/from_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/ad_created_provider.dart';

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
    return Consumer<LocationProvider>(
      builder: (context, value, child) {
        final locationData =
            Provider.of<LocationProvider>(context, listen: false);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: locationData.adCreated == true ? AdWidget() : NoAdWidget(),
          ),
        );
      },
    );
  }
}

class AdWidget extends StatefulWidget {
  const AdWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AdWidget> createState() => _AdWidgetState();
}

class _AdWidgetState extends State<AdWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Get Started",
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
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
    );
  }
}

class NoAdWidget extends StatefulWidget {
  const NoAdWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NoAdWidget> createState() => _NoAdWidgetState();
}

class _NoAdWidgetState extends State<NoAdWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
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
    );
  }
}
