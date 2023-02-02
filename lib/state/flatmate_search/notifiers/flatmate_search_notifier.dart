import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartaholics/state/auth/constants/firebase_collection_name.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:dartaholics/state/flatmate_search/flatmate_search_payload.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class FlatmateSearchNotifier extends StateNotifier<bool> {
  FlatmateSearchNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> sendData({
    required UserId userId,
    required File file1,
    required File file2,
    required File file3,
    required String location,
    required String lat,
    required String long,
    required List<dynamic> amenities,
    required String cost,
    required DateTime availableFrom,
    required String contact,
  }) async {
    isLoading = true;

    final fileName1 = const Uuid().v4();
    final fileName2 = const Uuid().v4();
    final fileName3 = const Uuid().v4();
    final originalFileRef1 = FirebaseStorage.instance
        .ref()
        .child(userId)
        .child('images')
        .child(fileName1);
    final originalFileRef2 = FirebaseStorage.instance
        .ref()
        .child(userId)
        .child('images')
        .child(fileName2);
    final originalFileRef3 = FirebaseStorage.instance
        .ref()
        .child(userId)
        .child('images')
        .child(fileName3);

    try {
      ///upload image
      final fileUrl1 = await originalFileRef1.putFile(file1);
      final fileUrl2 = await originalFileRef2.putFile(file2);
      final fileUrl3 = await originalFileRef3.putFile(file3);

      // final payload = FlatmateSearchPayload(
      //   userId: userId,
      //   location: location,
      //   lat: lat,
      //   long: long,
      //   availableFrom: availableFrom,
      //   cost: cost,
      //   fileUrl1: await originalFileRef1.getDownloadURL(),
      //   fileUrl2: await originalFileRef2.getDownloadURL(),
      //   fileUrl3: await originalFileRef3.getDownloadURL(),
      //   contact: contact,
      //   amenities: amenities,
      // );
      // await FirebaseFirestore.instance
      //     .collection(
      //       FirebaseCollectionName.flatmateSearch,
      //     )
      //     .add(payload);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
