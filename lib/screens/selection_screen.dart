import 'package:dartaholics/screens/from_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/ad_created_provider.dart';
import '../tabBarPage/tab1.dart';
import '../tabBarPage/tab2.dart';

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
  const AdWidget({Key? key}) : super(key: key);

  @override
  _AdWidgetState createState() => _AdWidgetState();
}

class _AdWidgetState extends State<AdWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      // appBar: AppBar(
      //   title: Text('Tab bar Without Appbar'),
      // ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                // height: 50,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TabBar(
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.black,
                        indicatorColor: Colors.white,
                        indicatorWeight: 1,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: 'ROOMMATES',
                          ),
                          Tab(
                            text: 'ROOMS',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    Tab1(),
                    Tab2(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
