import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/utils/api_url.dart';
import 'package:ecommerce_app/widgets/my_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoginRepository {

  Future<http.Response> login(BuildContext context, String username, String password) async {
    final connectivity = await Connectivity().checkConnectivity();
    if(connectivity != ConnectivityResult.wifi && connectivity != ConnectivityResult.mobile) {
      throw Exception('No internet connection found! Please Connect one!');
    }

    MyProgressIndicator.textProgressIndicator(context);

    final client = http.Client();
    final data = {
      'username': username,
      'password': password
    };

    final url = Uri.parse(ApiUrl.loginUrl);

    try {
      final response = await client.post(
        url,
        body: data,
      );

      if(kDebugMode) {
        log('<<<<<<<< Login >>>>>>>>>> \n\n ${response.body} \n\n');
      }

      client.close();
      MyProgressIndicator.dismiss(context);
      return response;

    } on TimeoutException {

      client.close();
      MyProgressIndicator.dismiss(context);
      throw Exception('Connection timed out!');

    } catch(error) {

      client.close();
      MyProgressIndicator.dismiss(context);
      throw Exception('Something went wrong!');
    }
  }
}