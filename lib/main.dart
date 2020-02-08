import 'package:flutter/material.dart';
import 'package:heed/root_screen_handler.dart';
import 'package:provider/provider.dart';
import 'access-data/models/user.dart';

void main() => runApp(HeedApp());

class HeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => User()),
      ],
      child: MaterialApp(
        title: 'Heed',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootScreenHandler(),
      ),
    );
  }
}

