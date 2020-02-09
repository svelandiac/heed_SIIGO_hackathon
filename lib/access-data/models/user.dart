import 'package:flutter/cupertino.dart';

class User with ChangeNotifier{

  String _email;
  String _name;
  String _company;

  bool _logged;
  bool _hasInformation;

  User({
    String email = 'email@default.com',
    String name = 'NAME',
    String company = 'COMPANY',
    bool logged = false,
    bool hasInformation = false
  }) {
    this._email = email;
    this._name = name;
    this._company = company;
    this._logged = logged;
    this._hasInformation = hasInformation;
    notifyListeners();
  }

  String get email => this._email;
  String get name => this._name;
  String get company => this._company;
  bool get logged => this._logged;
  bool get hasInformation => this._hasInformation;

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

  set logged(bool value) {
    this._logged = value;
    notifyListeners();
  }

  set hasInformation(bool value) {
    this._hasInformation = value;
    notifyListeners();
  }


}