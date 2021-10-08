import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:seven_food_client/constants/widgets.dart';

import 'package:seven_food_client/services/welcome_user_service/user_service.dart';

class CheckScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final String numField;
  CheckScreen({required this.numField});

  String pinCode = '';

  final pinCodeController = TextEditingController();
  String num = '';

  final numController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, numField, const Icon(Icons.arrow_back_ios), true),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.05,
            ),
            child: const Text(
              'Код проверки ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.071,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  pinTheme: PinTheme(
                    activeColor: Colors.green,
                    inactiveColor: const Color(0xFF613EEA),
                    activeFillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                  onSaved: (value) => pinCodeController.text = value!,
                  onCompleted: (value) {
                    UserService().toConfirmCheckAuth(
                        numField, pinCodeController.text, context);
                    (value) => pinCodeController.text = value!;
                  },
                  appContext: context,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.02,
            ),
            child: const Text(
              'Отправить код через SMS ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.02,
                horizontal: screenSize.width * 0.320,
              ),
              primary: AppColors.kbackground,
            ),
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (isValid) {
                _formKey.currentState!.save();
                final message = 'Telephone: $numField ';
                UserService().toConfirmNumService(numField, message, context);
              }
            },
            child: const Text(
              'Войти',
              style: TextStyle(fontSize: 20.0),
            ),
          )
          // IconButton(
          //   icon: const Icon(FontAwesomeIcons.times),
          //   onPressed: () {},
          //   color: const Color(0xFF613EEA),
          //   iconSize: 34,
          // )
        ],
      )),
    );
  }
}
