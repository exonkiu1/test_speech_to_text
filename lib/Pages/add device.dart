import 'package:cherry_toast/cherry_toast.dart';
import 'package:test_speech_to_text/send%20sms.dart';
import '/Getxcontroller/controllerOnOff.dart';
import '/Getxcontroller/controllerphoneinfo.dart';
import '/Pages/HomePage.dart/HomePage.dart';
import '/testpage/home%20page%201%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
//import 'package:telephony/telephony.dart';

import '../color.dart';

class AddDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              return Image.asset(
                Get.find<controllerphoneinfo>(tag: 'secend').theme.value ==
                        'dark'
                    ? 'assets/logo.png'
                    : 'assets/logo-dark.png',
                height: Get.height * 0.13,
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: Get.width * 0.8,
              height: 48,
              decoration: ShapeDecoration(
                color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                    .theme
                    .value]![4],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                shadows: [
                  BoxShadow(
                    color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                        .theme
                        .value]![5],
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: TextField(
                controller:
                    Get.find<controllerphoneinfo>(tag: 'secend').textnamephone,
                decoration: const InputDecoration(
                    hintText: '    نام دستگاه   ',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(fontFamily: 'A'),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.8,
              height: 48,
              decoration: ShapeDecoration(
                color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                    .theme
                    .value]![4],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                shadows: [
                  BoxShadow(
                    color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                        .theme
                        .value]![5],
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: TextField(
                controller:
                    Get.find<controllerphoneinfo>(tag: 'secend').textphone,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: '   شماره تلفن دستگاه    ',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(fontFamily: 'A'),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.8,
              height: 55,
              decoration: ShapeDecoration(
                color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                    .theme
                    .value]![4],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                shadows: [
                  BoxShadow(
                    color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                        .theme
                        .value]![5],
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 4,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    hintText: '     پسورد دستگاه    ',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(fontFamily: 'A'),
                    border: InputBorder.none),
                onChanged: (value) =>
                    Get.find<controllerphoneinfo>(tag: 'secend')
                        .Password
                        .value = value,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: Get.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.find<controlleronoff>(tag: 'secend')
                        .opretorsim
                        .value = 'ir',
                    child: Obx(() {
                      return Container(
                        width: Get.width * 0.18,
                        height: Get.width * 0.18,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/iramcell.jpg',
                              ),
                              fit: BoxFit.cover,
                              colorFilter: Get.find<controlleronoff>(
                                              tag: 'secend')
                                          .opretorsim
                                          .value !=
                                      'ir'
                                  ? ColorFilter.mode(
                                      const Color.fromARGB(255, 108, 108, 108),
                                      BlendMode.darken)
                                  : null),
                          shape: BoxShape.circle,
                          color: theme[
                              Get.find<controllerphoneinfo>(tag: 'secend')
                                  .theme
                                  .value]![4],
                          boxShadow: [
                            BoxShadow(
                              color: theme[
                                  Get.find<controllerphoneinfo>(tag: 'secend')
                                      .theme
                                      .value]![5],
                              spreadRadius: 5,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  InkWell(
                    onTap: () => Get.find<controlleronoff>(tag: 'secend')
                        .opretorsim
                        .value = 'ha',
                    child: Obx(() {
                      return Container(
                        width: Get.width * 0.18,
                        height: Get.width * 0.18,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/hamrahaval.jpg',
                              ),
                              colorFilter: Get.find<controlleronoff>(
                                              tag: 'secend')
                                          .opretorsim
                                          .value !=
                                      'ha'
                                  ? ColorFilter.mode(
                                      const Color.fromARGB(255, 108, 108, 108),
                                      BlendMode.darken)
                                  : null,
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          color: theme[
                              Get.find<controllerphoneinfo>(tag: 'secend')
                                  .theme
                                  .value]![4],
                          boxShadow: [
                            BoxShadow(
                              color: theme[
                                  Get.find<controllerphoneinfo>(tag: 'secend')
                                      .theme
                                      .value]![5],
                              spreadRadius: 5,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  InkWell(
                    onTap: () => Get.find<controlleronoff>(tag: 'secend')
                        .opretorsim
                        .value = 'rl',
                    child: Obx(() {
                      return Container(
                        width: Get.width * 0.18,
                        height: Get.width * 0.18,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/rightel.jpg'),
                              colorFilter: Get.find<controlleronoff>(
                                              tag: 'secend')
                                          .opretorsim
                                          .value !=
                                      'rl'
                                  ? ColorFilter.mode(
                                      const Color.fromARGB(255, 108, 108, 108),
                                      BlendMode.darken)
                                  : null,
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          color: theme[
                              Get.find<controllerphoneinfo>(tag: 'secend')
                                  .theme
                                  .value]![4],
                          boxShadow: [
                            BoxShadow(
                              color: theme[
                                  Get.find<controllerphoneinfo>(tag: 'secend')
                                      .theme
                                      .value]![5],
                              spreadRadius: 5,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.find<controlleronoff>(tag: 'secend')
                          .logodev
                          .value = 'home',
                      child: Obx(() {
                        return Container(
                          width: Get.width * 0.18,
                          height: Get.width * 0.18,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/home.png'),
                                colorFilter:
                                    Get.find<controlleronoff>(tag: 'secend')
                                                .logodev
                                                .value !=
                                            'home'
                                        ? ColorFilter.mode(
                                            Color.fromARGB(255, 154, 143, 143),
                                            BlendMode.darken)
                                        : null,
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            color: theme[
                                Get.find<controllerphoneinfo>(tag: 'secend')
                                    .theme
                                    .value]![4],
                            boxShadow: [
                              BoxShadow(
                                color: theme[
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                        .theme
                                        .value]![5],
                                spreadRadius: 5,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    Text(
                      'خانه',
                      style: TextStyle(fontFamily: 'A'),
                    )
                  ],
                ),
                //
                //
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.find<controlleronoff>(tag: 'secend')
                          .logodev
                          .value = 'pent',
                      child: Obx(() {
                        return Container(
                          width: Get.width * 0.18,
                          height: Get.width * 0.18,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/pent.png'),
                                colorFilter:
                                    Get.find<controlleronoff>(tag: 'secend')
                                                .logodev
                                                .value !=
                                            'pent'
                                        ? ColorFilter.mode(
                                            Color.fromARGB(255, 154, 143, 143),
                                            BlendMode.darken)
                                        : null,
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            color: theme[
                                Get.find<controllerphoneinfo>(tag: 'secend')
                                    .theme
                                    .value]![4],
                            boxShadow: [
                              BoxShadow(
                                color: theme[
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                        .theme
                                        .value]![5],
                                spreadRadius: 5,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    Text(
                      'ویلا',
                      style: TextStyle(fontFamily: 'A'),
                    )
                  ],
                ),

                ///
                ///
                ///
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.find<controlleronoff>(tag: 'secend')
                          .logodev
                          .value = 'shop',
                      child: Obx(() {
                        return Container(
                          width: Get.width * 0.18,
                          height: Get.width * 0.18,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/shop.png'),
                                colorFilter:
                                    Get.find<controlleronoff>(tag: 'secend')
                                                .logodev
                                                .value !=
                                            'shop'
                                        ? ColorFilter.mode(
                                            Color.fromARGB(255, 154, 143, 143),
                                            BlendMode.darken)
                                        : null,
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            color: theme[
                                Get.find<controllerphoneinfo>(tag: 'secend')
                                    .theme
                                    .value]![4],
                            boxShadow: [
                              BoxShadow(
                                color: theme[
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                        .theme
                                        .value]![5],
                                spreadRadius: 5,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    Text(
                      'فروشگاه',
                      style: TextStyle(fontFamily: 'A'),
                    )
                  ],
                ),

                ///
                ///
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.find<controlleronoff>(tag: 'secend')
                          .logodev
                          .value = 'factory',
                      child: Obx(() {
                        return Container(
                          width: Get.width * 0.18,
                          height: Get.width * 0.18,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/factory.png'),
                                colorFilter:
                                    Get.find<controlleronoff>(tag: 'secend')
                                                .logodev
                                                .value !=
                                            'factory'
                                        ? ColorFilter.mode(
                                            Color.fromARGB(255, 154, 143, 143),
                                            BlendMode.darken)
                                        : null,
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            color: theme[
                                Get.find<controllerphoneinfo>(tag: 'secend')
                                    .theme
                                    .value]![4],
                            boxShadow: [
                              BoxShadow(
                                color: theme[
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                        .theme
                                        .value]![5],
                                spreadRadius: 5,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    Text(
                      'کارخانه',
                      style: TextStyle(fontFamily: 'A'),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Container(

                //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                width: Get.width * 0.30,
                height: Get.width * 0.10,
                decoration: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                      .theme
                      .value]![4],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                          .theme
                          .value]![5],
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () => Get.defaultDialog(
                      title: 'هشدار!',
                      middleText: 'از ساخت دستگاه مطمعن هستید؟',
                      textConfirm: 'بله',
                      onConfirm: () {
                        print('hello');
                        Get.find<controllerphoneinfo>(tag: 'secend').addphone();
                        CherryToast.success(
                          backgroundColor: theme[
                              Get.find<controllerphoneinfo>(tag: 'secend')
                                  .theme
                                  .value]![0],
                          title: Text(
                            'تبریک',
                            style: TextStyle(
                              fontFamily: 'A',
                            ),
                          ),
                          action: Text(
                              " دستگاه با موفقیت ساخته شد و پسورد جدید اعمال شد",
                              style: TextStyle(fontFamily: 'A')),
                          actionHandler: () {
                            print("Action button pressed");
                          },
                        ).show(context);
                        //   Get.snackbar('تبریک', 'دستگاه یا موفقیت ساخته شد!!');
                        /*  final Telephony telephony = Telephony.instance;
                        telephony.sendSms(
                          to: "${Get.find<controllerphoneinfo>(tag: 'secend').textphone.text}",
                          message:
                              '0000 PASS ${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}',
                        ); */
                        sendsms(
                            '0000 PASS ${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}');
                        /* CherryToast.info(
                          backgroundColor: theme[
                              Get.find<controllerphoneinfo>(tag: 'secend')
                                  .theme
                                  .value]![0],
                          title: Text(
                            'توجه',
                            style: TextStyle(
                              fontFamily: 'A',
                            ),
                          ),
                          action: Text("پیامک فرستاده شد و پسورد جدید اعمال شد",
                              style: TextStyle(fontFamily: 'A')),
                          actionHandler: () {
                            print("Action button pressed");
                          },
                        ).show(context); */

                        Get.find<controlleronoff>(tag: 'secend')
                            .open_drawer
                            .value = true;
                        Get.off(HomePage1());
                      }),
                  child: Center(
                      child: Text(
                    'ثبت دستگاه',
                    style: TextStyle(fontFamily: 'A'),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  )),
                )),
          ],
        ),
      ),
    ));
  }
}
