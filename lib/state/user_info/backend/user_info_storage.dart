import 'package:dartaholics/state/auth/constants/firebase_collection_name.dart';
import 'package:dartaholics/state/auth/constants/firebase_field_name.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:dartaholics/state/user_info/backend/user_payload.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();
  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try {
      ///first check if the user already exists
      final userInfo = await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.users,
          )
          .where(
            FirebaseFieldName.userId,
            isEqualTo: userId,
          )
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        ///user already exists
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email ?? '',
        });
        return true;
      }

      ///user doesn't exist
      // final payload = UserInfoPayload(
      //   userId: userId,
      //   displayName: displayName,
      //   email: email,
      //   location: ,
      // );
      // await FirebaseFirestore.instance
      //     .collection(
      //       FirebaseCollectionName.users,
      //     )
      //     .add(
      //       payload,
      //     );
      return true;
    } catch (e) {
      return false;
    }
  }
}
