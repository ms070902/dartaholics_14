import 'dart:collection';
import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserInfoPayload extends MapView<String, dynamic> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
    String? gender,
    String? location,
    String? lat,
    String? long,
    String? contact,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displayName: displayName ?? '',
          FirebaseFieldName.email: email ?? '',
          FirebaseFieldName.gender: gender ?? '',
          FirebaseFieldName.location: location ?? '',
          FirebaseFieldName.lat: lat ?? '0',
          FirebaseFieldName.long: long ?? '0.0',
          FirebaseFieldName.contact: contact,
        });
}
