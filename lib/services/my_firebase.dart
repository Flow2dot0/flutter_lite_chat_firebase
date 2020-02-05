import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyFirebase();

  Future<FirebaseUser> registerUser(
      {String emailStr, @required String password}) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: emailStr, password: password))
        .user;
    return user;
  }

  Future<FirebaseUser> signIn(
      {@required String email, @required String password}) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }
}
