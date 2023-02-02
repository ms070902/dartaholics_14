import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/item.dart';
import '../widgets/griditem.dart';

class RoomMateAds extends StatefulWidget {
  const RoomMateAds({super.key});

  @override
  State<RoomMateAds> createState() => _RoomMateAdsState();
}

class _RoomMateAdsState extends State<RoomMateAds> {
  var _locationController = TextEditingController();
  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);
  var _rentController = TextEditingController();
  var _numberController = TextEditingController(text: "+91 9004137508");
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

  List image = [
    'assets/flat.png',
    'assets/flat.png',
    'assets/flat.png',
    'assets/flat.png',
    'assets/flat.png',
    'assets/flat.png',
    'assets/flat.png',
    'assets/flat.png',
    'assets/flat.png'
  ];

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
    // TODO: implement initState

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
    itemList.add(Item("assets/television.png", 1, 'Tv'));
    itemList.add(Item("assets/fridge.png", 2, 'Fridge'));
    itemList.add(Item("assets/kitchen.png", 3, 'Kitchen'));
    itemList.add(Item("assets/wifi.png", 4, 'Wifi'));
    itemList.add(Item("assets/washingmachine.png", 5, 'Machine'));
    itemList.add(Item("assets/airconditioner.png", 6, 'AC'));
    itemList.add(Item("assets/thunderbolt.png", 7, 'Backup'));
    itemList.add(Item("assets/placeholder.png", 8, 'Cook'));
    itemList.add(Item("assets/cooking.png", 9, 'Parking'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "If you are looking for flat with roommates, post your preferences here.",
                style: TextStyle(fontSize: 17),
              ),
              TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    labelText: 'Where do you want a flat'),
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
              TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.currency_rupee),
                    labelText: 'Approx Rent'),
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
              // const Text(
              //   "Add Photo (Upload all 3 photos)",
              //   style: TextStyle(fontSize: 17, color: Colors.green),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
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
                "Need to shift",
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
                    labelText: 'Enter your dream flat expectation'),
                autofocus: false,
                maxLength: 100,
                maxLines: 1,
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
                  onPressed: () {
                    print(selectedList);
                    print("Hi");
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
