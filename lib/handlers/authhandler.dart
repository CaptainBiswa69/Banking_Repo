import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthServices {
  final FirebaseAuth firebaseauth = FirebaseAuth.instance;
  //login
  loginUserWithEmailAndPassword(String email, String password) async {
    User? user;
    try {
      user = (await firebaseauth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'No user found for that email.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: 'Wrong password provided for that user.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: e.message.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      }
    }
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  //register
  registerUserWithEmailAndPassword(String email, String password, String name,
      String accountNmber, String phoneNumber) async {
    try {
      await firebaseauth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firebaseauth.currentUser?.updateDisplayName(name);
      FirebaseFirestore.instance
          .collection("UserData")
          .doc(firebaseauth.currentUser?.uid)
          .set({
            "Name" : name,
            "Account Number" : accountNmber,
            "Phone Number" : phoneNumber
          });
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return e;
    }
  }
}
