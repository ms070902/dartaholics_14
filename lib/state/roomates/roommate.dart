import 'package:flutter/foundation.dart' show immutable;

@immutable
class Roommate {
  final String userDP;
  final String displayName;
  final String expectedCost;
  final String location;

  const Roommate(
    this.userDP,
    this.displayName,
    this.expectedCost,
    this.location,
  );
}
