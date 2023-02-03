import 'package:dartaholics/screens/home_screen.dart';
import 'package:dartaholics/screens/roomate_screen.dart';
import 'package:dartaholics/screens/selection_screen.dart';
import 'package:dartaholics/widgets/post_grid_view.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bottom_nav.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});
  static const String id = 'nav-screen';

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: getBody(),
      bottomNavigationBar: _buildBottomBar(),
    ));
  }

  Widget getBody() {
    List<Widget> pages = [
      const HomeScreen(),
      RoomRommateSelectionScreen(
        location: '',
      ),
      MoreScreen()
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 55,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.apps),
          title: const Text('Home'),
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.people),
          title: const Text('My Matches'),
          activeColor: Colors.purpleAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.more_horiz),
          title: const Text(
            'More',
          ),
          activeColor: Colors.blueAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
