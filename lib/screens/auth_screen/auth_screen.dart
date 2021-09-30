import 'package:flutter/material.dart';
import 'package:seven_food_client/constants/color_constants.dart';
import 'package:seven_food_client/screens/auth_screen/check_screen.dart';
import 'package:seven_food_client/screens/auth_screen/enter_screen.dart';
import 'package:seven_food_client/services/welcome_user_service/user_service.dart';

class AuthScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  int phoneNumber = 0;

  String name = '';
  String password = '';
  String passwordConfirmation = '';
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: 361.0,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: AppColors.kbackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Вход/Регистрация',
                    style: TextStyle(
                        fontSize: 14.0, color: AppColors.kShowTextColor),
                  ),
                  const SizedBox(
                    height: 22.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Номер/email',
                    ),
                    onSaved: (value) => phoneController.text = value!,
                  ),
                  TextFormField(
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      labelText: 'Имя',
                    ),
                    onSaved: (value) => nameController.text = value!,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Пароль'),
                    obscureText: true,
                    
                    onSaved: (value) => passwordController.text = value!,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Пароль опять'),
                    obscureText: true,
                    onSaved: (value) =>
                        passwordConfirmationController.text = value!,
                  ),
                ],
              ),
            ),
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              top: 184,
            ),
            width: 308,
            height: 347,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(13.0),
                bottomRight: Radius.circular(13.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kshadow,
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.22,
                top: 507,
                bottom: 17),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: AppColors.kbackground,
              ),
              child: const Text(
                'Отправить',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (isValid) {
                  _formKey.currentState!.save();
                }
                UserService().toAuth(
                    nameController.text,
                    phoneController.text,
                    passwordController.text,
                    passwordConfirmationController.text,
                    context);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.32,
              top: 538,
            ),
            child: TextButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => CheckScreen()));
                },
                child: const Text(
                  'Забыли пароль?',
                  style: TextStyle(color: AppColors.kShowTextColor),
                )),
          ),
        ]),
      ),
    );
  }
}
