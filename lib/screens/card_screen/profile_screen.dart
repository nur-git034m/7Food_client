import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:seven_food_client/constants/widgets.dart';
import 'package:seven_food_client/data/models/User.dart';
import 'package:seven_food_client/data/models/cards.dart';
import 'package:seven_food_client/screens/history_screens/history.dart';
import 'package:seven_food_client/services/card_service.dart';
import 'package:seven_food_client/services/welcome_user_service/profile_service.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late Future<Cards> futureCard;

  @override
  void initState() {
    super.initState();
    userInfo = ProfileService().ProfileNameAndPhone();
    futureCard = CardService().myCard();
    // getCards();
  }

  // late CardEntity cards;


  // getCards() async {
  //   CardEntity tempList = await CardService().myCard();
  //   setState(() {
  //     cards = tempList;
  //   });
  // }

  final formKey = GlobalKey<FormState>();

  final _numberController = TextEditingController();

  final _nameController = TextEditingController();

  final _bonusController = TextEditingController();

  late Future<User> userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Профиль', const Icon(Icons.arrow_back), false),
      body: FutureBuilder<User>(
        future: userInfo,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error');
          } else if (snapshot.hasData) {
            _nameController.text = snapshot.data!.data.name;
            _numberController.text = snapshot.data!.data.phone;
            _bonusController.text = snapshot.data!.data.bonus;
          }
          return Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            color: const Color(0xFFE5E5E5),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 30, left: 22, right: 24, bottom: 21),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Бонусы',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(
                              width: 190,
                            ),
                            Text(
                              _bonusController.text,
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Имя'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF2F7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                fillColor: Colors.red,
                                border: InputBorder.none,
                                suffix: TextButton(
                                  child: const Text('изменить'),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                )),
                            onEditingComplete: () {
                              ProfileService().ChangeNameAndPhone(
                                  _nameController.text, _numberController.text);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Номер'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF2F7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            controller: _numberController,
                            decoration: const InputDecoration(
                              fillColor: Colors.red,
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Способ оплаты'),
                        ),
                        Container(
                          child: Column(
                            children: [
                              FutureBuilder<Cards>(
                                future: futureCard,
                                builder: (context, snapshot) {
                                  if(snapshot.hasData) {
                                    return snapshot.data!.data.isNotEmpty 
                                    ? Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEFF2F7),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: TextFormField(
                                        controller: _nameController,
                                        decoration: InputDecoration(
                                            icon:
                                                const Icon(FontAwesomeIcons.qq),
                                            fillColor: Colors.red,
                                            border: InputBorder.none,
                                            suffix: TextButton(
                                              child: const Text('изменить'),
                                              onPressed: () {
                                                setState(() {});
                                              },
                                            )),
                                      ),
                                    ) 
                                    : ElevatedButton(
                                      onPressed: () {
                                        CardService().toAddCard(context);
                                      },
                                      child: const Text('Добавить карту'));
                                  } else if (snapshot.hasError) {
                                    return Text('${snapshot.error}');
                                  }
                                  return Text('');
                                },
                              )
                            
                            ],
                          ),
                          // cards == [] ?
                          //   ElevatedButton(onPressed: (){}, child: Text('Добавить карту')),
                          //   padding: const EdgeInsets.symmetric(horizontal: 16),
                          //   decoration: BoxDecoration(
                          //     color: const Color(0xFFEFF2F7),
                          //     borderRadius: BorderRadius.circular(15),
                          //   ),
                          //  : child: TextFormField(
                          //     controller: _nameController,
                          //     decoration: InputDecoration(
                          //       icon: Icon(FontAwesomeIcons.qq),
                          //         fillColor: Colors.red,
                          //         border: InputBorder.none,
                          //         suffix: TextButton(
                          //           child: const Text('изменить'),
                          //           onPressed: () {
                          //             setState(() {});
                          //           },
                          //         )),
                          //     // onEditingComplete: () {
                          //     //   ProfileService().ChangeNameAndPhone(
                          //     //       _nameController.text, _numberController.text);
                          //     // },
                          //   ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
