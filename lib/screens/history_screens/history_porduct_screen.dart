import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:seven_food_client/constants/widgets.dart';
import 'package:seven_food_client/data/models/history_details.dart';
import 'package:seven_food_client/screens/card_screen/profile_screen.dart';
import 'package:seven_food_client/screens/list_shop_screeens/list_shop_screen.dart';
import 'package:seven_food_client/services/history_services/history_details.dart';

class HistoryOfProducts extends StatefulWidget {
  final int id;
  HistoryOfProducts(this.id);

  @override
  _HistoryOfProductsState createState() => _HistoryOfProductsState();
}

class _HistoryOfProductsState extends State<HistoryOfProducts> {
 
  late Future<HistoryDetails> historyProductInfo;
  @override
  void initState() {
    // TODO: implement initState
    historyProductInfo =
        HistoryDetailsService().getHistoryofProducts(widget.id);
  }

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:
          appBar(context, 'История', const Icon(Icons.arrow_back), true),
      body: FutureBuilder<HistoryDetails>(
        future: historyProductInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.kshadow,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(snapshot.data!.data.date,
                                style: const TextStyle(fontSize: 14)),
                            Text(snapshot.data!.data.time,
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Card_up_history(snapshot, 'Номер покупки',
                          snapshot.data!.data.id.toString()),
                      const SizedBox(
                        height: 8,
                      ),
                      Card_up_history(
                        snapshot,
                        'Местоположение',
                        snapshot.data!.data.address,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF47536D),
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.kshadow,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Итоговая сумма',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            Text(snapshot.data!.data.total,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.01,
                      horizontal: MediaQuery.of(context).size.height * 0.02),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.469,
                    child: ListView.builder(
                      itemCount: snapshot.data!.data.details.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 13,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.kshadow,
                                    blurRadius: 3,
                                    spreadRadius: 2,
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
                                        snapshot
                                            .data!.data.details[index].image,
                                      ),
                                      Expanded(
                                          child: Column(
                                        children: [
                                          CardHistory(
                                              snapshot,
                                              index,
                                              'Название',
                                              snapshot.data!.data.details[index]
                                                  .name),
                                          CardHistory(
                                              snapshot,
                                              index,
                                              'Количество',
                                              snapshot.data!.data.details[index]
                                                  .quantity),
                                          CardHistory(
                                              snapshot,
                                              index,
                                              'Цена',
                                              snapshot.data!.data.details[index]
                                                  .price),
                                          CardHistory(
                                              snapshot,
                                              index,
                                              'Сумма',
                                              snapshot.data!.data.details[index]
                                                  .sum),
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
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

  Card Card_up_history(AsyncSnapshot<HistoryDetails> snapshot, String textTitle,
      String trailingText) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      color: Colors.white,
      child: ListTile(
        title: Text(textTitle, style: const TextStyle(fontSize: 17)),
        trailing: Text(trailingText, style: const TextStyle(fontSize: 17)),
      ),
    );
  }

  Card CardHistory(
    AsyncSnapshot<HistoryDetails> snapshot,
    int index,
    String titleText,
    String ListText,
  ) {
    return Card(
      color: const Color(0xFFEFF2F7),
      child: ListTile(
        title: Text(titleText),
        trailing: Text(ListText),
      ),
    );
  }
}