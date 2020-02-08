import 'package:flutter/material.dart';

class BubbleMessage extends StatelessWidget {
  static const BorderRadius leftSide = BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
    bottomRight: Radius.circular(30.0),
  );
  static const BorderRadius rightSide = BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
    bottomLeft: Radius.circular(30.0),
  );
  final String messageContent;
  final String datetime;
  final bool isMe;

  const BubbleMessage({
    Key key,
    @required this.messageContent,
    @required this.datetime,
    this.isMe = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width * 0.6,
          child: Material(
            borderRadius: isMe ? rightSide : leftSide,
            elevation: 5.0,
            color: isMe ? Colors.blueAccent : Colors.greenAccent,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                messageContent,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: 10.0, top: 5.0, bottom: 5.0, left: 10.0),
          child: Text(
            datetime,
            style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }
}
