import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class MySharedPreference {

  Future<SharedPreferences>? _prefs;

  String currentUser = 'whw54T21q';

  MySharedPreference(){
    _prefs = SharedPreferences.getInstance();
  }

  Future<void> setUser(User user) async {
    final prefs = await _prefs;
    await prefs?.setString(currentUser, json.encode(user.toJson()));
  }

  Future<User?> getUser() async {
    final prefs = await _prefs;

    if(prefs!.containsKey(currentUser)) {
      var data = json.decode(prefs.get(currentUser) as String);
      User user = User.fromJson(data);
      return user;
    }

    return null;
  }

  Future remove(String key) async {
    final prefs = await _prefs;
    if(prefs!.containsKey(key)) {
      prefs.remove(key);
    }
  }
}