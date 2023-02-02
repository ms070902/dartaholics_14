import 'dart:collection';

import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class FlatmateSearchPayload extends MapView<String, dynamic> {
  FlatmateSearchPayload({
    required UserId userId,
    required Map<String, dynamic> location,
    required DateTime availableFrom,
    required String cost,
    required String fileUrl1,
    required String fileUrl2,
    required String fileUrl3,
    required String contact,
    required Map<String, bool> amenities,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.location: {
            for (final doc in location.entries)
              {
                doc.key: doc.value,
              }
          },
          FirebaseFieldName.availableFrom: availableFrom,
          FirebaseFieldName.cost: cost,
          FirebaseFieldName.fileUrl1: fileUrl1,
          FirebaseFieldName.fileUrl2: fileUrl2,
          FirebaseFieldName.fileUrl3: fileUrl3,
          FirebaseFieldName.contact: contact,
          FirebaseFieldName.amenities: {
            for (final amenity in amenities.entries)
              {
                amenity.key: amenity.value,
              }
          },
        });
}
