import 'package:flutter/material.dart';
import 'package:heed/access-data/models/user.dart';
import 'package:heed/controllers/auth_controller.dart';
import 'package:heed/ui/common-widgets/essentials/app_text.dart';
import 'package:heed/ui/common-widgets/essentials/safe_screen.dart';
import 'package:provider/provider.dart';

class DashboardClientScreen extends StatefulWidget {
  @override
  _DashboardClientScreenState createState() => _DashboardClientScreenState();
}

class _DashboardClientScreenState extends State<DashboardClientScreen> {

  // Variables declaration
  MediaQueryData _mediaQueryData; // We will use it to know the screen's size, and to make a responsive application
  AppText appText; // We will use it for strings into the app
  AuthController _authController; // Controller for authentication
  User userProvider; // User information

  static const _defaultMargin = 24.0;

  Widget _buildLogOutButton() {
    return IconButton(
      icon: Icon(Icons.power_settings_new),
      onPressed: () {
        _authController.logOut();
      },
    );
  }

  Widget _buildUserName() {
    return Padding(
      padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          appText.firstSubtitle(
            text: userProvider.name,
          ),
          appText.firstSubtitle(
            text: userProvider.company,
          ),
        ],
      ),
    );
  }
  
  Widget _buildBody() { 
    return SafeScreen(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _mediaQueryData.size.height * 0.045,
            ),
            Padding(
              padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: Row(
                children: <Widget>[
                  appText.title('Bienvenido,'),
                  Spacer(),
                  _buildLogOutButton()
                ],
              ),
            ),
            SizedBox(
              height: _mediaQueryData.size.height * 0.045,
            ),
            _buildUserName()
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Constant variables initialization
    appText = AppText();
    _authController = AuthController();
  }
  
  @override
  Widget build(BuildContext context) {

    // Variables initialization
    _mediaQueryData = MediaQuery.of(context);
    userProvider = Provider.of<User>(context);

    return _buildBody();
  }
}