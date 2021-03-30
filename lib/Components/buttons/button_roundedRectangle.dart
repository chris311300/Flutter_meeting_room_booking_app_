import 'package:flutter/material.dart';

class RoundedRectangle extends StatelessWidget {
  final String textInButton;
  final Color color;
  final Function onPressed;

  RoundedRectangle({this.textInButton, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: onPressed,
      child: Container(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textInButton,
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      color: color,
    );
  }
}
