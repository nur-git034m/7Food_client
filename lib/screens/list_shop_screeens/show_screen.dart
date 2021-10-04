import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:seven_food_client/constants/widgets.dart';
import 'package:seven_food_client/data/models/show_case.dart';
import 'package:seven_food_client/screens/card_screen/card_screen.dart';
import 'package:seven_food_client/screens/history_screens/history_page.dart';
import 'package:seven_food_client/screens/list_shop_screeens/list_shop_screen.dart';
import 'package:seven_food_client/screens/message_screen/message_screen.dart';
import 'package:seven_food_client/services/shop_product_service/list_shop_product_service.dart';


class ShowScreen extends StatefulWidget {
  final String id;

  const ShowScreen({Key? key, required this.id}) : super(key: key);
  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  late Future<ShowCase> showCaseInfo;
  @override
  void initState() {
    // TODO: implement initState
    showCaseInfo = ListShopsService().getShowCase(int.parse(widget.id), context);
  }


  final int _bottomNavIndex = 0;
  int index = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        appBar(context, 'Витрина',const Icon(Icons.arrow_back),true),
      body: FutureBuilder<ShowCase>(
        future: showCaseInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 13,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kshadow,
                          blurRadius: 5,
                          spreadRadius: 4,
                          offset: const Offset(0, 5),
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
                              snapshot.data!.data[index].image,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                showCard(
                                  snapshot,
                                  index,
                                  'Название',
                                  snapshot.data!.data[index].name,
                                ),
                                showCard(
                                  snapshot,
                                  index,
                                  'Количество',
                                  snapshot.data!.data[index].quantity,
                                ),
                                showCard(snapshot, index, 'Цена',
                                    snapshot.data!.data[index].price)
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // floatingActionButton: floatinActionButton(context),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   activeColor: AppColors.kActiveColor,
      //   inactiveColor: AppColors.kInActiveColor,
      //   icons: iconList,
      //   activeIndex: _bottomNavIndex,
      //   gapLocation: GapLocation.center,
      //   onTap: (index) => setState(() => pages[_bottomNavIndex] ),
      // ),
    );
  }

  Card showCard(AsyncSnapshot<ShowCase> snapshot, int index, String textShow,
      String traiShow) {
    return Card(
      color: const Color(
        0xFFEFF2F7,
      ),
      child: ListTile(
        title: Text(
          textShow,
          style: TextStyle(color: Color(0xFF47536D)),
        ),
        trailing: Text(
          traiShow,
        ),
      ),
    );
  }
}
