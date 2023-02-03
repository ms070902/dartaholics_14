import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
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
    "assets/images/owl.png",
    "assets/images/sun.png",
    "assets/images/book-stack.png",
    "assets/images/fitness.png",
    "assets/images/sports.png",
    "assets/images/travel.png",
    "assets/images/dance.png",
    "assets/images/vegan.png",
    "assets/images/non-alcoholic-beer.png",
    "assets/images/musical-note.png",
    "assets/images/non-smoking-room.png",
    "assets/images/cat.png",
  ];

  @override
  Widget build(BuildContext context) {
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 150,
                ),
                shrinkWrap: true,
                itemCount: preferences.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(prefImage[index]),
                      ),
                      Text(
                        preferences[index],
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
