import 'package:flutter/material.dart';
import 'package:heed/ui/common-widgets/essentials/app_text.dart';
import 'package:heed/ui/common-widgets/essentials/safe_screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Variables declaration
  MediaQueryData mediaQueryData; // We will use it to know the screen's size, and to make a responsive application
  AppText appText; // We will use it for strings into the app

  static const defaultMargin = 24.0;

  Widget _buildTitle() {
    return Center(
      child: appText.title('Iniciar sesión'),
    );
  }

  Widget _buildFirstSubtitle() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: defaultMargin, right: defaultMargin),
        child: appText.firstSubtitle(
          text: 'Identifícate con tus credenciales para disfrutar de la aplicación.',
          centerText: true
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SafeScreen(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: mediaQueryData.size.height * 0.08,
            ),
            _buildTitle(),
            SizedBox(
              height: mediaQueryData.size.height * 0.04,
            ),
            _buildFirstSubtitle()
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Variables initialization
    mediaQueryData = MediaQuery.of(context);
    appText = AppText();

    // Build the screen
    return _buildBody();
  }
}