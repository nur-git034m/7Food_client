import 'package:http/http.dart' as http;
import 'package:seven_food_client/data/models/show_case.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ShowCaseService{

Future<ShowCase> getShowCase(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print(token);

    var headers = {
      'Content-Language': 'ru',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    };

    http.Response response = await http
        .get(Uri.parse('https://7food.kz/api/users/showcases/$id/products'), headers: headers);

    if (response.statusCode == 200) {
      return ShowCase.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      throw Exception(response.reasonPhrase);
    }
  }

}