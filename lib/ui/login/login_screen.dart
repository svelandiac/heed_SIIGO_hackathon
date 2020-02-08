import 'package:flutter/material.dart';
import 'package:heed/ui/common-widgets/essentials/app_text.dart';
import 'package:heed/ui/common-widgets/essentials/app_text_field.dart';
import 'package:heed/ui/common-widgets/essentials/safe_screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Variables declaration
  MediaQueryData _mediaQueryData; // We will use it to know the screen's size, and to make a responsive application
  AppText _appText; // We will use it for strings into the app
  TextEditingController _emailController;

  static const _defaultMargin = 24.0;

  Widget _buildTitle() {
    return Center(
      child: _appText.title('Iniciar sesión'),
    );
  }

  Widget _buildFirstSubtitle() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
        child: _appText.firstSubtitle(
          text: 'Identifícate con tus credenciales para disfrutar de la aplicación.',
          centerText: true
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _appText.textFieldTitle(text: 'Correo electrónico:'),
          SizedBox(
            height: 15.0,
          ),
          AppTextField(
            controller: _emailController,
            hintText: 'email@correo.com',
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SafeScreen(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: _mediaQueryData.size.height * 0.08,
            ),
            _buildTitle(),
            SizedBox(
              height: _mediaQueryData.size.height * 0.04,
            ),
            _buildFirstSubtitle(),
            SizedBox(
              height: _mediaQueryData.size.height * 0.09,
            ),
            _buildEmailField()
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
    _mediaQueryData = MediaQuery.of(context);
    _appText = AppText();

    // Build the screen
    return _buildBody();
  }
}