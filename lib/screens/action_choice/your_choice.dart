import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:seven_food_client/constants/widgets.dart';
import 'package:seven_food_client/screens/addition_screen/succes_add.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_pusher/pusher.dart';


class YourChoicePage extends StatefulWidget {
  const YourChoicePage({Key? key}) : super(key: key);

  @override
  _YourChoicePageState createState() => _YourChoicePageState();
}

class _YourChoicePageState extends State<YourChoicePage> {
  var sum;
  late Channel _channel;

  bool _visability = true;

  List _history = [];

  @override
  void initState() {
    super.initState();

    _initPusher();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  color: AppColors.kbackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Ваше действие',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 15,
                  vertical: MediaQuery.of(context).size.width / 4,
                ),
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kshadow,
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SizedBox(),
                      Text(
                        'Дверь открыта',
                        style:
                            TextStyle(color: Color(0xFF008000), fontSize: 17),
                      ),
                      SizedBox(),
                      Icon(
                        FontAwesomeIcons.doorOpen,
                        size: 44,
                        color: Color(0xFF008000),
                      ),
                      SizedBox(),
                      Text(
                        'Пожалуйста, не забудьте закрыть дверь',
                        style:
                            TextStyle(color: Color(0xFF952323), fontSize: 13),
                      ),
                      SizedBox(),
                    ],
                  ),
                ),
              ),
              _visability
                  ? Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 319),
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kshadow,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                          child: Text(
                        ' Возьмите то что хотите взять',
                        style:
                            TextStyle(color: Color(0xFFA6AAB4), fontSize: 15),
                      )),
                    )
                  : Positioned(
                      top: MediaQuery.of(context).size.width * 0.01,
                      left: MediaQuery.of(context).size.width * 0.01,
                      right: MediaQuery.of(context).size.width * 0.01,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.7,
                        ),
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _history.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.04,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.01,
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 13,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.kshadow,
                                      blurRadius: 3,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        networkImage(
                                          context,
                                          _history[index]['image'],
                                        ),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            cardChoice(
                                              index,
                                              'Название',
                                              _history[index]['name'],
                                            ),
                                            cardChoice(index, 'Количество',
                                                '${_history[index]['quantity']}'),
                                            cardChoice(
                                              index,
                                              'Цена',
                                              '${_history[index]['price']}',
                                            ),
                                          ],
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
              sum != null
                  ? Positioned(
                      left: MediaQuery.of(context).size.width * 0.11,
                      right: MediaQuery.of(context).size.width * 0.11,
                      bottom: MediaQuery.of(context).size.height * 0.02,
                      child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.kbackground,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.kshadow,
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.02,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$sum',
                            // _history[0]['sum'].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          )),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Card cardChoice(
    int index,
    String textAction,
    String nameAction,
  ) {
    return Card(
      color: const Color(0xFFEFF2F7),
      child: ListTile(
        title: Text(textAction),
        trailing: Text(
          nameAction,
        ),
      ),
    );
  }

  Future<void> _initPusher() async {
    try {
      await Pusher.init('74637838c2f684d6db41', PusherOptions(cluster: 'mt1'));
    } catch (e) {
      print(e);
    }

    Pusher.connect(onConnectionStateChange: (val) {
      print(val.currentState);
    }, onError: (err) {
      print(err.message);
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _channel = await Pusher.subscribe('user.${prefs.getInt('id')}');

    _channel.bind('App\\Events\\FridgeOpened', (onEvent) {
      if (mounted) {
        print('Open fridge ept');
        final snackbar = SnackBar(content: Text('Open'));
      }
    });

    _channel.bind('App\\Events\\FridgeProductChanged', (onEvent) {
      if (mounted) {
        final data = json.decode(onEvent.data);
        setState(() {
          _visability = false;
          for (int i = 0;
              i < json.decode(onEvent.data)['products'].length;
              i++) {
            sum = data['sum'];
            _history.add({
              'name': data['products'][i]['name'],
              'price': data['products'][i]['price'],
              'quantity': data['products'][i]['quantity'],
              'image': data['products'][i]['image'],
            });
          }
        });
        print(data);
        print('sum:$sum');
        print("history:$_history");
      }
    });

    _channel.bind('App\\Events\\FridgeClosed', (onEvent) {
      if (mounted) {
        final close = json.decode(onEvent.data);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SuccessAdd(sum: close['sum'])),
        );
        print('closed fridge epta');
      }
    });
  }
}