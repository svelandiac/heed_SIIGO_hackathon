import 'package:flutter/material.dart';
import 'package:heed/access-data/models/user.dart';
import 'package:heed/controllers/auth_controller.dart';
import 'package:heed/ui/common-widgets/essentials/app_button.dart';
import 'package:heed/ui/common-widgets/essentials/app_text.dart';
import 'package:heed/ui/common-widgets/essentials/safe_screen.dart';
import 'package:heed/ui/common-widgets/products_summary_widget.dart';
import 'package:provider/provider.dart';

class DashboardClientScreen extends StatefulWidget {
  @override
  _DashboardClientScreenState createState() => _DashboardClientScreenState();
}

class _DashboardClientScreenState extends State<DashboardClientScreen> {

  // Variables declaration
  MediaQueryData _mediaQueryData; // We will use it to know the screen's size, and to make a responsive application
  AppText _appText; // We will use it for strings into the app
  AuthController _authController; // Controller for authentication
  User _userProvider; // User information

  static const _defaultMargin = 24.0;

  Widget _buildLogOutButton() {
    return IconButton(
      icon: Icon(Icons.power_settings_new),
      onPressed: () {
        _authController.logOut(userProvider: _userProvider);
      },
    );
  }

  Widget _buildUserName() {
    return Padding(
      padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _appText.firstSubtitle(
            text: _userProvider.name,
            textColor: Colors.black
          ),
          _appText.secondSubtitle(
            text: _userProvider.company,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryOfYourProducts() {
    return Row(
      children: <Widget>[
        _appText.firstSubtitle(
          text: 'Resumen de tus productos',
          textColor: Colors.black,
          bold: true
        ),
      ],
    );
  }

  Widget _buildSummary() {
    return ProductsSummaryWidget();
  }

  Widget _buildShowMyProductsButton() {
    return Center(
      child: AppButton(
        text: 'Ver todos mis productos',
        onPressed: () {
          Navigator.pushNamed(context, 'ProductsScreen');
        },
      ),
    );
  }

  Widget _buildAddNewProductsButton() {
    return Center(
      child: AppButton(
        text: 'Añadir nuevos productos',
        onPressed: () {
          Navigator.pushNamed(context, 'NewProductsScreen');
        },
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
                  _appText.title('Bienvenido,'),
                  Spacer(),
                  _buildLogOutButton()
                ],
              ),
            ),
            SizedBox(
              height: _mediaQueryData.size.height * 0.045,
            ),
            _buildUserName(),
            SizedBox(
              height:  _mediaQueryData.size.height * 0.08,
            ),
            Padding(
              padding: EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: _buildSummaryOfYourProducts(),
            ),
            SizedBox(
              height:  _mediaQueryData.size.height * 0.045,
            ),
            Padding(
              padding: EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: _buildSummary(),
            ),
            SizedBox(
              height:  _mediaQueryData.size.height * 0.08,
            ),
            _buildShowMyProductsButton(),
            SizedBox(
              height:  _mediaQueryData.size.height * 0.02,
            ),
            _buildAddNewProductsButton()
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
    _authController = AuthController();
  }
  
  @override
  Widget build(BuildContext context) {

    // Variables initialization
    _mediaQueryData = MediaQuery.of(context);
    _userProvider = Provider.of<User>(context);

    return _buildBody();
  }
}