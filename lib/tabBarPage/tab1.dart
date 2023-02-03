import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartaholics/screens/ad_det_screen.dart';
import 'package:dartaholics/widgets/post_thumbnail_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_ui/firestore_ui.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../widgets/griditem.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  final _db = FirebaseFirestore.instance.collection('flatmate_search');

  // Future<List<dynamic>> allUsers() async {
  //   final snapshot = await _db.collection('flatmateSearch').get();
  //   final userData = snapshot.docs.map((e) {
  //     print(e);
  //   }).toList();
  //   return userData;
  // }

  List itemList = ["Siddesh", "Shrushti", "Prasad", "Mihir", "Rahul", "Satish"];
  List itemListCost = ["4500", "5000", "8900", "7000", "6000", "4500"];
  List itemListMatching = ["45", "60", "55", "35", "20", "40"];
  List itemListOccupancy = [
    "Shared",
    "Single",
    "Shared",
    "Single",
    "Shared",
    "Single"
  ];
  List itemListAddress = [
    "Gowalia Tank Peddar Road, Mumbai,Borivli",
    "Ummer Harvest Vile Parle , Mumbai,Borivli,400057,",
    "Kalbadevi Road Kalbadevi, Mumbai,Borivli,400002",
    "Colony Kankaria, Ahmedabad,Borivli,380022,India",
    "Kandarpada Bhakti Complex Dahisar, Mumbai",
    " Andheri-kurla Rd Andheri, Mumbai,Borivli,400059"
  ];
  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.yellow,
            // <-- SEE HERE
            title: const Text(
              'You both have same preferences for:',
              style: TextStyle(fontSize: 15),
            ),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('• Night Owl'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('• Non Alcoholic'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('• Gym Freak'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                FirestoreAnimatedGrid(
                    physics: const NeverScrollableScrollPhysics(),
                    query: _db,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    // mainAxisExtent: 175,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    itemBuilder: (context, snapshot, animation, index) {
                      // print(snapshot!["contact"]);
                      // print("hi");
                      return FadeTransition(
                          opacity: animation,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: AdDetail(string: snapshot),
                                  type: PageTransitionType.fade,
                                ),
                              );
                            },
                            child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    // border: Border.all(width: 1),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.grey.withOpacity(0.4))
                                    ],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(8.0)),
                                                color: Colors.white,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "${snapshot!["userDPUrl"]}")),
                                                border: Border.all(width: 1)),
                                          ),
                                          Positioned(
                                              right: 5,
                                              bottom: 9,
                                              child: Container(
                                                width: 70,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      spreadRadius: 3,
                                                      blurRadius: 7,
                                                      offset: const Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, top: 7),
                                                  child: Flexible(
                                                      child: InkWell(
                                                    onTap: _showSimpleDialog,
                                                    child: const Text(
                                                      "50% matching",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )),
                                                ),
                                              ))
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${snapshot!["display_name"]}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${snapshot!["location"]}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          Column(
                                            children: [
                                              const Text("Rent"),
                                              Text("₹${snapshot["cost"]}")
                                            ],
                                          ),
                                          const Spacer(),
                                          Text(
                                            "|",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                          ),
                                          const Spacer(),
                                          Column(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              const Text("Occupancy"),
                                              Text("${snapshot["occupancy"]}")
                                            ],
                                          ),
                                          const Spacer(),
                                        ],
                                      )
                                      // Text("${itemList[index].ammenity}")
                                    ],
                                  ),
                                )),
                          ));
                    }
                    // itemBuilder: (
                    //   BuildContext context,
                    //   DocumentSnapshot snapshot,
                    //   Animation<double> animation,
                    //   int index,
                    // ) =>
                    //     FadeTransition(
                    //   opacity: animation,
                    //   child: MessageGridTile(
                    //     index: index,
                    //     document: snapshot,
                    //     onTap: _removeMessage,
                    //   ),
                    // ),
                    ),
                // GridView.builder(
                //     physics: const NeverScrollableScrollPhysics(),
                //     scrollDirection: Axis.vertical,
                //     itemCount: itemList.length,
                //     shrinkWrap: true,
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2,
                //         // mainAxisExtent: 175,
                //         childAspectRatio: 0.8,
                //         crossAxisSpacing: 5,
                //         mainAxisSpacing: 10),
                //     itemBuilder: (context, index) {
                //       return Container(
                //         height: 200,
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             // border: Border.all(width: 1),
                //             boxShadow: [
                //               BoxShadow(
                //                   blurRadius: 5,
                //                   color: Colors.grey.withOpacity(0.4))
                //             ],
                //             borderRadius: BorderRadius.circular(5)),
                //         child: Padding(
                //           padding: const EdgeInsets.only(top: 25),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Stack(
                //                 children: [
                //                   Container(
                //                     width: 80,
                //                     height: 80,
                //                     decoration: BoxDecoration(
                //                         borderRadius: const BorderRadius.all(
                //                             Radius.circular(8.0)),
                //                         color: Colors.white,
                //                         image: const DecorationImage(
                //                             image: NetworkImage(
                //                                 "https://instagram.fbom8-1.fna.fbcdn.net/v/t51.2885-19/297723103_131991389535733_3394524039300739566_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fbom8-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=xT6_f9nZgxsAX-l3nwC&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfChe5FyVRfOvxgpy-aBinnuw9rt39IRg1rDkNBC9X5nWw&oe=63E1BDB9&_nc_sid=8fd12b")),
                //                         border: Border.all(width: 1)),
                //                   ),
                //                   Positioned(
                //                       right: 5,
                //                       bottom: 9,
                //                       child: Container(
                //                         width: 70,
                //                         height: 20,
                //                         decoration: BoxDecoration(
                //                           boxShadow: [
                //                             BoxShadow(
                //                               color:
                //                                   Colors.black.withOpacity(0.5),
                //                               spreadRadius: 3,
                //                               blurRadius: 7,
                //                               offset: const Offset(0,
                //                                   3), // changes position of shadow
                //                             ),
                //                           ],
                //                         ),
                //                         child: Padding(
                //                           padding: const EdgeInsets.only(
                //                               left: 5, top: 7),
                //                           child: Flexible(
                //                               child: InkWell(
                //                             onTap: _showSimpleDialog,
                //                             child: Text(
                //                               "${itemListMatching[index]}% matching",
                //                               style: const TextStyle(
                //                                   fontSize: 10,
                //                                   color: Colors.white,
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                           )),
                //                         ),
                //                       ))
                //                 ],
                //               ),

                //               const SizedBox(
                //                 height: 5,
                //               ),
                //               Text(
                //                 "${itemList[index]}",
                //                 style: const TextStyle(
                //                     fontWeight: FontWeight.w400, fontSize: 20),
                //               ),
                //               const SizedBox(
                //                 height: 5,
                //               ),
                //               Text(
                //                 "${itemListAddress[index]}",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                     fontSize: 12,
                //                     color: Colors.black.withOpacity(0.5)),
                //               ),
                //               const SizedBox(
                //                 height: 20,
                //               ),
                //               Row(
                //                 children: [
                //                   const Spacer(),
                //                   Column(
                //                     children: [
                //                       const Text("Rent"),
                //                       Text("₹${itemListCost[index]}")
                //                     ],
                //                   ),
                //                   const Spacer(),
                //                   Text(
                //                     "|",
                //                     style: TextStyle(
                //                         fontSize: 25,
                //                         color: Colors.black.withOpacity(0.5)),
                //                   ),
                //                   const Spacer(),
                //                   Column(
                //                     // ignore: prefer_const_literals_to_create_immutables
                //                     children: [
                //                       const Text("Occupancy"),
                //                       const Text("Shared")
                //                     ],
                //                   ),
                //                   const Spacer(),
                //                 ],
                //               )
                //               // Text("${itemList[index].ammenity}")
                //             ],
                //           ),
                //         ),
                //       );
                //     }),)
              ],
            ),
          ),
        ),
      )),
    );
  }
}
