import 'package:doppler/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalData {
  int a = 0;
  static late SharedPreferences? _preferences;
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static void signout() => _preferences!.clear();

  static const _uidKey = 'UIDKEY';
  static const _displayNameKey = 'DISPLAYNAMEKEY';
  static const _emailKey = 'EMAILKEY';
  static const _imageUrlKey = 'IMAGEURLKEY';

  //
  // Setters
  //
  static Future setUserUID(String uid) async =>
      _preferences!.setString(_uidKey, uid);

  static Future setUserEmail(String email) async =>
      _preferences!.setString(_emailKey, email);

  static Future setUserDisplayName(String name) async =>
      _preferences!.setString(_displayNameKey, name);

  static Future setUserImageUrl(String url) async =>
      _preferences!.setString(_imageUrlKey, url);

  //
  // Getters
  //
  static String getUserUID() => _preferences!.getString(_uidKey) ?? '';
  static String getUserEmail() => _preferences!.getString(_emailKey) ?? '';
  static String getUserDisplayName() =>
      _preferences!.getString(_displayNameKey) ?? '';
  static String getUserImageUrl() =>
      _preferences!.getString(_imageUrlKey) ?? '';

  static void storeUserInfoInLocalStorageFromGoogle(User user) {
    UserLocalData.setUserUID(user.uid);
    UserLocalData.setUserDisplayName(user.displayName!);
    UserLocalData.setUserEmail(user.email!);
    UserLocalData.setUserImageUrl(user.photoURL ?? '');
  }

  static void storeUserInfoInLocalStorageFormAppUserObject(AppUser user) {
    UserLocalData.setUserUID(user.uid);
    UserLocalData.setUserEmail(user.email);
    UserLocalData.setUserDisplayName(user.displayName);
    UserLocalData.setUserImageUrl(user.imageURL ?? '');
  }
}
