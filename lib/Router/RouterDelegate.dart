import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation3/Router/MyRoute.dart';
import 'package:flutter_navigation3/Screens/HomeScreen.dart';
import 'package:flutter_navigation3/Screens/LikeScreen.dart';
import 'package:flutter_navigation3/Screens/SearchScreen.dart';
import 'package:flutter_navigation3/Screens/SettingScreen.dart';

class MyRouterDelegate extends RouterDelegate<MyConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyRoute _myRoute;
  MyRoute get myRoute => _myRoute;

  set myRoute(MyRoute value) {
    if (_myRoute == value) return;
    _myRoute = value;
    notifyListeners();
  }

  int _tab = 0;
  int get tab => _tab;
  set tab(int value) {
    if (_tab == value) return;
    _tab = value;
    notifyListeners();
  }

  void onTap(int value) {
    _tab = value;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(MyConfiguration configuration) async {}

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: <Page<void>>[
        MaterialPage(key: ValueKey('home'), child: HomeScreen()),
        if (_myRoute == MyRoute.search)
          MaterialPage(key: ValueKey('search'), child: SearchScreen()),
        if (_myRoute == MyRoute.like)
          MaterialPage(key: ValueKey('like'), child: LikeScreen()),
        if (_myRoute == MyRoute.setting)
          MaterialPage(key: ValueKey('setting'), child: SettingScreen()),
      ],
      onPopPage: (route, result) {
        final bool success = route.didPop(result);
        if (success) {
          _myRoute = MyRoute.home;
          notifyListeners();
        }
        return success;
      },
    );
  }
}
