import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  // This widget will create a custom button for this application.
  // Just pass it the title and the callback function.

  AppButton({
    this.width = 200,
    this.onPressed,
    this.text
  });

  final double width;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: OutlineButton(
        child: Text(text),
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        borderSide: BorderSide(color: Colors.black, style: BorderStyle.solid),
        highlightedBorderColor: Colors.black,
        onPressed: onPressed,
      ),
    );
  }
}