import 'package:doppler/database/app_user_methods.dart';
import 'package:doppler/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'user_local_data.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return auth.currentUser;
  }

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      final GoogleSignIn _googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      final UserCredential result =
          await _firebaseAuth.signInWithCredential(credential);

      // final exist =
      //     await DatabaseMethods().getUserInfofromFirebase(result.user.uid);
      // if (!exist.exists) {
      //   DatabaseMethods().addUserInfoToFirebase(
      //     userId: result.user.uid,
      //     name: result.user.displayName ?? '',
      //     phoneNumber: result.user.phoneNumber ?? '',
      //     email: result.user.email ?? '',
      //     imageURL: result.user.photoURL ?? '',
      //   );
      // } else {
      //   DatabaseMethods().updateUserDoc(uid: result.user.uid, userMap: {
      //     'displayName': result.user.displayName,
      //     'imageURL': result.user.photoURL,
      //   });
      // }

      if (result != null) {
        final User? user = result.user;
        // DatabaseMethods().storeUserInfoInLocalStorageFromGoogle(user);
        return user;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red);
      return null;
    }
    return null;
  }

  Future<User?> signupWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String designation,
  }) async {
    try {
      final UserCredential result = await auth
          .createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      )
          .catchError((Object obj) {
        Fluttertoast.showToast(
          msg: obj.toString(),
          backgroundColor: Colors.red,
          timeInSecForIosWeb: 5,
        );
        // return null;
      });
      final User? user = result.user;
      assert(user != null);
      assert(await user!.getIdToken() != null);
      if (user != null) {
        AppUserFirebaseMethods().addUserInfoToFirebase(
          user: AppUser(
            uid: user.uid,
            displayName: name,
            email: email,
            designation: designation,
          ),
        );
      }
      return user;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red);
      return null;
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .catchError((obj) {
        Fluttertoast.showToast(
          msg: obj.toString(),
          backgroundColor: Colors.red,
        );
        // return null;
      });
      if (result != null) {
        final User? user = result.user;
        final User? currentUser = FirebaseAuth.instance.currentUser;
        assert(user!.uid == currentUser!.uid);
        // DatabaseMethods().storeUserInfoInLocalStorageFromFirebase(user.uid);
        AppUserFirebaseMethods()
            .storeUserInfoInLocalStorageFromFirebase(user!.uid);
        return user;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red);
      return null;
    }
    return null;
  }

  Future signOut() async {
    UserLocalData.signout();
    await auth.signOut();
  }
}
