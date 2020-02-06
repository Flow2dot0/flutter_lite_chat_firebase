import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lite_chat_firebase/screens/chat_screen.dart';
import 'package:flutter_lite_chat_firebase/services/my_firebase.dart';
import 'package:flutter_lite_chat_firebase/widgets/rounded_button.dart';
import 'package:flutter_lite_chat_firebase/widgets/rounded_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset(
                  'images/logo.png',
                ),
                height: 400.0,
              ),
            ),
            // TODO : continue...
            RoundedTextField(
              keyboard: TextInputType.emailAddress,
              color1: Colors.blueAccent.shade100,
              color2: Colors.blueAccent.shade400,
              hintText: 'Enter your email',
              onChanged: (String v) {
                email = v;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RoundedTextField(
              obscureText: true,
              keyboard: TextInputType.text,
              color1: Colors.blueAccent.shade100,
              color2: Colors.blueAccent.shade400,
              hintText: 'Enter your password',
              onChanged: (String v) {
                password = v;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              label: 'Go !',
              onPressed: () async {
                MyFirebase fbInstance = MyFirebase();
                fbInstance.initAuth();
                await fbInstance
                    .signIn(email: email, password: password)
                    .then((FirebaseUser user) =>
                        Navigator.pushNamed(context, ChatScreen.routeName))
                    .catchError((e) {
                  SnackBarPage();
                });
              },
              color: Colors.blueAccent.shade100,
            )
          ],
        ),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
    );
    Scaffold.of(context).showSnackBar(snackBar);

    return snackBar;
    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
  }
}
