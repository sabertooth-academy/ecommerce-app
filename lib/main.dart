import 'package:ecommerce_app/route/route_manager.dart';
import 'package:flutter/material.dart';

import 'screens/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteManager.generate,
      initialRoute: RouteManager.splashScreen,
    );
  }
}
