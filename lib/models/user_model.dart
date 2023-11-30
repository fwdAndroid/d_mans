import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String email;
  String phoneNumber;
  String name;
  String photoURL;

  UserModel(
      {required this.uid,
      required this.email,
      required this.phoneNumber,
      required this.photoURL,
      required this.name});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'email': email,
        'phoneNumber': phoneNumber,
        'photoURL': photoURL
      };

  ///
  static UserModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return UserModel(
        name: snapshot['name'],
        uid: snapshot['uid'],
        email: snapshot['email'],
        photoURL: snapshot['photoURL'],
        phoneNumber: snapshot['phoneNumber']);
  }
}
