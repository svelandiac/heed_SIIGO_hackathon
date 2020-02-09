import 'package:flutter/material.dart';
import 'package:heed/ui/common-widgets/essentials/app_text.dart';
import 'package:heed/ui/common-widgets/essentials/safe_screen.dart';
import 'package:heed/ui/common-widgets/search_bar_widget.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  // Variables declaration
  MediaQueryData _mediaQueryData; // We will use it to know the screen's size, and to make a responsive application
  AppText _appText; // We will use it for strings into the app

  static const _defaultMargin = 24.0;

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
      child: SearchBarWidget(),
    );
  }

  Widget _buildBody() {
    return SafeScreen(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _mediaQueryData.size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: _appText.title('Tus productos'),
            ),
            SizedBox(
              height: _mediaQueryData.size.height * 0.04,
            ),
            _buildSearchBar()
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
  }
  
  @override
  Widget build(BuildContext context) {

    // Variables initialization
    _mediaQueryData = MediaQuery.of(context);

    return _buildBody();
  }
}