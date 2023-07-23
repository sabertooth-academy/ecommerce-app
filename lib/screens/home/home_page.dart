import 'package:ecommerce_app/route/route_manager.dart';
import 'package:ecommerce_app/utils/global_variables.dart';
import 'package:flutter/material.dart';

import '../../utils/my_shared_preference.dart';
import '../../widgets/image_slider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [

          SizedBox(height: 10,),

          ImageSlider(),
        ],
      ),
    );
  }
}
