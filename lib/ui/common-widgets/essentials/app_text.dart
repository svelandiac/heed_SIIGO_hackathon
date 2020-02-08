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

}