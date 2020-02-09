import 'package:flutter/material.dart';
import 'package:heed/ui/common-widgets/essentials/app_button.dart';
import 'package:heed/ui/common-widgets/essentials/app_text.dart';
import 'package:heed/ui/common-widgets/essentials/safe_screen.dart';

class NewProductsScreen extends StatefulWidget {
  @override
  _NewProductsScreenState createState() => _NewProductsScreenState();
}

class _NewProductsScreenState extends State<NewProductsScreen> {

  // Variables declaration
  MediaQueryData _mediaQueryData; // We will use it to know the screen's size, and to make a responsive application
  AppText _appText; // We will use it for strings into the app

  static const _defaultMargin = 24.0;

  Widget _buildCSVButton() {
    return Center(
      child: AppButton(
        text: 'Mediante archivo CSV',
        onPressed: () {
          Navigator.pushNamed(context, 'CSVUploadScreen');
        },
      ),
    );
  }

  Widget _buildManualButton() {
    return Center(
      child: AppButton(
        text: 'Añadirlos manualmente',
        onPressed: () {

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
              height: _mediaQueryData.size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: _appText.title('Añadir nuevos productos'),
            ),
            SizedBox(
              height: _mediaQueryData.size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: _appText.firstSubtitle(
                text: 'Puedes elegir entre subir los productos manualmente, o mediante un archivo masivo CSV'
              ),
            ),
            SizedBox(
              height: _mediaQueryData.size.height * 0.12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: _defaultMargin, right: _defaultMargin),
              child: _appText.firstSubtitle(
                text: 'Selecciona una opción para continuar',
                bold: true
              ),
            ),
            SizedBox(
              height: _mediaQueryData.size.height * 0.12,
            ),
            _buildCSVButton(),
            SizedBox(
              height: _mediaQueryData.size.height * 0.08,
            ),
            _buildManualButton()
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