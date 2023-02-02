import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RoomAds extends StatefulWidget {
  const RoomAds({super.key});

  @override
  State<RoomAds> createState() => _RoomAdsState();
}

class _RoomAdsState extends State<RoomAds> {
  var _locationController = TextEditingController();
  var _rentController = TextEditingController();
  File? demo;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
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
            SizedBox(
              height: 10,
            ),
            (demo != null)
                ? DottedBorder(
                    child: Image.file(
                      demo!.absolute,
                      height: 250,
                      width: 400,
                      scale: 2,
                      fit: BoxFit.scaleDown,
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
                      child: const Icon(Icons.image),
                    ),
                  ),
          ],
        ),
      )),
    );
  }
}
