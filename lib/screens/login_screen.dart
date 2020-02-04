import 'package:flutter/material.dart';
import 'package:flutter_lite_chat_firebase/widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  borderSide:
                      BorderSide(color: Colors.blueAccent.shade100, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  borderSide:
                      BorderSide(color: Colors.blueAccent.shade700, width: 2.0),
                ),
              ),
            ),
            RoundedButton(
              label: 'Go!',
              onPressed: () {},
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
