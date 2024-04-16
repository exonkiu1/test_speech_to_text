import 'package:test_speech_to_text/send%20sms.dart';

import '/Getxcontroller/controllerOnOff.dart';
import '/Getxcontroller/controllerphoneinfo.dart';
import '/Pages/Contacts.dart';
import '/Pages/Half%20On%20.dart';
import '/Pages/PasswordApp.dart';
import '/Pages/Relleh/Relleh.dart';
import '/Pages/Setting.dart';
import '/Pages/Simcard.dart';
import '/Pages/add%20device.dart';
import '/Pages/password%20device.dart';
import '/testpage/select%20page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer_enhanced/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//import 'package:telephony/telephony.dart';
import 'package:badges/badges.dart' as badges;

import '../../color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    ifgotoadddevice();
    // TODO: implement initState
    super.initState();
  }

  ifgotoadddevice() async {
    await Future.delayed(Duration(seconds: 1));
    if (Get.find<controllerphoneinfo>(tag: 'secend').lenghtmainpage.value ==
        0) {
      Get.off(AddDevice());
    } else if (Get.find<controllerphoneinfo>(tag: 'secend')
            .lenghtmainpage
            .value >=
        2) {
      Get.off(SelectPage());
    }
  }

  final GlobalKey<SliderDrawerState> sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: SliderDrawer(
        key: sliderDrawerKey,
        sliderOpenSize: 256,
        appBar: null,
        slideDirection: SlideDirection.RIGHT_TO_LEFT,
        slider: Container(
          // width: Get.width * 0.8,
          color: Color.fromARGB(255, 34, 34, 34),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () => Get.bottomSheet(Container(
                width: Get.width,
                // height: Get.height * 0.4,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                          'شما در حال حاظر ${Get.find<controllerphoneinfo>(tag: 'secend').lenghtmainpage.value}دستگاه دارید'),
                      Text(
                        'میتوانید از بین دستکاه ها یکی را انتخاب کنید',
                        style: TextStyle(
                            fontFamily: 'A', fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: List.generate(
                            Get.find<controllerphoneinfo>(tag: 'secend')
                                .lenghtmainpage
                                .value,
                            (index) => InkWell(
                                  onTap: () {
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                        .changepage(index);
                                    Get.find<controlleronoff>(tag: 'secend')
                                        .open_drawer
                                        .value = false;
                                    Get.back();
                                  },
                                  child: Container(
                                    width: Get.width * 0.7,
                                    margin:
                                        EdgeInsets.only(bottom: 10, top: 10),
                                    height: 48,
                                    decoration: ShapeDecoration(
                                      color: theme[
                                          Get.find<controllerphoneinfo>(
                                                  tag: 'secend')
                                              .theme
                                              .value]![4],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      shadows: [
                                        BoxShadow(
                                          color: theme[
                                              Get.find<controllerphoneinfo>(
                                                      tag: 'secend')
                                                  .theme
                                                  .value]![5],
                                          blurRadius: 8,
                                          offset: Offset(0, 0),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          Get.find<controllerphoneinfo>(
                                                  tag: 'secend')
                                              .phoness[index]
                                              .Name,
                                          style: TextStyle(fontFamily: 'A'),
                                        ),
                                        Text(
                                            Get.find<controllerphoneinfo>(
                                                    tag: 'secend')
                                                .phoness[index]
                                                .phone,
                                            style: TextStyle(fontFamily: 'A')),
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                    ],
                  ),
                ),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() {
                    return Text(
                      Get.find<controllerphoneinfo>(tag: 'secend').Name.value ==
                              ''
                          ? 'بدون دستگاه'
                          : Get.find<controllerphoneinfo>(tag: 'secend')
                              .Name
                              .value,
                      style: TextStyle(fontSize: 18, fontFamily: 'A'),
                    );
                  }),
                  SizedBox(
                    width: 30,
                  ),
                  Obx(() {
                    return Visibility(
                      visible: Get.find<controllerphoneinfo>(tag: 'secend')
                                  .lenghtmainpage
                                  .value >
                              1
                          ? true
                          : false,
                      replacement: SvgPicture.asset(
                        'assets/profile-circle.svg',
                        //  semanticsLabel: 'tttttt',
                        // package: 'r',
                      ),
                      child: badges.Badge(
                        child: SvgPicture.asset(
                          'assets/profile-circle.svg',
                          //  semanticsLabel: 'tttttt',
                          // package: 'r',
                        ),
                        badgeContent: Text(
                            '${Get.find<controllerphoneinfo>(tag: 'secend').lenghtmainpage.value}'),
                      ),
                    );
                  }),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () => Get.to(AddDevice()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'افزدون دستکاه',
                    style: TextStyle(fontFamily: 'A'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset('assets/add.svg'),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Get.to(Contacts()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'مخاطبین(مدیران)',
                    style: TextStyle(fontFamily: 'A'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset('assets/profile-circle.svg', height: 23),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Get.to(Relleh()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'رله',
                    style: TextStyle(fontFamily: 'A'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset('assets/electricity.svg'),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Get.to(simcard()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'سیمکارت',
                    style: TextStyle(fontFamily: 'A'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset('assets/simcard.svg'),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Get.to(PasswordApp()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'پسورد نرم افزار',
                    style: TextStyle(fontFamily: 'A'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset('assets/pass-dev.svg'),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Get.to(PasswordDevice()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'پسورد دستگاه',
                    style: TextStyle(fontFamily: 'A'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset('assets/pass-dev.svg'),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Get.to(Setting()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'تنظیمات',
                    style: TextStyle(fontFamily: 'A'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset('assets/setting-2.svg'),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
          ]),
        ),
        child: Body(scaffoldKey: sliderDrawerKey),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key, required this.scaffoldKey});
  final GlobalKey<SliderDrawerState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Color.fromARGB(255, 34, 34, 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: Get.width * 0.25,
                    child: Image.asset(
                      'assets/logo.png',
                      // semanticLabel: 'eeeeeeee',
                      // excludeFromSemantics: true,
                    )),
                InkWell(
                  onTap: () {
                    if (Get.find<controlleronoff>(tag: 'secend')
                        .open_drawer
                        .value) {
                      scaffoldKey.currentState!.openSlider();
                      Get.find<controlleronoff>(tag: 'secend')
                          .open_drawer
                          .value = false;
                    } else {
                      scaffoldKey.currentState!.closeSlider();
                      Get.find<controlleronoff>(tag: 'secend')
                          .open_drawer
                          .value = true;
                    }
                  },
                  child: Obx(() {
                    return Visibility(
                      visible: Get.find<controlleronoff>(tag: 'secend')
                          .open_drawer
                          .value,
                      child: SvgPicture.asset(
                        'assets/setting.svg',
                      ),
                      replacement: SvgPicture.asset(
                        'assets/setting.svg',
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.1,
          ),
          Container(
            width: Get.width * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return InkWell(
                    onTap: () {
                      Get.find<controllerphoneinfo>(tag: 'secend')
                          .OnPhones
                          .value = 'on';
                      /*  final Telephony telephony = Telephony.instance;
                      telephony.sendSms(
                        to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                        message:
                            '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} ON',
                      ); */
                      sendsms(
                          '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} ON');
                      Get.find<controllerphoneinfo>(tag: 'secend')
                          .updatephone('OnPhones', 'on');

                      Get.snackbar('اطلاعیه', 'پیامک فرستاده شد');
                    },
                    child: Container(
                      width: Get.find<controllerphoneinfo>(tag: 'secend')
                                  .OnPhones
                                  .value ==
                              'on'
                          ? Get.width * 0.27
                          : Get.width * 0.15,
                      height: Get.find<controllerphoneinfo>(tag: 'secend')
                                  .OnPhones
                                  .value ==
                              'on'
                          ? Get.width * 0.27
                          : Get.width * 0.15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
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
                      child: FittedBox(
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/lock.svg',
                            color: Get.find<controllerphoneinfo>(tag: 'secend')
                                        .OnPhones
                                        .value ==
                                    'on'
                                ? theme[
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                        .theme
                                        .value]![3]
                                : null,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                Obx(() {
                  return InkWell(
                    onTap: () {
                      Get.find<controllerphoneinfo>(tag: 'secend')
                          .OnPhones
                          .value = 'off';
                      /*  final Telephony telephony = Telephony.instance;
                      telephony.sendSms(
                        to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                        message:
                            '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OFF',
                      ); */
                      sendsms(
                          '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OFF');
                      Get.find<controllerphoneinfo>(tag: 'secend')
                          .updatephone('OnPhones', 'off');

                      Get.snackbar('اطلاعیه', 'پیامک فرستاده شد');
                    },
                    child: Container(
                      width: Get.find<controllerphoneinfo>(tag: 'secend')
                                  .OnPhones
                                  .value ==
                              'off'
                          ? Get.width * 0.27
                          : Get.width * 0.15,
                      height: Get.find<controllerphoneinfo>(tag: 'secend')
                                  .OnPhones
                                  .value ==
                              'off'
                          ? Get.width * 0.27
                          : Get.width * 0.15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
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
                      child: FittedBox(
                          child: Center(
                              child: SvgPicture.asset(
                        'assets/lock-open.svg',
                        color: Get.find<controllerphoneinfo>(tag: 'secend')
                                    .OnPhones
                                    .value ==
                                'off'
                            ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![3]
                            : null,
                      ))),
                    ),
                  );
                }),
                Obx(() {
                  return InkWell(
                    onTap: () {
                      Get.to(HalfOn());
                      /*   Get.find<controllerphoneinfo>(tag: 'secend')
                          .OnPhones
                          .value = 'halfon';
                      final Telephony telephony = Telephony.instance;
                      telephony.sendSms(
                        to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                        message:
                            '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} PARTSET',
                      );
                      Get.find<controllerphoneinfo>(tag: 'secend')
                          .updatePhone();

                      Get.snackbar('اطلاعیه', 'پیامک فرستاده شد'); */
                    },
                    child: Container(
                      width: Get.find<controllerphoneinfo>(tag: 'secend')
                                  .OnPhones
                                  .value ==
                              'halfon'
                          ? Get.width * 0.27
                          : Get.width * 0.15,
                      height: Get.find<controllerphoneinfo>(tag: 'secend')
                                  .OnPhones
                                  .value ==
                              'halfon'
                          ? Get.width * 0.27
                          : Get.width * 0.15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
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
                      child: FittedBox(
                          child: Center(
                              child: SvgPicture.asset(
                        'assets/check.svg',
                        color: Get.find<controllerphoneinfo>(tag: 'secend')
                                    .OnPhones
                                    .value ==
                                'halfon'
                            ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![3]
                            : null,
                      ))),
                    ),
                  );
                }),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.15,
          ),
          Obx(() {
            return Text(
              Get.find<controllerphoneinfo>(tag: 'secend').OnPhones.value ==
                      'on'
                  ? 'فعال'
                  : Get.find<controllerphoneinfo>(tag: 'secend')
                              .OnPhones
                              .value ==
                          'off'
                      ? 'غیر فعال'
                      : 'نیمه فعال',
              style: TextStyle(fontFamily: 'A', fontSize: 30),
            );
          }),
          Obx(() {
            return SvgPicture.asset(
              'assets/${Get.find<controllerphoneinfo>(tag: 'secend').OnPhones.value == 'on' ? 'lock' : Get.find<controllerphoneinfo>(tag: 'secend').OnPhones.value == 'off' ? 'lock-open' : 'check'}.svg',
              height: Get.height * 0.3,
              color: theme[
                  Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![3],
            );
          }),
          Transform(
            transform: Matrix4.identity()
              ..translate(0.0, 0.0)
              ..rotateZ(-0.02),
            child: Container(
              /*  width: 100.36,
              height: 36.61, */
              width: 283.36,
              height: 36.61,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(width: 3, color: Color(0x0C2C2C2C)),
                ),
                shadows: [
                  BoxShadow(
                    color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                        .theme
                        .value]![3],
                    blurRadius: 20,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
