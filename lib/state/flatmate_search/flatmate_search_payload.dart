import 'dart:collection';

import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class FlatmateSearchPayload extends MapView<String, dynamic> {
  FlatmateSearchPayload({
    required UserId userId,
    required String location,
    required String lat,
    required String long,
    required DateTime availableFrom,
    required String cost,
    required String fileUrl1,
    required String fileUrl2,
    required String fileUrl3,
    required String contact,
    required List<dynamic> amenities,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.location: location,
          FirebaseFieldName.lat: lat,
          FirebaseFieldName.long: long,
          FirebaseFieldName.availableFrom: availableFrom,
          FirebaseFieldName.cost: cost,
          FirebaseFieldName.fileUrl1: fileUrl1,

          FirebaseFieldName.fileUrl2: fileUrl2,
          FirebaseFieldName.fileUrl3: fileUrl3,
          FirebaseFieldName.contact: contact,
          FirebaseFieldName.amenities: amenities,
        });
}
