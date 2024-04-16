import 'dart:io';

import 'package:cherry_toast/cherry_toast.dart';
import '/Getxcontroller/controllerphoneinfo.dart';
import '/Pages/AboutUs.dart';
import '/Pages/Contacts.dart';
import '/Pages/Half%20On%20.dart';
import '/Pages/PasswordApp.dart';
import '/Pages/Relleh/Relleh.dart';
import '/Pages/Setting.dart';
import '/Pages/Simcard.dart';
import '/Pages/add%20device.dart';
import '/Pages/password%20device.dart';
import '/color.dart';
import '/testpage/fn_onoff.dart';
import '/testpage/select%20page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:progressive_image/progressive_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Getxcontroller/controllerOnOff.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
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
            2 &&
        Get.find<controllerphoneinfo>(tag: 'secend').selectpage.value ==
            false) {
      Get.off(SelectPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      //  backgroundColor: Colors.black,
      /*  appBar: AppBar(
        title: Text('ermiya'),
      ), */
      key: _scaffoldKey,
      endDrawer: Obx(() {
        return Drawer(
          width: Get.width * 0.65,
          backgroundColor: theme[
              Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![8],
          child: drawer(),
        );
      }),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: () async {
                    if (Get.find<controllerphoneinfo>(tag: 'secend')
                            .theme
                            .value ==
                        'light') {
                      Get.find<controllerphoneinfo>(tag: 'secend').theme.value =
                          'dark';
                      Get.changeThemeMode(ThemeMode.dark);
                      print('dark');
                    } else {
                      Get.find<controllerphoneinfo>(tag: 'secend').theme.value =
                          'light';
                      Get.changeThemeMode(ThemeMode.light);
                      print('light');
                    }
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString(
                        'theme',
                        Get.find<controllerphoneinfo>(tag: 'secend')
                            .theme
                            .value);
                  }, child: Obx(() {
                    return Icon(Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value ==
                            'dark'
                        ? Icons.light_mode
                        : Icons.dark_mode);
                  })),
                  FutureBuilder<bool>(
                      future: loadingimage(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (snapshot.hasData) {
                          return SizedBox(
                              height: Get.height * 0.2,
                              child: Obx(() {
                                return ProgressiveImage(
                                  placeholder: AssetImage(
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                                .theme
                                                .value ==
                                            'dark'
                                        ? 'assets/logo.png'
                                        : 'assets/logo-dark.png',
                                  ),
                                  thumbnail: AssetImage(
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                                .theme
                                                .value ==
                                            'dark'
                                        ? 'assets/logo.png'
                                        : 'assets/logo-dark.png',
                                  ),
                                  image: AssetImage(
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                                .theme
                                                .value ==
                                            'dark'
                                        ? 'assets/logo.png'
                                        : 'assets/logo-dark.png',
                                  ),
                                  height: Get.height * 0.2,
                                  width: Get.height * 0.2,
                                );
                              }));
                        } else {
                          return SizedBox(
                            height: Get.height * 0.2,
                            child: const Center(
                              child: Text(
                                'Ermiya Electronic',
                                style: TextStyle(
                                    fontFamily: 'A',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                          );
                        }
                      }),
                  InkWell(
                      onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
                      child: Obx(() {
                        return SvgPicture.asset(
                          'assets/setting.svg',
                          color: theme[
                              Get.find<controllerphoneinfo>(tag: 'secend')
                                  .theme
                                  .value]![3],
                        );
                      }))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    offdev();
                    CherryToast.info(
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
                      action: Text("پیامک ارسال شد",
                          style: TextStyle(fontFamily: 'A')),
                      actionHandler: () {
                        print("Action button pressed");
                      },
                    ).show(context);
                  },
                  child: Obx(() {
                    return Container(
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
                        color: theme[
                            Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![8],
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
                    );
                  }),
                ),

                ///
                ///
                InkWell(
                  onTap: () {
                    ondev();
                    CherryToast.info(
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
                      action: Text("پیامک ارسال شد",
                          style: TextStyle(fontFamily: 'A')),
                      actionHandler: () {
                        print("Action button pressed");
                      },
                    ).show(context);
                  },
                  child: Obx(() {
                    return Container(
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
                        color: theme[
                            Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![8],
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
                    );
                  }),
                ),

                ///
                ///
                InkWell(
                  onTap: () => Get.to(HalfOn()),
                  child: Obx(() {
                    return Container(
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
                        color: theme[
                            Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![8],
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
                              child: badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                            badgeColor: Get.find<controllerphoneinfo>(
                                            tag: 'secend')
                                        .OnPhones
                                        .value ==
                                    'halfon'
                                ? theme[
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                        .theme
                                        .value]![3]
                                : theme[
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                        .theme
                                        .value]![0]),
                        position: badges.BadgePosition.center(),
                        badgeContent: Text('P'),
                        child: SvgPicture.asset(
                          // 'assets/check.svg',
                          'assets/lock.svg',
                          color: Get.find<controllerphoneinfo>(tag: 'secend')
                                      .OnPhones
                                      .value ==
                                  'halfon'
                              ? theme[
                                  Get.find<controllerphoneinfo>(tag: 'secend')
                                      .theme
                                      .value]![3]
                              : null,
                        ),
                      ))),
                    );
                  }),
                ),
              ],
            ),
            Column(
              children: [
                Obx(() {
                  return Text(
                    Get.find<controllerphoneinfo>(tag: 'secend')
                                .OnPhones
                                .value ==
                            'on'
                        ? 'فعال'
                        : Get.find<controllerphoneinfo>(tag: 'secend')
                                    .OnPhones
                                    .value ==
                                'off'
                            ? 'غیر فعال'
                            : 'نیمه فعال',
                    style: TextStyle(
                      fontFamily: 'A',
                      fontSize: 30,
                    ),
                  );
                }),
                Obx(() {
                  return SvgPicture.asset(
                    'assets/${Get.find<controllerphoneinfo>(tag: 'secend').OnPhones.value == 'on' ? 'lock' : Get.find<controllerphoneinfo>(tag: 'secend').OnPhones.value == 'off' ? 'lock-open' : 'check'}.svg',
                    height: Get.height * 0.3,
                    color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                        .theme
                        .value]![3],
                  );
                }),
                Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(-0.02),
                  child: Obx(() {
                    return Container(
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
                            color: theme[
                                Get.find<controllerphoneinfo>(tag: 'secend')
                                    .theme
                                    .value]![3],
                            blurRadius: 20,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    );
                  }),
                )
              ],
            ),
          ])),
    );
  }
}

