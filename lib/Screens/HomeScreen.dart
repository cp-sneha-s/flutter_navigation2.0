import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,

        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Icon(
            MdiIcons.home,
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Text('Home screen '),
      ),
    );
  }
}
