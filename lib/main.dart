import 'package:flutter/material.dart';
import 'package:heed/root_screen_handler.dart';

void main() => runApp(HeedApp());

class HeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootScreenHandler(),
    );
  }
}

