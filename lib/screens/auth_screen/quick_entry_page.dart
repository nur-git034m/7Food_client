import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pin_dot/pin_dot.dart';
import 'package:pin_keyboard/pin_keyboard.dart';
import 'package:seven_food_client/screens/list_shop_screeens/home_page_screen.dart';
import 'package:seven_food_client/screens/list_shop_screeens/list_shop_screen.dart';

class QuickEntryPage extends StatefulWidget {
  const QuickEntryPage({Key? key}) : super(key: key);

  @override
  _QuickEntryPageState createState() => _QuickEntryPageState();
}

class _QuickEntryPageState extends State<QuickEntryPage> {
  String pin_code = '';
  late Size size;

  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  late bool _canCheckBiometrics;
  late List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason:
              'Scan your fingerprint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
    if (authenticated == true) {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const List_shops_map()));
    }
  }

  void _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 147),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Быстрый вход',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF47536D),
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Введите код доступа к приложению',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF47536D),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 31,
                ),
                PinDot(
                  size: 17,
                  length: 4,
                  text: pin_code,
                  activeColor: Colors.blue[700],
                  borderColor: Colors.yellow[700],
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              // alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                  // top: size.height * 0.65,
                  left: size.width * 0.15,
                  right: size.width * 0.15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PinKeyboard(
                    length: 4,
                    enableBiometric: true,
                    iconBiometricColor: Colors.blue[400],
                    onChange: (pin) {
                      setState(() {
                        pin_code = pin;
                      });
                    },
                    onConfirm: (pin) {
                      if (pin_code == '1234') {
// Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ShowcaseList()), (route) => false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  const Homepage()));
                      }
                    },
                    onBiometric: () {
                      _authenticateWithBiometrics();
                      print('yep');
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}