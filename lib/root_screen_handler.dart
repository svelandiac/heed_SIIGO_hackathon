import 'package:flutter/material.dart';
import 'package:heed/ui/login/login_screen.dart';

class RootScreenHandler extends StatefulWidget {
  @override
  _RootScreenHandlerState createState() => _RootScreenHandlerState();
}

class _RootScreenHandlerState extends State<RootScreenHandler> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}