import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:seven_food_client/constants/widgets.dart';
import 'package:seven_food_client/screens/auth_screen/enter_screen.dart';
import 'package:seven_food_client/screens/auth_screen/welcome_screeen.dart';
import 'package:seven_food_client/screens/card_screen/card_screen.dart';
import 'package:seven_food_client/screens/history_screens/history.dart';
import 'package:seven_food_client/screens/history_screens/history_page.dart';
import 'package:seven_food_client/screens/message_screen/message_screen.dart';


import 'list_shop_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Homepage> {
  
  // Icons.shop,Icons.message
  final List pages = [const List_shops_map(), const HistoryPage(), const MessageScreen(),const CardScreen()];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, _bottomNavIndex == 0 ? '7Food на карте': 'История',  _bottomNavIndex == 0 ? const Icon(Icons.arrow_back_ios,):   const Icon(  FontAwesomeIcons.times,)),
      body: pages[_bottomNavIndex],
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom==0
      ? floatinActionButton(context)
      : const SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        
        activeColor: AppColors.kActiveColor,
        inactiveColor: AppColors.kInActiveColor,
        icons: const [
          Icons.home,Icons.shopping_cart, Icons.message,Icons.person,
        ],
        
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}