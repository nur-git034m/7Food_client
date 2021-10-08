import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {

     TextEditingController controller = TextEditingController();

  bool isButtonEnabled = false;

  checkPhoneNumber(String value) {
    if (value.length == 12) {
      isButtonEnabled = true;
      notifyListeners();
    } else {
      isButtonEnabled = false;
      notifyListeners();
    }
  }
    
    

  
  
}
