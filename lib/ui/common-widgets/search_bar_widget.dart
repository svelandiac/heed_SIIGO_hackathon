import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    // Variables declaration
    MediaQueryData _mediaQueryData = MediaQuery.of(context); // We will use it to know the screen's size, and to make a responsive application

    return Row(
      children: <Widget>[
        Container(
          width: _mediaQueryData.size.width * 0.6,
          child: TextField(

          )
        ),
        Spacer(),
        OutlineButton(
          child: Text('Buscar'),
          onPressed: () {

          },
        )
      ],
    );
  }
}