import 'package:flutter/cupertino.dart';
import 'package:flutter_navigation3/Router/MyRoute.dart';

class MyRouteInformationParser extends RouteInformationParser<MyConfiguration> {
  @override
  RouteInformation restoreRouteInformation(MyConfiguration configuration) {
    switch (configuration.myRoute) {
      case MyRoute.home:
        return RouteInformation(location: '/home', state: configuration.tab);
      case MyRoute.search:
        return RouteInformation(location: '/search', state: configuration.tab);
      case MyRoute.like:
        return RouteInformation(location: '/like', state: configuration.tab);
      case MyRoute.setting:
        return RouteInformation(location: '/setting', state: configuration.tab);
    }
    throw 'unknown';
  }

  @override
  Future<MyConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final String routeName = routeInformation.location;

    if (routeName == '/home') {
      return MyConfiguration(MyRoute.home, routeInformation.state);
    } else if (routeName == '/search') {
      return MyConfiguration(MyRoute.search, routeInformation.state);
    } else if (routeName == '/like') {
      return MyConfiguration(MyRoute.like, routeInformation.state);
    } else if (routeName == '/setting') {
      return MyConfiguration(MyRoute.setting, routeInformation.state);
    }
    throw 'unKnown';
  }
}
