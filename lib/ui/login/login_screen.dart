import 'package:flutter/material.dart';
import 'package:heed/ui/common-widgets/essentials/app_button.dart';
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
  TextEditingController _emailController; // Textfield controller where we will save the user's input
  TextEditingController _passwordController;  // Textfield controller where we will save the user's input

  static const _defaultMargin = 24.0;

  void submit() {
    print('''
    
      Login information:
        Username: ${_emailController.text} 
        Password: ${_passwordController.text} 
    ''');
  } 

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

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _appText.textFieldTitle(text: 'Contraseña:'),
          SizedBox(
            height: 15.0,
          ),
          AppTextField(
            controller: _passwordController,
            hintText: '************',
            password: true,
          )
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: AppButton(
        text: 'Ingresar',
        onPressed: submit,
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
              height: _mediaQueryData.size.height * 0.12,
            ),
            _buildTitle(),
            SizedBox(
              height: _mediaQueryData.size.height * 0.04,
            ),
            _buildFirstSubtitle(),
            SizedBox(
              height: _mediaQueryData.size.height * 0.09,
            ),
            _buildEmailField(),
            SizedBox(
              height: _mediaQueryData.size.height * 0.02,
            ),
            _buildPasswordField(),
            SizedBox(
              height: _mediaQueryData.size.height * 0.1,
            ),
            _buildSubmitButton()
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Constant variables initialization
    _appText = AppText();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    // Variables initialization
    _mediaQueryData = MediaQuery.of(context);

    // Build the screen
    return _buildBody();
  }
}