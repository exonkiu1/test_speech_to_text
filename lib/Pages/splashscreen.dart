// ignore_for_file: camel_case_types, file_names

import 'dart:async';

import 'package:cherry_toast/cherry_toast.dart';
import '/testpage/home%20page%201%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import '../color.dart';
import '/Getxcontroller/controllerphoneinfo.dart';
//import '/Pages/darwer/drawer.dart';

//import '/Pages/homepage/widget.dart';
//import 'package:card_swiper/card_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/Getxcontroller/controllerOnOff.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

String storedPasscode = '1234';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String texttilte = 'رمز خود را وارد کنید';
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;
  @override
  void initState() {
    //  gotomainpage();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> fetchNetworkCall() async {
      print('SplashScreen');
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String lock = prefs.getString('valuepassword') ?? 'بدون رمز';
      // lock = 'اثر انگشت';
      bool lock2 = true;
      Get.find<controlleronoff>(tag: 'secend').valuepassword.value =
          prefs.getString('valuepassword') ?? 'بدون رمز';

      Get.find<controllerphoneinfo>(tag: 'secend').theme.value =
          prefs.getString('theme') ?? 'light';
      Get.find<controllerphoneinfo>(tag: 'secend').theme.value == 'dark'
          ? Get.changeThemeMode(ThemeMode.dark)
          : Get.changeThemeMode(ThemeMode.light);
      // Get.find<controllerphoneinfo>(tag: 'secend').theme.value = 'light';
      /*      if (Get.find<controlleronoff>(tag: 'secend').theme.value) {
        print('GOToMainPage1');
      } else {
        print('GOToMainPage2');
      } */

      storedPasscode = prefs.getString('password') ?? '0000';
      // lock = true;
      //  lock = 'اثر انگشت';
      if (lock == 'اثر انگشت') {
        final LocalAuthentication localAuthentication = LocalAuthentication();
        bool isBiometricSupported =
            await localAuthentication.isDeviceSupported();
        bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

        bool isAuthenticated = false;

        if (isBiometricSupported && canCheckBiometrics) {
          isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'لطفا اثر انگشت خود را وارد کنید',
          );
        }
        if (isAuthenticated) {
          Get.to(() => HomePage1());
        } else {
          CherryToast.error(
            backgroundColor: theme[
                Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![0],
            title: Text(
              'خطا',
              style: TextStyle(
                fontFamily: 'A',
              ),
            ),
            action:
                Text("اثر انگشت اشتباه است", style: TextStyle(fontFamily: 'A')),
            actionHandler: () {
              print("Action button pressed");
            },
          ).show(context);
        }
        // return isAuthenticated;
      }
      if (lock == 'رمز عبور') {
        ehsan();
        final LocalAuthentication localAuthentication = LocalAuthentication();
        bool isBiometricSupported =
            await localAuthentication.isDeviceSupported();
        bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

        bool isAuthenticated = false;

        if (isBiometricSupported && canCheckBiometrics) {
          isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'لطفا اثر انگشت خود را وارد کنید',
          );
        }
        if (isAuthenticated) {
          Get.to(() => HomePage1());
        } else {
          CherryToast.error(
            backgroundColor: theme[
                Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![0],
            title: Text(
              'خطا',
              style: TextStyle(
                fontFamily: 'A',
              ),
            ),
            action:
                Text("اثر انگشت اشتباه است", style: TextStyle(fontFamily: 'A')),
            actionHandler: () {
              print("Action button pressed");
            },
          ).show(context);
        }
        print(lock);
      }
      if (lock == 'بدون رمز') {
        await Future.delayed(Duration(milliseconds: 1500), () {
          Get.off(HomePage1());
        });

        print('بدون رمز عبووووور');
        print(lock);

        //Get.off(() => homepage());
      }

      return lock2;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<bool>(
          future: fetchNetworkCall(), // async work
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 200,
                    ),
                    Text(
                      'Home Alarm',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 200,
                    ),
                    Text(
                      'Home Alarm',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  void ehsan() {
    _showLockScreen(
      context,
      opaque: false,
      cancelButton: Text(
        'Cancel',
        style: const TextStyle(fontSize: 16, color: Colors.white),
        semanticsLabel: 'Cancel',
      ),
    );
  }

  _customColorsLockScreenButton(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      child: Text('Open Custom Lock Screen'),
      onPressed: () {
        _showLockScreen(context,
            opaque: false,
            circleUIConfig: CircleUIConfig(
                borderColor: Colors.blue,
                fillColor: Colors.blue,
                circleSize: 30),
            keyboardUIConfig: KeyboardUIConfig(
                digitBorderWidth: 2, primaryColor: Colors.blue),
            cancelButton: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
            digits: ['一', '二', '三', '四', '五', '六', '七', '八', '九', '零']);
      },
    );
  }

  _showLockScreen(
    BuildContext context, {
    required bool opaque,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    required Widget cancelButton,
    List<String>? digits,
  }) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
            title: Text(
              texttilte,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: _onPasscodeEntered,
            cancelButton: cancelButton,
            deleteButton: Text(
              'Delete',
              style: const TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Delete',
            ),
            shouldTriggerVerification: _verificationNotifier.stream,
            backgroundColor: Colors.black.withOpacity(0.8),
            cancelCallback: _onPasscodeCancelled,
            digits: digits,
            passwordDigits: 4,
            //bottomWidget: _buildPasscodeRestoreButton(),
          ),
        ));
  }

  _onPasscodeEntered(String enteredPasscode) async {
    bool isValid = storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
        texttilte = 'صحیح,منتظر بمانید';
      });
      await Future.delayed(Duration(milliseconds: 500), () {
        Get.off(() => HomePage1());
      });
    }
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  _buildPasscodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: TextButton(
            child: Text(
              "Reset passcode",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            onPressed: _resetAppPassword,
            // splashColor: Colors.white.withOpacity(0.4),
            // highlightColor: Colors.white.withOpacity(0.2),
            // ),
          ),
        ),
      );

  _resetAppPassword() {
    Navigator.maybePop(context).then((result) {
      if (!result) {
        return;
      }
      _showRestoreDialog(() {
        Navigator.maybePop(context);
        //TODO: Clear your stored passcode here
      });
    });
  }

  _showRestoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Reset passcode",
            style: const TextStyle(color: Colors.black87),
          ),
          content: Text(
            "Passcode reset is a non-secure operation!\n\nConsider removing all user data if this action performed.",
            style: const TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text(
                "Cancel",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            TextButton(
              child: Text(
                "I understand",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: onAccepted,
            ),
          ],
        );
      },
    );
  }

  void gotomainpage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
