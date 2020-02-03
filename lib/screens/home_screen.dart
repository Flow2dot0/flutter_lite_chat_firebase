import 'package:flutter/material.dart';
import 'package:flutter_lite_chat_firebase/ux/animations.dart';
import 'package:flutter_lite_chat_firebase/widgets/rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, Animations {
  AnimationController _animationController;
  Animation _backgroundColorTween;
  Animation _curvedAnimation;

  @override
  void initState() {
    _animationController = createAnimationController(
        tickerProvider: this, duration: Duration(seconds: 1));
    _backgroundColorTween = colorTween(
        parent: _animationController,
        beginColor: Colors.blueAccent,
        endColor: Colors.white);
    _curvedAnimation =
        curvedAnimation(parent: _animationController, curve: Curves.decelerate);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColorTween.value,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset(
                      'images/logo.png',
                    ),
                    height: 150.0 * _curvedAnimation.value,
                  ),
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
                animation: _curvedAnimation,
                label: 'Log In',
                color: Colors.blueAccent.shade100,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                }),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
                animation: _curvedAnimation,
                label: 'Register',
                color: Colors.blueAccent.shade700,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
