import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_mans/models/user_model.dart';
import 'package:d_mans/services/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DatabaseMethods {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Signup
  Future<String> signUpUser(
      {required String email,
      required String pass,
      required String bio,
      required String username,
      required Uint8List file}) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty ||
          pass.isNotEmpty ||
          bio.isNotEmpty ||
          username.isNotEmpty) {
        UserCredential cred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        String photoURL = await StorageMethods()
            .uploadImageToStorage('ProfilePics', file, false);
        //Add User to the database with modal
        UserModel userModel = UserModel(
            name: username,
            uid: cred.user!.uid,
            email: email,
            phoneNumber: bio,
            photoURL: photoURL);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(cred.user!.uid)
            .set(userModel.toJson());
        res = 'sucess';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
