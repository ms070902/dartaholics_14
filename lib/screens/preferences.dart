import 'package:dartaholics/screens/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../providers/ad_created_provider.dart';
import '../state/auth/models/itemClass.dart';
import '../widgets/griditem.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  late List<Item> loadlist;
  late List<Item> selectedList;
  List preferences = [
    "Night Owl",
    "Early Bird",
    "Studious",
    "Fitness Freak",
    "Sporty",
    "Wanderer",
    "Party Lover",
    "Vegan",
    "Non-Alcoholic",
    "Music Lover",
    "Non-Smoker",
    "Pet Lover",
  ];
  List prefImage = [
    "",
    "",
    "",
    "",
    "",
    "",
    "assets/images/musical-note.png",
    "assets/images/non-smoking-room.png",
    "assets/images/cat.png",
  ];
  @override
  void initState() {
    super.initState();
    loadList();
  }

  loadList() {
    loadlist = [];
    selectedList = [];
    loadlist.add(Item("assets/images/owl.png", 1, 'Night owl'));
    loadlist.add(Item("assets/images/sun.png", 2, 'Early Bird'));
    loadlist.add(Item("assets/images/book-stack.png", 3, 'Studious'));
    loadlist.add(Item("assets/images/fitness.png", 4, 'FitnessFreak'));
    loadlist.add(Item("assets/images/sports.png", 5, 'Sporty'));
    loadlist.add(Item("assets/images/travel.png", 6, 'Wanderer'));
    loadlist.add(Item("assets/images/dance.png", 7, 'Party Lover'));
    loadlist.add(Item("assets/images/vegan.png", 8, 'Vegan'));
    loadlist
        .add(Item("assets/images/non-alcoholic-beer.png", 9, 'Non-Alcoholic'));
    loadlist.add(Item("assets/images/non-smoking-room.png", 10, 'Music Lover'));
    loadlist.add(Item("assets/images/musical-note.png", 11, 'Non-Smoker'));
    loadlist.add(Item("assets/images/cat.png", 12, 'Pet Lover'));
  }

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Center(
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "What do you like?",
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: loadlist.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 100,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: GridItem(
                                item: loadlist[index],
                                isSelected: (bool value) {
                                  setState(() {
                                    if (value) {
                                      selectedList.add(loadlist[index]);
                                    } else {
                                      selectedList.remove(loadlist[index]);
                                    }
                                  });
                                  // print("$index : $value");
                                },
                                key: Key(loadlist[index].rank.toString())),
                          ),
                          Text("${loadlist[index].ammenity}")
                        ],
                      ),
                    );
                  }),
              // GridView.builder(
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3,
              //     mainAxisExtent: 150,
              //   ),
              //   shrinkWrap: true,
              //   itemCount: preferences.length,
              //   itemBuilder: ((context, index) {
              //     return Column(
              //       children: [
              //         CircleAvatar(
              //           radius: 50,
              //           backgroundImage: AssetImage(prefImage[index]),
              //         ),
              //         Text(
              //           preferences[index],
              //           style: const TextStyle(
              //             fontSize: 17,
              //           ),
              //         ),
              //       ],
              //     );
              //   }),
              // ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () async {
                    locationData.changeAdStatus(true);
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const NavigationScreen(currentIndex: 1),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Submit',
                      style: TextStyle(letterSpacing: 2, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
