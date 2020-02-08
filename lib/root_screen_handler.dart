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

  User _userProvider;
  UserController _userController;

  Future<void> _bringUserInformation() async {

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
  Widget build(BuildContext context) {

    _userProvider = Provider.of<User>(context);
    _userController = UserController(_userProvider);

    return StreamBuilder(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting)
        return _buildWaiting();
      else{
        if(snapshot.hasData) {
          if(_userProvider.email == 'email@default.com') {
            _bringUserInformation();            
            return BringingInformationFromDatabaseScreen();
          }
          else 
            return DashboardClientScreen();
        }
        else
          return LoginScreen();
      }
    },
  );
  }
}

Widget _buildWaiting(){
  return Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}