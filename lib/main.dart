// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seven_food_client/screens/auth_screen/auth_screen.dart';
import 'package:seven_food_client/screens/auth_screen/welcome_screeen.dart';
import 'package:seven_food_client/screens/card_screen/payment_method_screen.dart';
import 'package:seven_food_client/screens/list_shop_screeens/home_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/auth_screen/quick_entry_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _token = prefs.getString('token');
  // print('TOKEN: $_token');
  if (_token == null) print('NOO token');


  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _token == null ? const WelcomeScreen() : const QuickEntryPage()),
  );
}


  // QuickEntryPage
 


//87773875041
//123123123

//77770835197