/*     Get.find<controlleronoff>(tag: 'secend').moodcolor.value =
          prefs.getBool('darktheme') == true ? 'dark' : 'purple'; */

    print(await prefs.getBool('OnPassword'));
    /*   if (prefs.getBool('OnPassword') ?? false == true) {
      final LocalAuthentication auth = LocalAuthentication();
      // ···
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      if (canAuthenticateWithBiometrics == true) {
        bool authenticated = false;
        try {
          // ignore: deprecated_member_use
          authenticated = await auth.authenticateWithBiometrics(
              localizedReason: 'Scan your fingerprint to authenticate',
              useErrorDialogs: true,
              stickyAuth: true);
        } catch (e) {
          print(e);
        }

        if (authenticated) {
          await Future.delayed(Duration(
            seconds: 1,
          ));
          if (Get.find<controllerphoneinfo>(tag: 'secend')
                  .lenghtmainpage
                  .value !=
              0) {
            Get.offNamed('/HomePage');
          } else {
            Get.off(AddDevices());
          }
        }
        //Yess All OK
        else {
          Get.snackbar('خطا', 'دوباره امتحان کنید');
        }
      } else {
        await Future.delayed(Duration(
          seconds: 1,
        ));
        Get.offNamed('/HomePage');
      }
    } else {
      await Future.delayed(Duration(
        seconds: 1,
      ));
      if (Get.find<controllerphoneinfo>(tag: 'secend').lenghtmainpage.value !=
          0) {
        Get.offNamed('/HomePage');
      } else {
        Get.off(AddDevices());
      }
    } */
  }
}
