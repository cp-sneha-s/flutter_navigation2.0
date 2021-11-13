import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../main.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Setting",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Icon(
            MdiIcons.settings,
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Text('Setting screen'),
      ),
    );
  }
}
