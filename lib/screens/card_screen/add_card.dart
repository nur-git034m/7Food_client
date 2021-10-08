import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seven_food_client/constants/widgets.dart';

class AddCardScreen extends StatefulWidget {
  AddCardScreen({Key? key}) : super(key: key);

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  appBar(context, 'Мои карты', const Icon(FontAwesomeIcons.times), true),
      body: SafeArea(child: Column(children: [

      ],),
    ),);
  }
}