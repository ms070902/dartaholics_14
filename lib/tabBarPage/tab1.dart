import 'package:flutter/material.dart';

import '../widgets/griditem.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  List itemList = ["Siddesh", "Shrushti", "Prasad", "Mihir", "Rahul", "Satish"];
  List itemListCost = ["4500", "5000", "8900", "7000", "6000", "4500"];
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: itemList.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // mainAxisExtent: 175,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Container(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0)),
                                      color: Colors.white,
                                      border: Border.all(width: 1)),
                                  child: Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/6124/6124818.png",
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
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
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.only(left: 5, top: 7),
                                        child: Flexible(
                                            child: Text(
                                          "55% matching",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ))
                              ],
                            ),

                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${itemList[index]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${itemListAddress[index]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Column(
                                  children: [
                                    Text("Rent"),
                                    Text("₹${itemListCost[index]}")
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "|",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                const Spacer(),
                                Column(
                                  children: [Text("Occupancy"), Text("Shared")],
                                ),
                                const Spacer(),
                              ],
                            )
                            // Text("${itemList[index].ammenity}")
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
