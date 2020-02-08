import 'package:flutter/material.dart';
import 'package:heed/access-data/models/user.dart';
import 'package:heed/controllers/auth_controller.dart';
import 'package:heed/ui/common-widgets/essentials/app_button.dart';
import 'package:heed/ui/common-widgets/essentials/app_text.dart';
import 'package:heed/ui/common-widgets/essentials/app_text_field.dart';
import 'package:heed/ui/common-widgets/essentials/safe_screen.dart';
import 'package:heed/ui/common-widgets/loading_widget.dart';
import 'package:provider/provider.dart';

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
  bool _loading; // Defines when the user sees a circular progress indicator
  AuthController _authController; // Controller for authentication
  User _userProvider; // User information provider

  static const _defaultMargin = 24.0;

  Future<void> submit() async {

    // Method for logging in

    setState(() {
      this._loading = true;
    });



    _authController.loginWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim()
    ).then((value) {
      setState(() {
        this._loading = false;
      });
    }).catchError((error) {
      print(error);
    });

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
        onPressed: !_loading ? submit : null,
      ),
    );
  }  

  Widget _buildBody() {
    return SafeScreen(
      body: Stack(
        children: <Widget>[
          _buildLoading(),
          SingleChildScrollView(
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
        ],
      ),
    );
  }

  Widget _buildLoading() {
    if (_loading)
      return LoadingWidget();
    else  
      return Container();
  }

  @override
  void initState() {
    super.initState();

    // Constant variables initialization
    _appText = AppText();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _loading = false;
    _authController = AuthController();
  }

  @override
  Widget build(BuildContext context) {

    // Variables initialization
    _mediaQueryData = MediaQuery.of(context);
    _userProvider = Provider.of<User>(context);

    // Build the screen
    return _buildBody();
  }
}