Future<bool> loadingimage() async {
  await Future.delayed(Duration(seconds: 2), () {
    return true;
  });
  return true;
}

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
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
                                  margin: EdgeInsets.only(bottom: 10, top: 10),
                                  height: 48,
                                  decoration: ShapeDecoration(
                                    color: theme[Get.find<controllerphoneinfo>(
                                            tag: 'secend')
                                        .theme
                                        .value]![4],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
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
                    replacement: SizedBox(
                      height: 50,
                      child: Image.asset(Get.find<controllerphoneinfo>(
                                          tag: 'secend')
                                      .Anten
                                      .value ==
                                  '' ||
                              Get.find<controllerphoneinfo>(tag: 'secend')
                                      .Anten
                                      .value ==
                                  ' '
                          ? 'assets/home.png'
                          : 'assets/${Get.find<controllerphoneinfo>(tag: 'secend').Anten.value}.png'),
                    ),
                    child: badges.Badge(
                      child: SizedBox(
                        height: 50,
                        child: Image.asset(Get.find<controllerphoneinfo>(
                                            tag: 'secend')
                                        .Anten
                                        .value ==
                                    '' ||
                                Get.find<controllerphoneinfo>(tag: 'secend')
                                        .Anten
                                        .value ==
                                    ' '
                            ? 'assets/home.png'
                            : 'assets/${Get.find<controllerphoneinfo>(tag: 'secend').Anten.value}.png'),
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
          Column(
            children: List.generate(
              pages.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () => Get.to(pages[index]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        namepages[index],
                        style: TextStyle(
                          fontFamily: 'A',
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SvgPicture.asset(
                        namesvg[index],
                        height: index == 1 ? 27 : 27,
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> pages = [
  AddDevice(),
  Contacts(),
  Relleh(),
  simcard(),
  PasswordApp(),
  PasswordDevice(),
  Setting(),
  AboutUs(),
];
List<String> namepages = [
  'افزودن دستگاه',
  'مخاطبین(مدیران)',
  'خروجی',
  'سیمکارت',
  'پسورد نرم افزار',
  'پسورد دستگاه',
  'تنظیمات',
  'درباره ما'
];
List<String> namesvg = [
  'assets/add.svg',
  'assets/profile-circle.svg',
  'assets/electricity.svg',
  'assets/simcard.svg',
  'assets/pass-dev.svg',
  'assets/pass-dev.svg',
  'assets/setting-2.svg',
  'assets/info-circle.svg'
];
