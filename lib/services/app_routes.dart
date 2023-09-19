import 'package:flutter/material.dart';
import 'package:todolist/screens/bin_screen.dart';
import 'package:todolist/screens/tabs_screen.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case BinScreen.id:
        return MaterialPageRoute(builder: (ctx) => const BinScreen());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (ctx) => TabsScreen());
      default:
        return null;
    }
  }
}
