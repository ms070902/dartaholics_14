import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:dartaholics/state/auth/constants/firebase_collection_name.dart';
import 'package:dartaholics/state/user_info/backend/user_payload.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartaholics/screens/navigation_screen.dart';
import 'package:dartaholics/screens/selection_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

import '../widgets/custom_bottom_nav.dart';
import 'home_screen.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  var _phoneNumberController = TextEditingController();
  bool _validPhoneNumber = false;
// Initial Selected Value
  String dropdownvalue = 'Mumbai';
  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String? lat = "";
  String long = "";
  String choosenId = "";
  List gender = ["Male", "Female"];

// List of items in our dropdown menu
  List<Map<dynamic, dynamic>> items = [
    {
      'location': {"city": "Mumbai", "lat": "19.0760", "long": "72.8777"}
    },
    {
      'location': {"city": "Pune", "lat": "18.5204", "long": "73.8567"}
    },
  ];

  Future<Map> getLatLong(String place) async {
    final uri = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$place&format=json');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      if (data.length > 0) {
        var latitude = data[0]['lat'];
        var longitude = data[0]['lon'];
        Map location = {'latitude': '$latitude', 'longitude': '$longitude'};
        return location;
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Complete Your Profile"),
        centerTitle: true,
      ),
      // bottomNavigationBar: _buildBottomBar(),
      // body: getBody(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "You Are",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: gender.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("${gender[index]}"),
                      ),
                      const Spacer(),
                      Radio(
                        value: index.toString(),
                        groupValue: choosenId,
                        onChanged: (value) {
                          setState(
                            () {
                              choosenId = index.toString();
                            },
                          );
                        },
                      ),
                    ]),
                    // ),
                    // child: Row(children: [
                    //
                    //   Text(
                    //     "Male",
                    //     style: const TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.bold),
                    //   ),
                    //   const Spacer(),

                    // ]),
                  ),
                );
              },
            ),
            // Container(
            //   width: double.infinity,
            //   height: 40,
            //   decoration: BoxDecoration(
            //       border: Border.all(
            //         width: 1,
            //       ),
            //       borderRadius: BorderRadius.circular(10)),
            //   child: Row(children: [
            //     const Padding(
            //       padding: EdgeInsets.only(left: 10),
            //       child: Text("Male"),
            //     ),
            //     const Spacer(),
            //     Radio(
            //         value: "radio value",
            //         groupValue: "radio value",
            //         onChanged: (value) {
            //           print(value); //selected value
            //         })
            //   ]),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            //

            const Text(
              "Select Location",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            CSCPicker(
              layout: Layout.vertical,
              defaultCountry: CscCountry.India,
              onCountryChanged: (value) {
                setState(() {
                  countryValue = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  stateValue = value;
                });
              },
              onCityChanged: (value) async {
                Map location = await getLatLong(value.toString());

                setState(() {
                  cityValue = value;
                  lat = "${location["latitude"]}";
                  long = "${location["longitude"]}";
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // SearchMapPlaceWidget(
            //   apiKey: 'AIzaSyDz0Ras5rV8JdTUnMR4lgLoc29Ob8-kUDc',
            //   onSelected: (place) async {
            //     Geolocation geolocation = await place.geolocation;
            //     print(geolocation.coordinates);
            //   },
            // ),
            // DropdownButton(
            //   // Initial Value
            //   value: dropdownvalue,
            //   hint: const Text("Choose your location"),
            //   // Down Arrow Icon
            //   icon: const Icon(Icons.keyboard_arrow_down),

            //   // Array list of items
            //   items: items.map((Map<dynamic, dynamic> items) {
            //     return DropdownMenuItem(
            //       value: items["location"]["city"],
            //       child: Text(items["location"]["city"]),
            //     );
            //   }).toList(),
            //   onChanged: (Object? value) {
            //     setState(() {
            //       dropdownvalue = value!.toString();
            //     });
            //   },
            //   // After selecting the desired option,it will
            //   // change button value to selected value
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            TextField(
              decoration: const InputDecoration(
                  prefixText: '+91', labelText: '10 digits Mobile Number'),
              autofocus: true,
              maxLength: 10,
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                if (value.length == 10) {
                  setState(
                    () {
                      _validPhoneNumber = true;
                    },
                  );
                } else {
                  setState(
                    () {
                      _validPhoneNumber = false;
                    },
                  );
                }
              },
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                Expanded(
                  child: AbsorbPointer(
                    absorbing: _validPhoneNumber ? false : true,
                    child: TextButton(
                      style: _validPhoneNumber
                          ? TextButton.styleFrom(backgroundColor: Colors.green)
                          : TextButton.styleFrom(backgroundColor: Colors.grey),
                      onPressed: () async {
                        String number = '+91${_phoneNumberController.text}';
                        String gender =
                            choosenId.toString() == "0" ? 'Male' : 'Female';
                        String location = cityValue.toString();
                        var locationUser =
                            await getLatLong(cityValue.toString());
                        String lat = locationUser['latitude'];
                        String long = locationUser['longitude'];
                        String userId =
                            FirebaseAuth.instance.currentUser?.uid ?? '';
                        String? displayName =
                            FirebaseAuth.instance.currentUser?.displayName;
                        String? email =
                            FirebaseAuth.instance.currentUser?.email;

                        try {
                          final payload = UserInfoPayload(
                            userId: userId,
                            displayName: displayName,
                            email: email,
                            gender: gender,
                            location: location,
                            lat: lat,
                            long: long,
                            contact: number,
                          );
                          await FirebaseFirestore.instance
                              .collection(FirebaseCollectionName.users)
                              .add(payload);
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            PageTransition(
                              child: const NavigationScreen(),
                              type: PageTransitionType.fade,
                            ),
                          );
                        } catch (_) {
                          return;
                        }

                        _validPhoneNumber = false;

                        _phoneNumberController.clear();
                      },
                      child: _validPhoneNumber
                          ? const Text("Continue",
                              style: TextStyle(color: Colors.white))
                          : const Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
