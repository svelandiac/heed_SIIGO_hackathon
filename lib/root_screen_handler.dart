import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heed/controllers/user_controller.dart';
import 'package:heed/ui/app-screens/bringing_information_from_database_screen.dart';
import 'package:heed/ui/app-screens/dashboard_client_screen.dart';
import 'package:heed/ui/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'access-data/models/user.dart';

class RootScreenHandler extends StatefulWidget{
  
  @override
  _RootScreenHandlerState createState() => _RootScreenHandlerState();
}

class _RootScreenHandlerState extends State<RootScreenHandler> {

  // This is the handler for knowing what screen is displayed.
  // It makes the verification of what information we have, if user
  // logged in, etc.

  User _userProvider;
  UserController _userController;

  bool _loadingFirebaseInfo; // This is for displaying a "loading message"

  _RootScreenHandlerState() {
    FirebaseAuth.instance.currentUser() // We verify if there is a current session opened
    .then((value) {   
      if(value != null)
        _userProvider.logged = true;

      setState(() {
        _loadingFirebaseInfo = false;
      });
    });
  }

  Future<void> _bringUserInformation() async { 
    // We need to bring the user information from the database
    // with an async method.

    try {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      String email = user.email;
      _userController.bringUserInformation(
        email: email
      );
      return;
    }
    catch (e) {
      print(e);
      return;
    }
  } 

  @override
  void initState() {
    super.initState();
    this._loadingFirebaseInfo = true;
    
  }

  @override
  Widget build(BuildContext context) {

    _userProvider = Provider.of<User>(context);
    _userController = UserController(_userProvider);

    if(_loadingFirebaseInfo) // We are verifying if there is a firebase session
      return BringingInformationFromDatabaseScreen();
      

    if (_userProvider.logged && !_userProvider.hasInformation) { // There is a firebase session but we don't have user information
      _bringUserInformation();
      return BringingInformationFromDatabaseScreen();
    }

    if(_userProvider.logged && _userProvider.hasInformation)  // We have both requeriments 
      return DashboardClientScreen();

    return LoginScreen(); // We don't have any information and we need logging in
    
  }
}
