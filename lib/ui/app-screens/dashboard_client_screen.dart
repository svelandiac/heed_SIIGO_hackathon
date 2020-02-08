import 'package:flutter/material.dart';
import 'package:heed/ui/common-widgets/essentials/app_text.dart';
import 'package:heed/ui/common-widgets/essentials/safe_screen.dart';

class DashboardClientScreen extends StatefulWidget {
  @override
  _DashboardClientScreenState createState() => _DashboardClientScreenState();
}

class _DashboardClientScreenState extends State<DashboardClientScreen> {

  AppText appText;
  
  Widget _buildBody() {
    return SafeScreen(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            appText.title('Dashboard screen')
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    appText = AppText();
  }
  
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}