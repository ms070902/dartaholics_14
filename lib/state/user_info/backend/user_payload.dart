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
    required String? gender,
    required Map<String, String> location,
    required String? contact,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displayName: displayName ?? '',
          FirebaseFieldName.email: email ?? '',
          FirebaseFieldName.gender: gender ?? '',
          FirebaseFieldName.location: {
            for (final loc in location.entries)
              {
                loc.key: loc.value,
              }
          },
          FirebaseFieldName.contact: contact,
        });
}
