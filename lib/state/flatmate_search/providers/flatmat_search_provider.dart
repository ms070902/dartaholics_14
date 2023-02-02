import 'package:dartaholics/state/flatmate_search/notifiers/flatmate_search_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flatmateSearchProvider =
    StateNotifierProvider<FlatmateSearchNotifier, bool>(
  (ref) => FlatmateSearchNotifier(),
);
