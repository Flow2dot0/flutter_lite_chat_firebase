import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lite_chat_firebase/services/my_firebase.dart';
import 'package:flutter_lite_chat_firebase/widgets/bubble_message.dart';

class MessagesFlux extends StatelessWidget {
  const MessagesFlux({
    Key key,
    @required MyFirebase auth,
    @required this.user,
  })  : _auth = auth,
        super(key: key);

  final MyFirebase _auth;
  final FirebaseUser user;

  String formattedDate(document) {
    var format = DateTime.parse(document['datetime'].toDate().toString());
    return '${format.toString().substring(11, 19)}';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _auth.getAllMessages(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.redAccent,
            ),
          );
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black54,
              ),
            );
          default:
            return Expanded(
              child: new ListView(
                reverse: true,
                children: snapshot.data.documents.reversed
                    .map((DocumentSnapshot document) {
                  return BubbleMessage(
                      isMe: user?.email == document['sender'],
                      messageContent: document['text'],
                      datetime: formattedDate(document));
                }).toList(),
              ),
            );
        }
      },
    );
  }
}
