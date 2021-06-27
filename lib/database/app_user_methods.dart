import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doppler/database/user_local_data.dart';
import 'package:doppler/models/app_user.dart';

class AppUserFirebaseMethods {
  static const String _fUser = 'users';
  Future addUserInfoToFirebase({required AppUser user}) async {
    await FirebaseFirestore.instance
        .collection(_fUser)
        .doc(user.uid)
        .set(user.toMap())
        .catchError((Object obj) {
      print(obj.toString());
    });
  }

  Future<void> storeUserInfoInLocalStorageFromFirebase(String uid) async {
    final DocumentSnapshot docs =
        await FirebaseFirestore.instance.collection(_fUser).doc(uid).get();
    final AppUser user = AppUser.fromDocument(docs);
    UserLocalData.storeUserInfoInLocalStorageFormAppUserObject(user);
  }

  Future<DocumentSnapshot> getUserInfofromFirebase(String uid) async {
    return FirebaseFirestore.instance.collection(_fUser).doc(uid).get();
  }

  Future<void> updateUserDoc({required Map<String, dynamic> userMap}) async {
    await FirebaseFirestore.instance
        .collection(_fUser)
        .doc(UserLocalData.getUserUID())
        .update(userMap);
  }
}
