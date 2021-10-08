import 'package:flutter/material.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:seven_food_client/constants/widgets.dart';
import 'package:seven_food_client/screens/card_screen/add_card.dart';
import 'package:seven_food_client/screens/list_shop_screeens/home_page_screen.dart';

class PayMethod extends StatelessWidget {
  const PayMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar:
          appBar(context, 'Способ оплаты', const Icon(Icons.arrow_back), true),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 28,
            ),
            const Text(
              'Выберите, пожалуйста, способ оплаты, либо добавьте новую карту',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 20),
              child: Row(
                children: [
                  Card(
                    child: IconButton(
                        onPressed: () {
                           Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddCardScreen()));
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        )),
                    color: AppColors.kbackground,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  const Text(
                    'Добавить карту',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 460,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.02,
                  horizontal: screenSize.width * 0.320,
                ),
                shape: const StadiumBorder(),
                primary: AppColors.kbackground,
              ),
              child: const Text(
                'Пропустить ',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const Homepage(),
                  ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
