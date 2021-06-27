import 'dart:convert';

class AppUser {
  final String uid;
  final String displayName;
  final String email;
  final String? imageURL;
  final String designation;

  AppUser({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.designation,
    this.imageURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'imageURL': imageURL ?? '',
      'designation': designation,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'].toString(),
      displayName: map['displayName'].toString(),
      email: map['email'].toString(),
      imageURL: map['imageURL'].toString(),
      designation: map['designation'].toString(),
    );
  }

  factory AppUser.fromDocument(docs) {
    return AppUser(
      uid: docs.data()['uid'].toString(),
      displayName: docs.data()['displayName'].toString(),
      email: docs.data()['email'].toString(),
      imageURL: docs.data()['imageURL'].toString(),
      designation: docs.data()['designation'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  // factory AppUser.fromJson(String source) =>
  //     AppUser.fromMap(json.decode(source));
}
