import 'package:flutter/cupertino.dart';

class User with ChangeNotifier{

  String _email;
  String _name;
  String _company;

  User({
    String email = 'email@default.com',
    String name = 'NAME',
    String company = 'COMPANY'
  }) {
    this._email = email;
    this._name = name;
    this._company = company;
    notifyListeners();
  }

  String get email => this._email;
  String get name => this._name;
  String get company => this._company;

  set email(String value) {
    this._email = value;
    notifyListeners();
  }

  set name(String value) {
    this._name = value;
    notifyListeners();
  }

  set company(String value) {
    this._company = value;
    notifyListeners();
  }


}