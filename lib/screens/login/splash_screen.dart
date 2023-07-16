import 'package:ecommerce_app/route/route_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 600).animate(_animationController)..addListener(() {
      setState(() {});
    });
    _animationController.forward();

    _onStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: _animation.value,
          width: _animation.value,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }

  void _onStart() async {
    await Future.delayed(const Duration(seconds: 2));

    if(!mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, RouteManager.login, (route) => false);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
