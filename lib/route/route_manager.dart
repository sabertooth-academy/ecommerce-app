import 'package:ecommerce_app/screens/home/home_page.dart';
import 'package:ecommerce_app/screens/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String login = '/login';
  static const String home = '/home';

  static Route<dynamic> generate(RouteSettings routeSettings) {
    final dynamic args = routeSettings.arguments;

    switch(routeSettings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('No Page Found!'),),));
    }
  }
}