import 'package:dartaholics/screens/login_signup_choice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/auth/backend/google_sign_in.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  List itemList = [
    'Edit Requirements',
    'Set Preferences',
    'Get Rent Agreement',
    'Remove Post'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://instagram.fbom8-1.fna.fbcdn.net/v/t51.2885-19/297723103_131991389535733_3394524039300739566_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fbom8-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=xT6_f9nZgxsAX-l3nwC&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfAyoWsZ1NSA3I6ABxCyM9xWlbY1GUGXWU6_F-sogVj1IA&oe=63DFC379&_nc_sid=8fd12b'),
                          radius: 25,
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: InkWell(
                              onTap: () {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                provider.logOut().then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LoginSignupChoiceScreen(),
                                      ));
                                });
                              },
                              child: Icon(Icons.logout)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Siddesh Shetty"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Male"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("More Controls"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.28,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text("${itemList[index]}  >"),
                          );
                        },
                        itemCount: 4,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Request Refund"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("You have not taken any plans yet."),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("About Us"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Know who we are and what are aim is."),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Contact Us"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("We are always here for you."),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("App Policy"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Learn why and what data we collect from you."),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                ],
              ),
            )),
      ),
    );
  }
}
