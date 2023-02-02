import 'package:dartaholics/screens/complete_profile_screen.dart';
import 'package:dartaholics/screens/room_posts.dart';
import 'package:dartaholics/screens/roommate_ads_screen.dart';
import 'package:flutter/material.dart';

class FromAddressScreen extends StatefulWidget {
  const FromAddressScreen({super.key});

  @override
  State<FromAddressScreen> createState() => _FromAddressScreenState();
}

// class _FromAddressScreenState extends State<FromAddressScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: true,
//           title: const Text("Search Results"),
//
//         ),
//         body: Container(
//             child: Column(
//           children: [

//           ],
//         )),
//       ),
//     );
//   }
// }
class _FromAddressScreenState extends State<FromAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search Results"),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.filter_list_outlined),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home_filled),
                text: "Room",
              ),
              Tab(
                icon: Icon(Icons.people),
                text: "Roommates",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[RoomAds(), RoomMateAds()],
        ),
      ),
    );
  }
}
