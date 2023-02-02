import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartaholics/state/auth/constants/firebase_collection_name.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:dartaholics/state/flat_search/flat_search_payload.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlatSearchNotifier extends StateNotifier<bool> {
  FlatSearchNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> sendData({
    required UserId userId,
    required Map<String, double> location,
    required String budget,
  }) async {
    isLoading = true;
    final payload = FlatSearchPayload(
      userId: userId,
      budget: budget,
      location: location,
    );
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.flatSearch)
          .add(payload);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
