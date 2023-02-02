import 'package:dartaholics/screens/complete_profile_screen.dart';
import 'package:dartaholics/screens/from_address_screen.dart';
import 'package:dartaholics/screens/selection_screen.dart';
import 'package:dartaholics/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  var _searchtextcontroller = TextEditingController();
  var _searchKey = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://instagram.fbom8-1.fna.fbcdn.net/v/t51.2885-19/297723103_131991389535733_3394524039300739566_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fbom8-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=xT6_f9nZgxsAX-l3nwC&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfAyoWsZ1NSA3I6ABxCyM9xWlbY1GUGXWU6_F-sogVj1IA&oe=63DFC379&_nc_sid=8fd12b'),
                        radius: 25,
                      ),
                      Spacer(),
                      Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "Find Your\nPerfect FlatMate",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "Having a right FlatMate is a bliss,and we're on a mission to help you find that",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SearchBar(
                      height: 40,
                      width: double.infinity,
                      controller: _searchtextcontroller,
                      title: "Search for a location",
                      onChanged: () {
                        if (_searchKey != _searchtextcontroller.text) {
                          setState(() {
                            _searchKey = _searchtextcontroller.text;
                          });

                          // WidgetsBinding.instance.addPostFrameCallback((_) {});
                        }
                      },
                      onTap: () {
                        print("Hello");
                        print(_searchtextcontroller.text);
                        Navigator.push(
                          context,
                          PageTransition(
                            child: FromAddressScreen(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
