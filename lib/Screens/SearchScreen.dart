import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Search",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Text('Search screen'),
      ),
    );
  }
}
