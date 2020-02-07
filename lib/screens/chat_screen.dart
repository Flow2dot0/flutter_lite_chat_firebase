import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lite_chat_firebase/services/my_firebase.dart';
import 'package:flutter_lite_chat_firebase/widgets/round_button.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  MyFirebase _auth = MyFirebase();
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    isConnected();
  }

  // exit this route if not connected
  void isConnected() async {
    _auth.initAuth();
    user =
        await _auth.getCurrentUser().catchError((e) => Navigator.pop(context));
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: RoundButton(
                  onPressed: () {
                    _auth.logOut();
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
