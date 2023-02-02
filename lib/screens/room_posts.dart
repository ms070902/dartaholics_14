import 'package:flutter/material.dart';

class RoomAds extends StatefulWidget {
  const RoomAds({super.key});

  @override
  State<RoomAds> createState() => _RoomAdsState();
}

class _RoomAdsState extends State<RoomAds> {
  var _locationController = TextEditingController();
  var _rentController = TextEditingController();
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
          ],
        ),
      )),
    );
  }
}
