import 'package:ecommerce_app/route/route_manager.dart';
import 'package:ecommerce_app/utils/global_variables.dart';
import 'package:ecommerce_app/utils/my_shared_preference.dart';
import 'package:flutter/material.dart';

import '../../model/user.dart';
import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _sharedPreference = MySharedPreference();

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 100,),

              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Saber',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.cyan),
                        children: [
                          TextSpan(text: 'Tooth', style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold, color: Colors.black))
                        ],
                      ),
                    ),

                    const Text('Login your account to continue...'),
                  ],
                ),
              ),

              const SizedBox(height: 50,),

              const Text('Username', style: TextStyle(fontWeight: FontWeight.w500),),

              const SizedBox(height: 10,),

              TextFormField(
                controller: usernameTextController,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Please enter username!';
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.cyan.withOpacity(0.2),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.cyan, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.cyan, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.cyan, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              const Text('Password', style: TextStyle(fontWeight: FontWeight.w500),),

              const SizedBox(height: 10,),

              TextFormField(
                controller: passwordTextController,
                obscureText: !isVisiblePassword,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Please enter password!';
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.cyan.withOpacity(0.2),
                  suffixIcon: IconButton(
                    icon: !isVisiblePassword ? Icon(Icons.visibility, color: Colors.grey.shade700,) : Icon(Icons.visibility_off, color: Colors.grey.shade700,),
                    onPressed: () {
                      setState((){
                        isVisiblePassword = !isVisiblePassword;
                      });
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.cyan, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.cyan, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.cyan, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),

              const SizedBox(height: 40,),

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: MaterialButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()) {
                        currentUser?.userName = usernameTextController.text;
                        _sharedPreference.setUser(currentUser ?? User());
                        Navigator.pushNamed(context, RouteManager.home);
                      }
                    },
                    color: Colors.cyan,
                    child: const Text('Login', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
