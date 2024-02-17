import 'dart:ffi';

import 'package:chatapp/costum/Model.dart';
import 'package:chatapp/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseProvider {
  static final String collection_user = "user";
  static final collection_notes = "notes";
  static const String Login_pref_key = "is login";
  static final fireAuth = FirebaseAuth.instance;
  static final fireStore = FirebaseFirestore.instance;
  Future<void> creatUser({
    required Usermodel usermodel,
    required String mPass,
  }) async {
    try {
      var userCred = await fireAuth.createUserWithEmailAndPassword(
          email: usermodel.email!, password: mPass);
      if (userCred.user != null) {
        fireStore
            .collection(collection_user)
            .doc(userCred.user!.uid)
            .set(usermodel.toDoc())
            .then((value) {})
            .onError((error, stackTrace) {
          print("error is $error");
          throw Exception("error : $error");
        });
      }
    } on FirebaseException catch (e) {
      print("${e}");
      throw Exception("error : $e");
    }
  }

  Future<void> authenticateUser({
    required String email,
    required String mPass,
  }) async {
    try {
      var userCred = await fireAuth.signInWithEmailAndPassword(
          email: email, password: mPass);
      if (userCred.user != null) {
        var pref = await SharedPreferences.getInstance();
        var id = pref.setString(Login_pref_key, userCred.user!.uid);
      }
    } on FirebaseException catch (e) {
      print("${e}");
      throw Exception("error : $e");
    }
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getAllNotes() async {
    return await fireStore.collection(collection_user).get();
  }
}
