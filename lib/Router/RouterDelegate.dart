import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation3/Router/MyRoute.dart';
import 'package:flutter_navigation3/Screens/HomeScreen.dart';
import 'package:flutter_navigation3/Screens/LikeScreen.dart';
import 'package:flutter_navigation3/Screens/SearchScreen.dart';
import 'package:flutter_navigation3/Screens/SettingScreen.dart';

import 'MyRoute.dart';

class MyRouterDelegate extends RouterDelegate<MyConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyConfiguration configuration = MyConfiguration(MyRoute.home, 0);

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

  MyConfiguration setConfig(int value) {
    if (value == 0) {
      configuration = MyConfiguration(MyRoute.home, tab);
    }
    if (value == 1) {
      configuration = MyConfiguration(MyRoute.search, tab);
    }
    if (value == 2) {
      configuration = MyConfiguration(MyRoute.like, tab);
    }
    if (value == 3) {
      configuration = MyConfiguration(MyRoute.setting, tab);
    }
    notifyListeners();
  }

  @override
  MyConfiguration get currentConfiguration => setConfig(tab);

  @override
  Future<void> setNewRoutePath(MyConfiguration configuration) async {}

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: <Page<void>>[
          MaterialPage(key: ValueKey('home'), child: HomeScreen()),
          if (configuration.myRoute == MyRoute.search)
            MaterialPage(key: ValueKey('search'), child: SearchScreen()),
          if (configuration.myRoute == MyRoute.like)
            MaterialPage(key: ValueKey('like'), child: LikeScreen()),
          if (configuration.myRoute == MyRoute.setting)
            MaterialPage(key: ValueKey('setting'), child: SettingScreen()),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          return true;
        });
  }
}
