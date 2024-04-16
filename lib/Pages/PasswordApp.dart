import '/Getxcontroller/controllerphoneinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../color.dart';

class PasswordApp extends StatefulWidget {
  const PasswordApp({super.key});

  @override
  State<PasswordApp> createState() => _PasswordAppState();
}

class _PasswordAppState extends State<PasswordApp> {
  late bool bl_lock = false;
  @override
  void initState() {
    getlock();
    print(Get.find<controllerphoneinfo>(tag: 'secend').theme.value);
    print(theme[Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![1]);
    // TODO: implement initState
    super.initState();
  }

  getlock() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String lock = prefs.getString('valuepassword') ?? 'بدون رمز';
      lock == 'بدون رمز' ? bl_lock = false : bl_lock = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'تنظیم امنیت ورود به نرم افزار',
                  style: TextStyle(fontFamily: 'A'),
                ),
                const SizedBox(
                  width: 30,
                ),
                SvgPicture.asset(
                  'assets/key-square.svg',
                  height: 23,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: Get.width * 0.9,
            height: Get.height * 0.08,
            decoration: ShapeDecoration(
              color: theme[
                  Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![4],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: [
                BoxShadow(
                  color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                      .theme
                      .value]![5],
                  blurRadius: 8,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              //verticalDirection: VerticalDirection.up,
              children: [
                Container(
                  height: Get.height * 0.06,
                  width: 80,
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: theme[
                              Get.find<controllerphoneinfo>(tag: 'secend')
                                  .theme
                                  .value]![1]),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Checkbox(
                          value: bl_lock,
                          onChanged: (value) async {
                            setState(() {
                              bl_lock = value!;
                            });
                            String copy1 =
                                value == true ? 'رمز عبور' : 'بدون رمز';
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            prefs.setString('valuepassword', copy1);
                          })),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'ورود با رمز عبور',
                    style: TextStyle(fontFamily: 'A'),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: Get.width * 0.9,
            height: Get.height * 0.08,
            decoration: ShapeDecoration(
              color: theme[
                  Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![4],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: [
                BoxShadow(
                  color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                      .theme
                      .value]![5],
                  blurRadius: 8,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              //verticalDirection: VerticalDirection.up,
              children: [
                InkWell(
                  onTap: () => changePasswordApp(),
                  child: Container(
                    height: Get.height * 0.06,
                    width: 80,
                    margin: EdgeInsets.only(
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: theme[
                                Get.find<controllerphoneinfo>(tag: 'secend')
                                    .theme
                                    .value]![1]
                            //Color(0xFFFFE600)
                            ),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      'اعمال',
                      style: TextStyle(fontFamily: 'A'),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'تغییر پسورد دستگاه',
                    style: TextStyle(fontFamily: 'A'),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

TextEditingController tf_changepasswordapp = TextEditingController();
changePasswordApp() {
  Get.bottomSheet(
      Container(
        width: Get.width,
        height: Get.height * 0.4,
        decoration: BoxDecoration(
            color: theme[
                Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![4],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('تغییر پسورد ورود به نرم افزار'),
            Container(
              width: Get.width * 0.9,
              height: Get.height * 0.08,
              decoration: ShapeDecoration(
                color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                    .theme
                    .value]![4],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                        .theme
                        .value]![5],
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                //verticalDirection: VerticalDirection.up,
                children: [
                  InkWell(
                    onTap: () => confirmChangepass(),
                    child: Container(
                      height: Get.height * 0.06,
                      width: 80,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFFFE600)),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        'اعمال',
                        style: TextStyle(fontFamily: 'A'),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      )),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: Get.width * 0.4,
                        child: TextField(
                          controller: tf_changepasswordapp,
                          maxLength: 4,
                          autofocus: true,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(fontFamily: 'A'),
                        ),
                      )),
                ],
              ),
            ),
            Text(''),
          ],
        ),
      ),
      elevation: 10,
      barrierColor: Color.fromARGB(76, 34, 34, 34));
}

confirmChangepass() {
  Get.back();
  Get.defaultDialog(
    title: 'هشدار!',
    middleText: 'از تغییر دادن پسورد ورود به نرم افزار مطمعن هستید؟',
    textConfirm: 'بله',
    onConfirm: () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('password', tf_changepasswordapp.text);
      Get.back();
      Get.snackbar('توجه', 'تغییر پسورد ورود به نرم افزار صورت گرفت');
    },
  );
}
