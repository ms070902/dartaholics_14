import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../widgets/swipe_card.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  late final MatchEngine _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Black",
    "Cyan",
    "Pink"
  ];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.black,
    Colors.cyan,
    Colors.pink,
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(
        SwipeItem(
            content: Content(
              text: _names[i],
              color: _colors[i],
            ),
            likeAction: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Liked ${_names[i]}"),
                duration: const Duration(milliseconds: 500),
              ));
            },
            nopeAction: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Nope ${_names[i]}"),
                duration: const Duration(milliseconds: 500),
              ));
            },
            onSlideUpdate: (SlideRegion? region) async {
              print("Region $region");
            }),
      );
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 550,
                child: SwipeCards(
                  matchEngine: _matchEngine,
                  onStackFinished: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Stack Finished"),
                      duration: Duration(milliseconds: 500),
                    ));
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: _swipeItems[index].content.color,
                      child: Text(
                        _swipeItems[index].content.text,
                        style: const TextStyle(fontSize: 100),
                      ),
                    );
                  },
                  itemChanged: (SwipeItem item, int index) {
                    print("item: ${item.content.text}, index: $index");
                  },
                  upSwipeAllowed: true,
                  fillSpace: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text("Nope"),
                    onPressed: () {
                      _matchEngine.currentItem!.nope();
                    },
                  ),
                  ElevatedButton(
                    child: const Text("Like"),
                    onPressed: () {
                      _matchEngine.currentItem!.like();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Content {
  final String text;
  final Color color;

  Content({required this.text, required this.color});
}
