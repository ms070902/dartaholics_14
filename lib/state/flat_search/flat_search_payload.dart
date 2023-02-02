import 'dart:collection';

import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:dartaholics/state/user_info/backend/typedef.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class FlatSearchPayload extends MapView<String, dynamic> {
  FlatSearchPayload({
    required UserId userId,
    required String budget,
    required Map<Location, Coordinates> location,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.budget: budget,
          FirebaseFieldName.location: location,
        });
}
