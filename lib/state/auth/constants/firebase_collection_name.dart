import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseCollectionName {
  static const posts = 'posts';
  static const users = 'users';
  static const flatSearch = 'flat_search';
  static const flatmateSearch = 'flatmate_search';

  const FirebaseCollectionName._();
}
