import 'dart:collection';

import 'package:dartaholics/screens/room_posts.dart';
import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/auth/models/itemClass.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class FlatmatePayload extends MapView<String, dynamic>{
  final UserId userId;
  final String location;
  final DateTime availableFrom;
  final String cost;
  final String fileUrl1;
  final String fileUrl2;
  final String fileUrl3;
  final String contact;
  final String description;

  FlatmatePayload({
    required this.userId,
    required this.location,
    required this.availableFrom,
    required this.cost,
    required this.fileUrl1,
    required this.fileUrl2,
    required this.fileUrl3,
    required this.contact,
    required this.description,
  }) : super({
    FirebaseFieldName.userId: userId,
    FirebaseFieldName.location: location,
    FirebaseFieldName.availableFrom: availableFrom,
    FirebaseFieldName.cost: cost,
    FirebaseFieldName.fileUrl1: fileUrl1,
    FirebaseFieldName.fileUrl2: fileUrl2,
    FirebaseFieldName.fileUrl3: fileUrl3,
    FirebaseFieldName.contact: contact,
    FirebaseFieldName.description: description,
  });
}
