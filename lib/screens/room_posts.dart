import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartaholics/screens/preferences.dart';
import 'package:dartaholics/state/auth/constants/firebase_collection_name.dart';
import 'package:dartaholics/state/auth/models/itemClass.dart';
import 'package:dartaholics/state/flatmate_search/flatmate_payload.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../providers/ad_created_provider.dart';
import '../widgets/griditem.dart';
import 'navigation_screen.dart';

class RoomAds extends StatefulWidget {
  const RoomAds({super.key});

  @override
  State<RoomAds> createState() => _RoomAdsState();
}

class _RoomAdsState extends State<RoomAds> {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final displayName = FirebaseAuth.instance.currentUser!.displayName;
  final userDPUrl = FirebaseAuth.instance.currentUser!.photoURL;

  var _locationController = TextEditingController();
  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);
  var _rentController = TextEditingController();
  var _numberController = TextEditingController(text: "+91 9004137508");
  var _descriptionController = TextEditingController();
  late TimeOfDay time;
  File? demo;
  File? demo1;
  late List<Item> itemList;
  late List<Item> selectedList;
  File? demo2;
  DateTime selectedDate = DateTime.now();
  int currentindex = 2;
  int currentindexOptions = 0;
  int currentindexGrid = -1;
  late String data;
  List occupancy = ['Single', 'Shared', 'Any'];
  List gender = ['Male', 'Female', 'Any'];
  List options = ['Show', 'Hide'];

  void onPickImageButtonClicked() async {
    final tempImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (tempImage == null) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('An error occurred. Failed to pick image!'),
      ));
      return;
    }

    setState(() {
      demo = File(tempImage.path);
    });
  }

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
        data =
            "${selectedDate.toString().split(" ")[0]} ${_timeOfDay.format(context).toString()}:00";
      });
    });
  }

  void onPickImageButtonClicked1() async {
    final tempImage1 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (tempImage1 == null) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('An error occurred. Failed to pick image!'),
      ));
      return;
    }

    setState(() {
      demo1 = File(tempImage1.path);
    });
  }

  void onPickImageButtonClicked2() async {
    final tempImage2 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (tempImage2 == null) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('An error occurred. Failed to pick image!'),
      ));
      return;
    }

    setState(() {
      demo2 = File(tempImage2.path);
    });
  }

  @override
  void initState() {
    super.initState();
    time = TimeOfDay.now();
    loadList();
  }

