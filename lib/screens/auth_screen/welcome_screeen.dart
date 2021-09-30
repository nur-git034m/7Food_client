import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:seven_food_client/screens/auth_screen/auth_screen.dart';
import 'package:seven_food_client/screens/auth_screen/enter_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                Image.asset(
                  'assets/img/icon.png',
                  fit: BoxFit.fitWidth,
                  width: screenSize.width * 0.320,
                  height: screenSize.height * 0.23,
                ),
                const Text(
                  'Привет!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Text(
                    'Добро пожаловать в 7food!',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
                  ),
                ),
                Image.asset(
                  'assets/img/1.png',
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width * 0.620,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Padding(
                  padding: PaddingText(screenSize),
                  child: const Text(
                    'Скоро вы сможете купить всечто захотите, сначала нужно зарегистрироывться',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: PaddingText(screenSize),
                  child: const Text(
                    'Нажмите на кнопку “Начать регистрацию”, я принимаю условия ',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Text(
                  'пользовательского соглашения',
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.kText,
                  ),
                ),
                 const SizedBox(
                        height: 10,
                      ),
                Container(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {  Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  AuthScreen()));},
                        child: const Text('Начать регистрацию',style:   
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                          primary: AppColors.kButtonColor,
                          padding: EdgeInsets.symmetric(
                            vertical: screenSize.height * 0.02,
                            horizontal: screenSize.width * 0.2,
                          ),
                      
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () { Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  EnterScreen()));},
                        child: const Text('Войти',style:   
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.kButtonColor,
                          padding: EdgeInsets.symmetric(
                            vertical: screenSize.height * 0.02,
                            horizontal: screenSize.width * 0.347,
                          ),
                            shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets PaddingText(Size screenSize) {
    return EdgeInsets.symmetric(
      vertical: screenSize.height * 0.01,
      horizontal: screenSize.width * 0.1,
    );
  }
}
