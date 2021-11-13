import 'package:flutter/material.dart';
import 'package:flutter_navigation3/Router/RouteInformationParser.dart';
import 'package:flutter_navigation3/Router/RouterDelegate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyRouterDelegate routerDelegate = MyRouterDelegate();
  MyRouteInformationParser routeInformationParser = MyRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Navigation demo',
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate);
  }
}