// List ammenities = [
//     'Tv',
//     'Fridge',
//     'Kitchen',
//     'Wifi',
//     'Machine',
//     'AC',
//     'Backup',
//     'Cook',
//     'Parking'
//   ];
  loadList() {
    itemList = [];
    selectedList = [];
    itemList.add(Item("assets/images/television.png", 1, 'Tv'));
    itemList.add(Item("assets/images/fridge.png", 2, 'Fridge'));
    itemList.add(Item("assets/images/kitchen.png", 3, 'Kitchen'));
    itemList.add(Item("assets/images/wifi.png", 4, 'Wifi'));
    itemList.add(Item("assets/images/washingmachine.png", 5, 'Machine'));
    itemList.add(Item("assets/images/airconditioner.png", 6, 'AC'));
    itemList.add(Item("assets/images/thunderbolt.png", 7, 'Backup'));
    itemList.add(Item("assets/images/placeholder.png", 8, 'Cook'));
    itemList.add(Item("assets/images/cooking.png", 9, 'Parking'));
  }

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "If you have flat and looking for roommate,post your flat details here",
                style: TextStyle(fontSize: 17),
              ),
              TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    labelText: 'Where is your flat located?'),
                autofocus: false,
                maxLength: 10,
                controller: _locationController,
                // keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (value.length == 10) {
                    //   setState(
                    //     () {
                    //       _validPhoneNumber = true;
                    //     },
                    //   );
                    // } else {
                    //   setState(
                    //     () {
                    //       _validPhoneNumber = false;
                    //     },
                    //   );
                    // }}
                  }
                },
              ),
              TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.currency_rupee),
                    labelText: 'Rent Per Head'),
                autofocus: false,
                maxLength: 10,
                controller: _rentController,
                // keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (value.length == 10) {
                    //   setState(
                    //     () {
                    //       _validPhoneNumber = true;
                    //     },
                    //   );
                    // } else {
                    //   setState(
                    //     () {
                    //       _validPhoneNumber = false;
                    //     },
                    //   );
                    // }}
                  }
                },
              ),
              const Text(
                "Add Photo (Upload all 3 photos)",
                style: TextStyle(fontSize: 17, color: Colors.green),
              ),
              const SizedBox(
                height: 10,
              ),
              // (demo != null)
              //     ? DottedBorder(
              //         child: Image.file(
              //           demo!.absolute,
              //           height: 250,
              //           width: 250,
              //           scale: 2,
              //           fit: BoxFit.fill,
              //         ),
              //       )
              //     : DottedBorder(
              //         child: MaterialButton(
              //           onPressed: () async {
              //             // if (kIsWeb) {
              //             //   startweb();
              //             // } else {
              //             onPickImageButtonClicked();
              //           },
              //           child: const Icon(Icons.image),
              //         ),
              //       ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (demo != null)
                      ? DottedBorder(
                          child: Image.file(
                            demo!.absolute,
                            height: 220,
                            width: 200,
                            // scale: 2,
                            fit: BoxFit.fill,
                          ),
                        )
                      : DottedBorder(
                          child: MaterialButton(
                            onPressed: () async {
                              // if (kIsWeb) {
                              //   startweb();
                              // } else {
                              onPickImageButtonClicked();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Image.asset(
                                "assets/images/flat.png",
                                width: 170,
                                height: 190,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      (demo1 != null)
                          ? DottedBorder(
                              child: Image.file(
                                demo1!.absolute,
                                height: 120,
                                width: 150,
                                // scale: 2,
                                fit: BoxFit.fill,
                              ),
                            )
                          : DottedBorder(
                              child: MaterialButton(
                                onPressed: () async {
                                  // if (kIsWeb) {
                                  //   startweb();
                                  // } else {
                                  onPickImageButtonClicked1();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Image.asset(
                                    "assets/images/flat.png",
                                    width: 100,
                                    height: 100,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 5,
                      ),
                      (demo2 != null)
                          ? DottedBorder(
                              child: Image.file(
                                demo2!.absolute,
                                height: 92,
                                width: 150,
                                // scale: 2,
                                fit: BoxFit.fill,
                              ),
                            )
                          : DottedBorder(
                              child: MaterialButton(
                                onPressed: () async {
                                  // if (kIsWeb) {
                                  //   startweb();
                                  // } else {
                                  onPickImageButtonClicked2();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Image.asset(
                                    "assets/images/flat.png",
                                    width: 100,
                                    height: 87,
                                    color: Colors.black.withOpacity(0.4),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Occupancy",
                style: TextStyle(fontSize: 17, color: Colors.green),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            currentindex = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                              color: currentindex == index
                                  ? Colors.green
                                  : Colors.white10,
                              border: currentindex == index
                                  ? null
                                  : Border.all(width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "${occupancy[index]}",
                            style: TextStyle(
                                color: currentindex == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: occupancy.length,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Looking For",
                style: TextStyle(fontSize: 17, color: Colors.green),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            currentindex = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                              color: currentindex == index
                                  ? Colors.green
                                  : Colors.white10,
                              border: currentindex == index
                                  ? null
                                  : Border.all(width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "${gender[index]}",
                            style: TextStyle(
                                color: currentindex == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: gender.length,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Available From",
                style: TextStyle(fontSize: 17, color: Colors.green),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * .90, 50),
                    maximumSize:
                        Size(MediaQuery.of(context).size.width * .9, 50),
                    backgroundColor: Colors.white),
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101));
                  if (picked != null && picked != selectedDate) {
                    // setModalState(() {
                    //   selectedDate = picked;
                    // });
                    setState(() {
                      selectedDate = picked;
                      // optionsmap["date"] =
                      //     ;
                    });
                  }
                },
                child: Text(
                  selectedDate.toString().split(" ")[0],
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Ammenities",
                style: TextStyle(fontSize: 17, color: Colors.green),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  item: itemList[index],
                                  isSelected: (bool value) {
                                    setState(() {
                                      if (value) {
                                        selectedList.add(itemList[index]);
                                      } else {
                                        selectedList.remove(itemList[index]);
                                      }
                                    });
                                    // print("$index : $value");
                                  },
                                  key: Key(itemList[index].rank.toString())),
                            ),
                            Text("${itemList[index].ammenity}")
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Contact Number",
                style: TextStyle(fontSize: 17, color: Colors.green),
              ),
              TextField(
                controller: _numberController,
                enabled: false,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Show - Users can call and chat you.",
                style: TextStyle(fontSize: 17, color: Colors.green),
              ),
              const Text(
                "Hide - Users can only chat with you.",
                style: TextStyle(fontSize: 17, color: Colors.green),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            currentindexOptions = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                              color: currentindexOptions == index
                                  ? Colors.green
                                  : Colors.white10,
                              border: currentindexOptions == index
                                  ? null
                                  : Border.all(width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "${options[index]}",
                            style: TextStyle(
                                color: currentindexOptions == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: options.length,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Description",
                style: TextStyle(fontSize: 17, color: Colors.green),
              ),
              TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.house),
                    labelText: 'Enter your flat description'),
                autofocus: false,
                maxLength: 100,
                maxLines: 1,
                controller: _descriptionController,
                // keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (value.length == 10) {
                    //   setState(
                    //     () {
                    //       _validPhoneNumber = true;
                    //     },
                    //   );
                    // } else {
                    //   setState(
                    //     () {
                    //       _validPhoneNumber = false;
                    //     },
                    //   );
                    // }}
                  }
                },
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
                    String location = _locationController.text;
                    String cost = _rentController.text;
                    String contact = _numberController.text;
                    String description = _descriptionController.text;
                    File img1 = demo!.absolute;
                    File img2 = demo1!.absolute;
                    File img3 = demo2!.absolute;
                    DateTime date = selectedDate;

                    final ref1 = firebase_storage.FirebaseStorage.instance
                        .ref('/images/1');
                    final ref2 = firebase_storage.FirebaseStorage.instance
                        .ref('/images/2');
                    final ref3 = firebase_storage.FirebaseStorage.instance
                        .ref('/images/3');
                    try {
                      final file1 = ref1.putFile(img1);
                      final file2 = ref1.putFile(img2);
                      final file3 = ref1.putFile(img3);

                      final payload = FlatmatePayload(
                        userId: userId,
                        location: location,
                        availableFrom: date,
                        cost: cost,
                        fileUrl1: await ref1.getDownloadURL(),
                        fileUrl2: await ref2.getDownloadURL(),
                        fileUrl3: await ref3.getDownloadURL(),
                        contact: contact,
                        description: description,
                        displayName: displayName ?? 'Flat Buddy',
                        userDPURL: userDPUrl ?? '',
                        occupancy: occupancy[currentindex],
                      );

                      await FirebaseFirestore.instance
                          .collection(FirebaseCollectionName.flatmateSearch)
                          .add(
                            payload,
                          );

                      // locationData.changeAdStatus(true);
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const PreferencesScreen(),
                          type: PageTransitionType.fade,
                        ),
                      );
                    } catch (e) {
                      print('error' + e.toString());
                    }

                    // onNextButtonClicked();
                    // context.pushNamed("confirmOrder");
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
        )),
      ),
    );
  }
}
