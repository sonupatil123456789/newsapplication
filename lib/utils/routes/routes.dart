import 'package:flutter/material.dart';
import 'package:nuseapp/utils/routes/routes_name.dart';
import 'package:nuseapp/view/screens/profile_screen.dart';

import '../../App.dart';
import '../../view/exceptionscreen/no_internet.dart';
import '../../view/screens/search_screen.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.app:
        return MaterialPageRoute(builder: (buildContext) => App());

      case RoutesName.profileScreen:
        return MaterialPageRoute(builder: (buildContext) => ProfileScreen());

      case RoutesName.noInternet:
        return MaterialPageRoute(builder: (buildContext) => NoInternet());

      case RoutesName.searchScreen:
        return MaterialPageRoute(builder: (buildContext) => SearchScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("Default")),
          );
        });
    }
  }
}
