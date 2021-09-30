import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF338ADA),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0)),
            ),
            margin: EdgeInsets.only(
                left: screenSize.width * 0.04,
                right: screenSize.width * 0.12,
                top: screenSize.height * 0.03),
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.04,
                vertical: screenSize.height * 0.04),
            child: const Text(
              'Здравствуйте! Поддержку мы осуществляем черезпопулярные мессенджеры ',
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 250,
          ),
          const Text(
            'Выберите, пожалуйста, наиболее удобное приложение для Вас и напишите сообщение! ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 14,
          ),
          // ElavatedButton(screenSize, 'Написать в WhatsApp',Colors.green,),

          ButtonToChats(screenSize, () {
            launch('https://wa.me/87758584436');
          }, FontAwesomeIcons.whatsapp, 'Написать в WhatsApp', Colors.green),

          ButtonToChats(screenSize, () {
            launch('https://wa.me/87758584436');
          }, FontAwesomeIcons.telegram, 'Написать в Telegram', Colors.blue),
        ],
      )),
    );
  }

  InkWell ButtonToChats(Size screenSize, Function onTap, IconData icon,
      String text, Color color) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.01,
          horizontal: screenSize.width * 0.147,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.01,
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Text(
            text,
            style: const TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
