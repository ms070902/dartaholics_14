import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartaholics/state/auth/constants/firebase_collection_name.dart';
import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/flatmate_search/flatmate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final allFlatmatesProvider = StreamProvider<Iterable<Map>>((ref) {
  final controller = StreamController<Iterable<Map>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.flatmateSearch)
      .orderBy(
        FirebaseFieldName.cost,
        descending: false,
      )
      .snapshots()
      .listen((snapshot) {
    final flats = snapshot.docs.map((doc) {
      String postId = doc.id;
      String userId = doc.data()[FirebaseFieldName.userId].toString();
      DateTime availableFrom =
          doc.data()[FirebaseFieldName.availableFrom] as DateTime;
      String fileUrl1 = doc.data()[FirebaseFieldName.fileUrl1].toString();
      String fileUrl2 = doc.data()[FirebaseFieldName.fileUrl2].toString();
      String fileUrl3 = doc.data()[FirebaseFieldName.fileUrl3].toString();
      String contact = doc.data()[FirebaseFieldName.contact].toString();
      String location = doc.data()[FirebaseFieldName.location].toString();

      String cost = doc.data()[FirebaseFieldName.cost] as String;
      String desc = doc.data()[FirebaseFieldName.description] as String;
      return Map(
        postId: postId,
        userId: userId,
        location: location,
        availableFrom: availableFrom,
        cost: cost,
        fileUrl1: fileUrl1,
        fileUrl2: fileUrl2,
        fileUrl3: fileUrl3,
        contact: contact,
        description: desc,
      );
    });
    controller.sink.add(flats);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
