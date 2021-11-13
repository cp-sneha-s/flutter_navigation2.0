import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation3/Router/MyRoute.dart';
import 'package:flutter_navigation3/Router/RouteInformationParser.dart';
import 'package:flutter_navigation3/Router/RouterDelegate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  MyRouterDelegate routerDelegate = MyRouterDelegate();
  MyRouteInformationParser routeinformationParser = MyRouteInformationParser();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Navigation demo',
      home: Scaffold(
        body:Router(
            routeInformationParser: routeinformationParser,
            routerDelegate: routerDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 18,
          onTap: (value) {
            routerDelegate.onTap(value);
            setState(() {
              routerDelegate.tab= value;
            });

            print('value:${value.toString()}');
             print('tab:${routerDelegate.configuration.tab.toString()}');
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