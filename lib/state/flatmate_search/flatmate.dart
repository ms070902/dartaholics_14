import 'dart:collection';

import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class Flatmate {
  final String postId;
  final UserId userId;
  final String location;
  final String lat;
  final String long;
  final DateTime availableFrom;
  final String cost;
  final String fileUrl1;
  final String fileUrl2;
  final String fileUrl3;
  final String contact;
  final List<dynamic> amenities;

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
    this.lat,
    this.long,
  );
}
