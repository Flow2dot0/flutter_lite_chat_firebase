import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lite_chat_firebase/services/messages_flux.dart';
import 'package:flutter_lite_chat_firebase/services/my_firebase.dart';
import 'package:flutter_lite_chat_firebase/widgets/round_button.dart';
import 'package:flutter_lite_chat_firebase/widgets/rounded_text_field.dart';

import '../constants.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageTextController = TextEditingController();
  MyFirebase _auth = MyFirebase();
  FirebaseUser user;
  String message;

  @override
  void initState() {
    super.initState();
    isConnected();
  }

  // exit this route if not connected
  void isConnected() async {
    final usr = await _auth.getCurrentUser().then((u) {
      setState(() {
        user = u;
      });
    }).catchError((e) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.blue],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: RoundButton(
                    onPressed: () {
                      _auth.logOut();
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  height: 1.0,
                  color: Colors.white,
                ),
                MessagesFlux(auth: _auth, user: user),
                Container(
                  height: 1.0,
                  color: Colors.white,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Theme(
                          data: ThemeData(
                              textTheme: Theme.of(context).textTheme.apply(
                                    bodyColor: Colors.white,
                                  )),
                          child: RoundedTextField(
                            controller: messageTextController,
                            hintColor: Colors.white,
                            color1: Colors.white,
                            color2: Colors.greenAccent,
                            onChanged: (String v) {
                              message = v;
                            },
                          ),
                        ),
                      ),
                      FlatButton.icon(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {
                            _auth.addMessage(text: message, sender: user.email);
                            messageTextController.clear();
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                          label: Text(
                            'send',
                            style: kTextStyleWTC,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
