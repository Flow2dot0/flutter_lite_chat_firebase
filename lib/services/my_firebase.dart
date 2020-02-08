import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<FirebaseUser> logIn(
      {@required String email, @required String password}) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  void logOut() {
    _auth.signOut();
  }

  Future<FirebaseUser> getCurrentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    return user;
  }

  Stream<QuerySnapshot> getAllMessages() {
    Stream<QuerySnapshot> query = Firestore.instance
        .collection('discussion_iphone_v_android')
        .orderBy('datetime')
        .snapshots();
    return query;
  }

  void addMessage({@required String text, @required String sender}) {
    Firestore.instance.collection('discussion_iphone_v_android').add({
      'text': text,
      'sender': sender,
      'datetime': DateTime.now(),
    });
  }
}
