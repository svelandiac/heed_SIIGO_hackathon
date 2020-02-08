import 'package:flutter/material.dart';
import 'package:heed/ui/common-widgets/essentials/app_text.dart';
import 'package:heed/ui/common-widgets/essentials/safe_screen.dart';

class BringingInformationFromDatabaseScreen extends StatelessWidget {
  
  final AppText _appText = AppText();
  
  @override
  Widget build(BuildContext context) {
    return SafeScreen(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _appText.firstSubtitle(
              text: 'Cargando...'
            ),
            SizedBox(
              height: 15.0,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}