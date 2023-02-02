import 'package:dartaholics/state/flat_search/notifiers/flat_search_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flatSearchProvider = StateNotifierProvider<FlatSearchNotifier, bool>(
  (ref) => FlatSearchNotifier(),
);
