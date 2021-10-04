import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:seven_food_client/data/models/show_case.dart';
import 'package:seven_food_client/screens/action_choice/your_choice.dart';
import 'package:seven_food_client/services/shop_product_service/list_shop_product_service.dart';

class OpenWithID {
  String titleScanner = 'Ошибка при сканировании';
  String titleID = 'Ошибка при вводе';
  String contentScanner = 'Просканируйте другой QR код, или просканируйте этот QR код еще раз';
  String contentID = 'Введите правильный код';
  Widget getOpenWithID(List showcasesID, QRViewController? _controller, context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.39,
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinCodeTextField(
              keyboardType: TextInputType.number,
              appContext: context,
              length: 5,
              onChanged: (value) {
                print(value);
              },
              onCompleted: (value) {
                checkToOpen(showcasesID, value, false, _controller, context);
              },
            ),
            const SizedBox(height: 10,),
            const Text('Введите код', style: TextStyle(fontSize: 20),),
            const SizedBox(height: 5,),
            const Text('который отображен на холодильнике'),
            const SizedBox(height: 20,),
            IconButton(
                icon: Icon(FontAwesomeIcons.times, color: Colors.blue[300], size: 40,),
                onPressed: () => Navigator.pop(context)),
          ],
        )
    );
  }

  checkToOpen(List showcasesID, String _id, bool byQRorID, QRViewController? _controller, context) async {
    ShowCase _message = await ListShopsService().getShowCase(int.parse(_id),context);
    if (showcasesID.contains(int.parse(_id))) {
     
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const YourChoicePage()));
        
    } 
  }

 
}