import 'package:flutter/material.dart';

class SafeScreen extends StatelessWidget {

  // Class for creating a new screen, avoiding problems such as Notch, holes in screen, device curves, etc.
  // SafeArea protects us of these problems, and retrieves us a 'secure' area which we can use.

  // To use it just create a new instance of this class and pass the body to it.

  SafeScreen({
    this.body
  });
  
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }
}