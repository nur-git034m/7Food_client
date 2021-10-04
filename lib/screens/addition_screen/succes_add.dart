import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seven_food_client/constants/widgets.dart';
import 'package:seven_food_client/screens/history_screens/history_page.dart';

class SuccessAdd extends StatelessWidget {
  final String sum;
  SuccessAdd({required this.sum});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
          context,
          'Детали добавления',
          const Icon(
            FontAwesomeIcons.times,
          ), true),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.1),
          child: Column(
            children: [
              const Text(
                'Успешно добавлен',
                style: TextStyle(
                    color: Color(
                      0xFF008000,
                    ),
                    fontSize: 25.0),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: screenSize.height * 0.03),
                child: const Icon(
                  FontAwesomeIcons.checkCircle,
                  size: 149,
                  color: Color(0xFF008000),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: screenSize.height * 0.03),
                child: const Text(
                  'Добавлен товар на сумму',
                  style: TextStyle(
                      color: Color(
                        0xFF495D8F,
                      ),
                      fontSize: 25.0),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.044,
                margin:
                    const EdgeInsets.symmetric(horizontal: 154, vertical: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xFF596273),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Text(
                  sum,
                  style:
                      const TextStyle(color: Color(0xFF495D8F), fontSize: 19.0),
                ),
              ),
              const Spacer(
                flex: 11,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF47536D)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryPage()));
                },
                child: const Text(
                  'Посмотреть историю',
                  style: TextStyle(color: Colors.white, fontSize: 19.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}