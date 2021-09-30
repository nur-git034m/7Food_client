import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seven_food_client/data/models/User.dart';
import 'package:seven_food_client/screens/auth_screen/check_screen.dart';
import 'package:seven_food_client/screens/auth_screen/welcome_screeen.dart';
import 'package:seven_food_client/screens/list_shop_screeens/home_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserService {


  Future<void> loginByPassword(String phone, String password, context) async {
    final response = await http.post(Uri.parse(
        'https://7food.kz/api/auth/login?phone=$phone&password=$password'));
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CheckScreen(numField: phone,)));
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      String _token = json.decode(response.body)['token'];
      int _id = json.decode(response.body)['id'];
      _prefs.setString('token', _token);
      _prefs.setInt('id', _id);
      print('${_prefs.getInt('id')}');
    } else {
      print(json.decode(response.body)['message']);
      print(response.statusCode);
    }
  }






  Future<void> toAuth(String name, String phoneNumber, String password,
      String passwordConfirmation, context) async {
    var headers = {
      'Content-language': 'ru',
    };

    final http.Response response = await http.post(
        Uri.parse(
            'https://7food.kz/api/auth/register?name=$name&phone=$phoneNumber&password=$password&password_confirmation=$passwordConfirmation'),
        headers: headers);

    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CheckScreen(
                    numField: phoneNumber,
                  )));
    } else {
      print(json.decode(response.body)['message']);
      print(response.statusCode);
    }
  }

  Future<void> toConfirmCheckAuth(
      String phoneNumber, String verificationCode, context) async {
    http.Response response = await http.post(Uri.parse(
        'https://7food.kz/api/auth/register/confirm?phone=$phoneNumber&verification_code=$verificationCode'));

    if (response.statusCode == 200) {
      // print(response.body);
      // print('dsa');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    } else {
      print(json.decode(response.body)['message']);
      print(response.statusCode);
    }
  }

  Future<void> toNumService(String phoneNumber, context) async {
    http.Response response = await http.post(
        Uri.parse('https://7food.kz/api/auth/login/phone?phone=$phoneNumber'));

    if (response.statusCode == 200) {
      // print(response.body);
      // print('dsa');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>Homepage()));
    } else {
      print(json.decode(response.body)['message']);
      print(response.statusCode);
    }
  }

  Future<void> toConfirmNumService(
      String phoneNumber, String verificationCode, context) async {
    http.Response response = await http.post(Uri.parse(
        'https://7food.kz/api/auth/login/confirm?phone=$phoneNumber&verification_code=$verificationCode'));

    if (response.statusCode == 200) {
      // print(response.body);
      // print('dsa');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    } else {
      print(json.decode(response.body)['message']);
      print(response.statusCode);
    }
  }
}
