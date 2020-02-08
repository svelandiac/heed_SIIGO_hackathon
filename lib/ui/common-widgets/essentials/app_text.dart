import 'package:flutter/material.dart';

// This file contains all the kinds of text inside the application
// Just use them when you build a text

class AppText {

  AppText(); // Empty constructor

  Widget title(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget firstSubtitle({String text, bool centerText = false, Color textColor}) {

    if(textColor == null) 
      textColor = Colors.grey[600];

    return Text(
      text,
      textAlign: centerText ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: 18,
        color: textColor
      ),
    );
  }

  Widget secondSubtitle({String text, bool centerText = false, Color textColor}) {

    if(textColor == null) 
      textColor = Colors.grey[600];

    return Text(
      text,
      textAlign: centerText ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: 14,
        color: textColor
      ),
    );
  }

  Widget textFieldTitle({String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold
      ),
    );
  }

}