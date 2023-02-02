import 'package:dartaholics/screens/complete_profile_screen.dart';
import 'package:dartaholics/screens/room_posts.dart';
import 'package:dartaholics/screens/roommate_ads_screen.dart';
import 'package:flutter/material.dart';

class FromBottomNavBar extends StatefulWidget {
  const FromBottomNavBar({super.key, required this.searchingRoomMate});
  final bool searchingRoomMate;

  @override
  State<FromBottomNavBar> createState() => _FromBottomNavBarState();
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
class _FromBottomNavBarState extends State<FromBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.searchingRoomMate ? 0 : 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Post Requirements"),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.filter_list_outlined),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "HAVE FLAT",
              ),
              Tab(
                text: "NEED FLAT",
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
