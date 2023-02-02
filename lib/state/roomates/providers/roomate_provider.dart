import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartaholics/state/auth/constants/firebase_collection_name.dart';
import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/roomates/roommate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final roommateProvider = StreamProvider<Iterable<Roommate>>((ref) {
  final controller = StreamController<Iterable<Roommate>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.users)
      // .where(
      //   int.parse(FirebaseFieldName.cost),
      //   isGreaterThanOrEqualTo: int.parse(FirebaseFieldName.cost) - 3000,
      //   isLessThanOrEqualTo: int.parse(FirebaseFieldName.cost) + 3000,
      // )
      .snapshots()
      .listen((snapshot) {
    final roommates = snapshot.docs.map((doc) {
      final String displayName =
          doc.data()[FirebaseFieldName.displayName].toString();
      String expectedCost = doc.data()[FirebaseFieldName.cost].toString();
      String location = doc.data()[FirebaseFieldName.location].toString();
      return Roommate(
        FirebaseAuth.instance.currentUser!.photoURL.toString(),
        displayName,
        expectedCost,
        location,
      );
    });
    controller.sink.add(roommates);
  });
  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
