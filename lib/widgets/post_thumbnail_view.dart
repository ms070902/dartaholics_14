import 'package:dartaholics/state/flatmate_search/flatmate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostThumbnailView extends StatelessWidget {
  final Flatmate flatmate;
  final VoidCallback onTapped;
  const PostThumbnailView({
    Key? key,
    required this.flatmate,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDPUrl = FirebaseAuth.instance.currentUser!.photoURL;
    final userName = FirebaseAuth.instance.currentUser!.displayName;
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(width: 1),
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.4))
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
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.white,
                        border: Border.all(width: 1)),
                    child: Image.network(
                      userDPUrl ??
                          "https://cdn-icons-png.flaticon.com/512/6124/6124818.png",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 8,
                      child: Container(
                        width: 80,
                        height: 20,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ))
                ],
              ),

              const SizedBox(
                height: 5,
              ),
              Text(
                // "${itemList[index]}",
                userName ?? 'Flat Buddy',
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                // "${itemListAddress[index]}",
                flatmate.location,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, color: Colors.black.withOpacity(0.5)),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      Text('Rent'),
                      Text(flatmate.cost),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "|",
                    style: TextStyle(
                        fontSize: 25, color: Colors.black.withOpacity(0.5)),
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
      ),
    );
  }
}
