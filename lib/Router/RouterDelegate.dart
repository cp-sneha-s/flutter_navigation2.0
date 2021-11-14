import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation3/Router/MyRoute.dart';
import 'package:flutter_navigation3/Screens/DeailScreen.dart';
import 'package:flutter_navigation3/Screens/HomeScreen.dart';
import 'package:flutter_navigation3/Screens/LikeScreen.dart';
import 'package:flutter_navigation3/Screens/SearchScreen.dart';
import 'package:flutter_navigation3/Screens/SettingScreen.dart';

import 'MyRoute.dart';

class MyRouterDelegate extends RouterDelegate<MyConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  String selectedItem;
  List<String> listItem = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  void handleOnTap(String value) {
    selectedItem = value;
    notifyListeners();
  }

  MyConfiguration configuration = MyConfiguration(MyRoute.home, 0);

  MyConfiguration setConfig(int value) {
    if (value == 0) {
      selectedItem == null
          ? configuration = MyConfiguration(MyRoute.home, value)
          : configuration = MyConfiguration(MyRoute.detail, value);
    }
    if (value == 1) {
      configuration = MyConfiguration(MyRoute.search, value);
    }
    if (value == 2) {
      configuration = MyConfiguration(MyRoute.like, value);
    }
    if (value == 3) {
      configuration = MyConfiguration(MyRoute.setting, value);
    }
    notifyListeners();
  }

  @override
  MyConfiguration get currentConfiguration => configuration;

  @override
  Future<void> setNewRoutePath(MyConfiguration configuration) async {
    this.configuration = configuration;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: <Page<void>>[
          MaterialPage(
              key: ValueKey('home'),
              child: HomeScreen(
                list: listItem,
                onTapped: handleOnTap,
              )),
          if (configuration.myRoute == MyRoute.search)
            MaterialPage(key: ValueKey('search'), child: SearchScreen()),
          if (configuration.myRoute == MyRoute.like)
            MaterialPage(key: ValueKey('like'), child: LikeScreen()),
          if (configuration.myRoute == MyRoute.setting)
            MaterialPage(key: ValueKey('setting'), child: SettingScreen()),
          if (configuration.myRoute == MyRoute.detail || selectedItem != null)
            MaterialPage(
                key: ValueKey(selectedItem),
                child: DetailScreen(
                  item: selectedItem,
                )),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          selectedItem = null;
          setConfig(0);
          notifyListeners();
          return true;
        });
  }
}
