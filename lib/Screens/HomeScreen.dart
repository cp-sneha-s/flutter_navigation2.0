import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  final List<String> list;
  final ValueChanged<String> onTapped;

  HomeScreen({@required this.list, @required this.onTapped});

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
        child: ListView(
          children: [
            for (var item in list)
              ListTile(
                title: Text(item),
                onTap: () => onTapped(item),
              )
          ],
        ),
      ),
    );
  }
}
