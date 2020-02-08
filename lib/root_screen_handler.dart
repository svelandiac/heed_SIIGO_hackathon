import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heed/ui/app-screens/dashboard_client_screen.dart';
import 'package:heed/ui/login/login_screen.dart';

class RootScreenHandler extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting)
        return _buildWaiting();
      else{
        if(snapshot.hasData)
          return DashboardClientScreen();
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