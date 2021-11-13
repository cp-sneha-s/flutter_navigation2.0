import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation3/Router/RouterDelegate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MyRouterDelegate routerDelegate = MyRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            //   child: myWidgetList.elementAt(routerDelegate.tab),
            // child: routerDelegate.myRoute,
            ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 18,
          onTap: (value) {
            setState(() {
              routerDelegate.onTap(value);
            });

            print('value:${value.toString()}');
            print('tab:${routerDelegate.tab.toString()}');
          },
          currentIndex: routerDelegate.tab,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                backgroundColor: Colors.teal,
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
              backgroundColor: Colors.teal,
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.teal,
                icon: Icon(
                  MdiIcons.heart,
                  color: Colors.white,
                ),
                label: 'Like'),
            BottomNavigationBarItem(
                backgroundColor: Colors.teal,
                icon: Icon(
                  Icons.miscellaneous_services_rounded,
                  color: Colors.white,
                ),
                label: 'Setting'),
          ],
        ),
      ),
    );
  }
}
