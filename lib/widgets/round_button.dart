import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Function onPressed;

  const RoundButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 45.0, height: 45.0),
      onPressed: onPressed,
      elevation: 5.0,
      fillColor: Colors.redAccent,
      child: Icon(
        Icons.exit_to_app,
        color: Colors.white,
      ),
      shape: CircleBorder(side: BorderSide(color: Colors.blueGrey.shade100)),
    );
  }
}
