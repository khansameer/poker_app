import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poker/core/services/AppConfig.dart';
import 'package:poker/core/services/network_repository.dart';
import 'package:poker/core/utils/PreferenceHelper.dart';
import 'package:poker/features/login/model/login_model.dart';

class LoginProvider with ChangeNotifier{
  static Future<LoginModel> loginUser(
      String email, String pass, BuildContext context) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": pass,
    };
    try {
      String endPoint = AppConfig.LOGIN;
      var response = await callPostMethod(endPoint, body);
      LoginModel result = LoginModel.fromJson(json.decode(response));
      print('===sass${response}');
      if ( result.success==true) {
        PreferenceHelper.setString(
            PreferenceHelper.USER_DATA, response.toString());
      } else {
        LoginModel result =
        LoginModel(success: false, message: 'Internal Server Issue');
      }
      return result;
    } catch (e) {
      print('=======${e.toString()}');
      LoginModel result =
      LoginModel(success: false, message: 'Internal Serversdsdsddsd Issue');
      return result;
    }
  }
}