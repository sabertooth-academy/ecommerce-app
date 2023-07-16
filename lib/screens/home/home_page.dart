import 'package:ecommerce_app/route/route_manager.dart';
import 'package:ecommerce_app/utils/global_variables.dart';
import 'package:flutter/material.dart';

import '../../utils/my_shared_preference.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _sharedPreference = MySharedPreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Welcome Back!'),

          ElevatedButton(onPressed: () {
            _sharedPreference.remove(MySharedPreference().currentUser);
            currentUser = null;
            Navigator.pushNamedAndRemoveUntil(context, RouteManager.login, (route) => false);
          }, child: const Text('Logout'))
        ],
      ),),
    );
  }
}
