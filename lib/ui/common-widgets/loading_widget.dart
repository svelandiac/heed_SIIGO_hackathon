import 'package:flutter/material.dart';
import 'package:heed/ui/common-widgets/essentials/safe_screen.dart';

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeScreen(
      body: Center(child: CircularProgressIndicator()),
    );
  }

}