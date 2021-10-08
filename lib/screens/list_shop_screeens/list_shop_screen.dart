import 'package:flutter/material.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:seven_food_client/constants/widgets.dart';
import 'package:seven_food_client/data/models/shops_models.dart';
import 'package:seven_food_client/screens/card_screen/profile_screen.dart';
import 'package:seven_food_client/screens/history_screens/history_page.dart';
import 'package:seven_food_client/screens/list_shop_screeens/show_screen.dart';
import 'package:seven_food_client/screens/map_screen/map_screen.dart';
import 'package:seven_food_client/screens/message_screen/message_screen.dart';
import 'package:seven_food_client/services/shop_product_service/list_shop_product_service.dart';

class List_shops_map extends StatefulWidget {
  const List_shops_map({Key? key}) : super(key: key);

  @override
  State<List_shops_map> createState() => _List_shops_mapState();
}

class _List_shops_mapState extends State<List_shops_map> {
  late Future<ListShops> showInfo;
  @override
  void initState() {
    showInfo = ListShopsService().getListofLocations();
  }

  
  bool selectedColor = true;

  int _bottomNavIndex = 0;

  final List<bool> _selections = List.generate(2, (index) => false);

  List<bool> _selectedBotton = [true, false];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: 
        appBar(context, '7Food на карте',const Icon(Icons.arrow_back),false),
      body: FutureBuilder<ListShops>(
        future: showInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.04,
                    ),
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColors.kTextColor,
                      fillColor: AppColors.kbackground,
                      selectedColor: Colors.white,
                      children: [
                        pad_name_togle_buttons('Список '),
                        pad_name_togle_buttons('На карте'),
                      ],
                      isSelected: _selectedBotton,
                      onPressed: (int index) {
                        setState(
                          () {
                            for (int i = 0; i < _selectedBotton.length; i++) {
                              _selectedBotton[i] = i == index;
                            }
                          },
                        );
                      },
                    )),
                _selectedBotton[0]
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.05,
                        ),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.kshadow,
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: shops_map(
                                  context,
                                  snapshot,
                                  index,
                                  snapshot.data!.data[index].name,
                                  snapshot.data!.data[index].address,
                                ),
                              );
                            }),
                      )
                    : const MapScreen(),
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Card shops_map(
    BuildContext context,
    AsyncSnapshot<ListShops> snapshot,
    int index,
    String titleText,
    String subTitleText,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Row(
            children: [
              Image.asset(
                'assets/img/fredg.png',
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Expanded(
                  child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowScreen(
                                id: snapshot.data!.data[index].id.toString())),
                      );
                    },
                    title: Text(
                      titleText,
                      style: const TextStyle(
                          color: AppColors.kShowTextColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      subTitleText,
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Padding pad_name_togle_buttons(String name_button_togle) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Text(name_button_togle),
    );
  }
}
