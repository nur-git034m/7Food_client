import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:seven_food_client/constants/widgets.dart';
import 'package:seven_food_client/screens/auth_screen/enter_screen.dart';
import 'package:seven_food_client/screens/auth_screen/welcome_screeen.dart';
import 'package:seven_food_client/screens/card_screen/profile_screen.dart';
import 'package:seven_food_client/screens/history_screens/history.dart';
import 'package:seven_food_client/screens/history_screens/history_page.dart';
import 'package:seven_food_client/screens/message_screen/message_screen.dart';

import 'list_shop_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Homepage> {
  // Icons.shop,Icons.message
  final List<Widget> pages = [
    const List_shops_map(),
    const HistoryPage(),
    const MessageScreen(),
    ProfilePage(),
  ];
  int bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        // appBar: appBar(context, _bottomNavIndex == 0 ? '7Food на карте': 'История',  _bottomNavIndex == 0 ? const Icon(Icons.arrow_back_ios,):   const Icon(  FontAwesomeIcons.times,)),
        // body: pages[_bottomNavIndex],
        floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
            ? floatinActionButton(context)
            : const SizedBox(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.kActiveColor,
          unselectedItemColor: AppColors.kInActiveColor,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int index) {},
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'cart'),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: 'help'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ],
        ),
      ),
      children: pages,
      onItemTap: (int index) => setState(() => bottomNavIndex = index),
    );
  }
}
