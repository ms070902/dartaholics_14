import 'dart:collection';

import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class Map {
  final String postId;
  final UserId userId;
  final String location;
  final DateTime availableFrom;
  final String cost;
  final String fileUrl1;
  final String fileUrl2;
  final String fileUrl3;
  final String contact;
  final String description;

  const Map({
    required this.postId,
    required this.userId,
    required this.location,
    required this.availableFrom,
    required this.cost,
    required this.fileUrl1,
    required this.fileUrl2,
    required this.fileUrl3,
    required this.contact,
    required this.description,
  });
}
