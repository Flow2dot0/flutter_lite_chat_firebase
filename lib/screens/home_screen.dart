import 'package:flutter/material.dart';
import 'package:flutter_lite_chat_firebase/widgets/rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'images/logo.jpg',
                  ),
                  height: 150.0,
                ),
                Text(
                  'Lite Chat'.toUpperCase(),
                  style: GoogleFonts.teko(
                    textStyle: TextStyle(
                        fontSize: 50.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100.0,
            ),
            // don't inherit from [Theme]
            RoundedButton(
                label: 'Log In',
                color: Colors.blueAccent.shade100,
                onPressed: () {}),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
                label: 'Register',
                color: Colors.blueAccent.shade700,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
