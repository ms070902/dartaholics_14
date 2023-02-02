import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartaholics/state/auth/constants/firebase_collection_name.dart';
import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/flatmate_search/flatmate.dart';
import 'package:dartaholics/state/flatmate_search/flatmate_search_payload.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final allFlatmatesProvider =
    StreamProvider<Iterable<FlatmateSearchPayload>>((ref) {
  final controller = StreamController<Iterable<FlatmateSearchPayload>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.flatmateSearch)
      .orderBy(FirebaseFieldName.cost)
      .snapshots()
      .listen((snapshot) {

  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
