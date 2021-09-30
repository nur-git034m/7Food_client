import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seven_food_client/screens/action_choice/your_choice.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class QrService {
  Future<String> postQrScanner(String fridgeId, context) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print(token);
    var headers = {
      'Content-Language': 'ru',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    };

    http.Response response = await http.post(
        Uri.parse(
            'https://7food.kz/api/users/purchases/clients/open?fridge_id=$fridgeId'),
        headers: headers);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const YourChoicePage()),
      );
      return '';
    } else {
      print(response.statusCode);
      throw Exception(response.reasonPhrase);
    }
  }
}