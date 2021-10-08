import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/card.dart';
import 'package:seven_food_client/data/models/cards.dart';
import 'package:seven_food_client/screens/card_screen/webview_page.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CardService {
  Future<Cards> myCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    var headers = {
      'Authorization': 'Bearer $token',
    };

    http.Response response = await http
        .get(Uri.parse('https://7food.kz/api/users/cards'), headers: headers);

    if (response.statusCode == 200) {
      return Cards.fromJson(json.decode(response.body));
      // if (json.decode(response.body)["data"] == []) {
      //   return [];
      // } else {
      //   List<CardEntity> list = [
      //     CardEntity.fromJson(json.decode(response.body)["data"][0])
      //   ];
      //   return list;
      // }
    } else {
      print(response.statusCode);
      throw Exception(response.reasonPhrase);
    }
  }

  Future<void> toAddCard(context) async {

     SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

     var headers = {
      'Authorization': 'Bearer $token',
    };


    http.Response response =
        await http.post(Uri.parse('https://7food.kz/api/users/cards/add'), headers: headers);

    if (response.statusCode == 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WebViewPage()));
    } else {
      print(json.decode(response.body)['message']);
      print(response.statusCode);
    }
  }
}
