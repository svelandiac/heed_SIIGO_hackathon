import 'package:flutter/material.dart';
import 'package:heed/root_screen_handler.dart';
import 'package:provider/provider.dart';

void main() => runApp(HeedApp());

class HeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(builder: (context)=> Trip(),),
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

