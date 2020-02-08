import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  // Custom text field.
  // Just pass it the controller.

  AppTextField({
    this.controller,
    this.hintText
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      textAlign: TextAlign.center,
      decoration: new InputDecoration(
        hintText: hintText,
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(5),
          ),
          borderSide: new BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}