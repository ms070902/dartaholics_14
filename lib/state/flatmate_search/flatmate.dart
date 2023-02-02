import 'dart:collection';

import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class Flatmate {
  final String postId;
  final UserId userId;
  final Map<String, dynamic> location;
  final DateTime availableFrom;
  final String cost;
  final String fileUrl1;
  final String fileUrl2;
  final String fileUrl3;
  final String contact;
  final Map<String, bool> amenities;

  Flatmate(
    this.postId,
    this.userId,
    this.location,
    this.availableFrom,
    this.cost,
    this.fileUrl1,
    this.fileUrl2,
    this.fileUrl3,
    this.contact,
    this.amenities,
  );
}
