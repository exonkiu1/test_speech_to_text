import 'package:cherry_toast/cherry_toast.dart';
import 'package:test_speech_to_text/send%20sms.dart';
import '/Getxcontroller/controllerphoneinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//import 'package:telephony/telephony.dart';

import '../../color.dart';

class Relleh extends StatelessWidget {
  const Relleh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'رله',
                  style: TextStyle(fontFamily: 'A'),
                ),
                SizedBox(
                  width: 30,
                ),
                SvgPicture.asset('assets/electricity.svg')
              ],
            ),
            SizedBox(
              height: 60,
            ),

            Center(
              child: Container(
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
                      onTap: () {
                        /*  final Telephony telephony = Telephony.instance;
                        telephony.sendSms(
                          to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                          message:
                              '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT1',
                        ); */
                        sendsms(
                            '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT1');
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
                                        .value]![1]),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          'درب بازکن',
                          style: TextStyle(fontFamily: 'A'),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Obx(() {
                        return Text(
                          '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[0]}',
                          style: TextStyle(fontFamily: 'A'),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            // Center(child: Releh1()),
            SizedBox(
              height: 20,
            ),
            Obx(() {
              return Text(
                '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[2]}',
                style: TextStyle(fontFamily: 'A'),
              );
            }),
            Center(child: Relleh2()),
            SizedBox(
              height: 20,
            ),
            Obx(() {
              return Text(
                '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[4]}',
                style: TextStyle(fontFamily: 'A'),
              );
            }),
            Center(child: Relleh3()),
            SizedBox(
              height: 20,
            ),
            Text(
              'تغییر نام خروجی ها',
              style: TextStyle(fontFamily: 'A'),
            ),
            change_nr()
          ],
        ),
      ),
    );
  }
}

class change_nr extends StatelessWidget {
  const change_nr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
              color: theme[
                  Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![5],
              blurRadius: 8,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => change_nr1(),
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
                                .value]![1]),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  'خروجی 1',
                  style: TextStyle(fontFamily: 'A'),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                )),
              ),
            ),
            InkWell(
              onTap: () => change_nr2(),
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
                                .value]![1]),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  'خروجی 2',
                  style: TextStyle(fontFamily: 'A'),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                )),
              ),
            ),
            InkWell(
              onTap: () => change_nr3(),
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
                                .value]![1]),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  'خروجی 3',
                  style: TextStyle(fontFamily: 'A'),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

change_nr2() {
  TextEditingController tf_name = TextEditingController();
  Get.defaultDialog(
      title: 'نام جدید را وارد کنید',
      textConfirm: 'اعمال',
      onConfirm: () {
        Get.find<controllerphoneinfo>(tag: 'secend').Relehs[2] = tf_name.text;
        String copyrelleh =
            '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[0]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[1]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh1} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[2]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[3]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh2} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[4]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[5]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh3}';
        Get.find<controllerphoneinfo>(tag: 'secend')
            .updatephone('Relleh', copyrelleh);
        Get.back();
        Get.snackbar('توجه', 'تغییر نام خروجی 2 با موفقیت اعمال شد');
      },
      content: SizedBox(
          width: Get.width * 0.5,
          child: TextField(
            autofocus: true,
            controller: tf_name,
            decoration: InputDecoration(
                hintText: 'اینجا وارد کنید',
                hintStyle: TextStyle(fontFamily: 'A')),
          )));
}

change_nr3() {
  TextEditingController tf_name = TextEditingController();
  Get.defaultDialog(
      title: 'نام جدید را وارد کنید',
      textConfirm: 'اعمال',
      onConfirm: () {
        Get.find<controllerphoneinfo>(tag: 'secend').Relehs[4] = tf_name.text;
        String copyrelleh =
            '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[0]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[1]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh1} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[2]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[3]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh2} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[4]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[5]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh3}';
        Get.find<controllerphoneinfo>(tag: 'secend')
            .updatephone('Relleh', copyrelleh);
        Get.back();
        Get.snackbar('توجه', 'تغییر نام خروجی 3 با موفقیت اعمال شد');
      },
      content: SizedBox(
          width: Get.width * 0.5,
          child: TextField(
            autofocus: true,
            controller: tf_name,
            decoration: InputDecoration(
                hintText: 'اینجا وارد کنید',
                hintStyle: TextStyle(fontFamily: 'A')),
          )));
}

change_nr1() {
  TextEditingController tf_name = TextEditingController();
  Get.defaultDialog(
      title: 'نام جدید را وارد کنید',
      textConfirm: 'اعمال',
      onConfirm: () {
        Get.find<controllerphoneinfo>(tag: 'secend').Relehs[0] = tf_name.text;
        String copyrelleh =
            '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[0]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[1]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh1} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[2]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[3]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh2} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[4]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[5]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh3}';
        Get.find<controllerphoneinfo>(tag: 'secend')
            .updatephone('Relleh', copyrelleh);
        Get.back();

        Get.snackbar('توجه', 'تغییر نام خروجی 1 با موفقیت اعمال شد');
      },
      content: SizedBox(
          width: Get.width * 0.5,
          child: TextField(
            autofocus: true,
            controller: tf_name,
            decoration: InputDecoration(
                hintText: 'اینجا وارد کنید',
                hintStyle: TextStyle(fontFamily: 'A')),
          )));
}

class Relleh3 extends StatelessWidget {
  const Relleh3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.07,
      decoration: ShapeDecoration(
        color:
            theme[Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![4],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: theme[
                Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![5],
            blurRadius: 8,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              /*  final Telephony telephony = Telephony.instance;
              telephony.sendSms(
                to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                message:
                    '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT3OFF',
              ); */
              sendsms(
                  '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT3OFF');
              Get.find<controllerphoneinfo>(tag: 'secend').Relleh3.value =
                  'off';
              String copyrelleh =
                  '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[0]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[1]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh1} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[2]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[3]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh2} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[4]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[5]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh3}';
              Get.find<controllerphoneinfo>(tag: 'secend')
                  .updatephone('Relleh', copyrelleh);
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
                action:
                    Text("پیامک ارسال شد", style: TextStyle(fontFamily: 'A')),
                actionHandler: () {
                  print("Action button pressed");
                },
              ).show(context);
            },
            child: Obx(() {
              return Container(
                width: Get.width * 0.4,
                height: Get.height * 0.06,
                decoration: ShapeDecoration(
                  color: Get.find<controllerphoneinfo>(tag: 'secend')
                              .Relleh3
                              .value ==
                          'off'
                      ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                          .theme
                          .value]![2]
                      : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    'غیر فعال',
                    style: TextStyle(
                        fontFamily: 'A',
                        color: Get.find<controllerphoneinfo>(tag: 'secend')
                                    .Relleh3
                                    .value ==
                                'off'
                            ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![4]
                            : null,
                        fontSize: 17),
                  ),
                ),
              );
            }),
          ),
          InkWell(
            onTap: () {
              /*  final Telephony telephony = Telephony.instance;
              telephony.sendSms(
                to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                message:
                    '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT3ON',
              ); */
              sendsms(
                  '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT3ON');
              Get.find<controllerphoneinfo>(tag: 'secend').Relleh3.value = 'on';
              String copyrelleh =
                  '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[0]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[1]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh1} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[2]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[3]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh2} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[4]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[5]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh3}';
              Get.find<controllerphoneinfo>(tag: 'secend')
                  .updatephone('Relleh', copyrelleh);
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
                action:
                    Text("پیامک ارسال شد", style: TextStyle(fontFamily: 'A')),
                actionHandler: () {
                  print("Action button pressed");
                },
              ).show(context);
            },
            child: Obx(() {
              return Container(
                width: Get.width * 0.44,
                height: Get.height * 0.06,
                decoration: ShapeDecoration(
                  color: Get.find<controllerphoneinfo>(tag: 'secend')
                              .Relleh3
                              .value ==
                          'on'
                      ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                          .theme
                          .value]![2]
                      : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    'فعال',
                    style: TextStyle(
                        fontFamily: 'A',
                        color: Get.find<controllerphoneinfo>(tag: 'secend')
                                    .Relleh3
                                    .value ==
                                'on'
                            ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![4]
                            : null,
                        fontSize: 17),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class Relleh2 extends StatelessWidget {
  const Relleh2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.07,
      decoration: ShapeDecoration(
        color:
            theme[Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![4],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: theme[
                Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![5],
            blurRadius: 8,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              /* final Telephony telephony = Telephony.instance;
              telephony.sendSms(
                to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                message:
                    '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT2OFF',
              ); */
              sendsms(
                  '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT2OFF');
              Get.find<controllerphoneinfo>(tag: 'secend').Relleh2.value =
                  'off';
              String copyrelleh =
                  '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[0]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[1]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh1} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[2]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[3]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh2} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[4]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[5]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh3}';
              Get.find<controllerphoneinfo>(tag: 'secend')
                  .updatephone('Relleh', copyrelleh);
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
                action:
                    Text("پیامک ارسال شد", style: TextStyle(fontFamily: 'A')),
                actionHandler: () {
                  print("Action button pressed");
                },
              ).show(context);
            },
            child: Obx(() {
              return Container(
                width: Get.width * 0.4,
                height: Get.height * 0.06,
                decoration: ShapeDecoration(
                  color: Get.find<controllerphoneinfo>(tag: 'secend')
                              .Relleh2
                              .value ==
                          'off'
                      ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                          .theme
                          .value]![2]
                      : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    'غیر فعال',
                    style: TextStyle(
                        fontFamily: 'A',
                        color: Get.find<controllerphoneinfo>(tag: 'secend')
                                    .Relleh2
                                    .value ==
                                'off'
                            ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![4]
                            : null,
                        fontSize: 17),
                  ),
                ),
              );
            }),
          ),
          InkWell(
            onTap: () {
              /*  final Telephony telephony = Telephony.instance;
              telephony.sendSms(
                to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                message:
                    '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT1ON',
              ); */
              sendsms(
                  '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT1ON');
              Get.find<controllerphoneinfo>(tag: 'secend').Relleh2.value = 'on';
              String copyrelleh =
                  '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[0]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[1]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh1} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[2]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[3]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh2} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[4]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[5]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh3}';
              Get.find<controllerphoneinfo>(tag: 'secend')
                  .updatephone('Relleh', copyrelleh);
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
                action:
                    Text("پیامک ارسال شد", style: TextStyle(fontFamily: 'A')),
                actionHandler: () {
                  print("Action button pressed");
                },
              ).show(context);
            },
            child: Obx(() {
              return Container(
                width: Get.width * 0.44,
                height: Get.height * 0.06,
                decoration: ShapeDecoration(
                  color: Get.find<controllerphoneinfo>(tag: 'secend')
                              .Relleh2
                              .value ==
                          'on'
                      ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                          .theme
                          .value]![2]
                      : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    'فعال',
                    style: TextStyle(
                        fontFamily: 'A',
                        color: Get.find<controllerphoneinfo>(tag: 'secend')
                                    .Relleh2
                                    .value ==
                                'on'
                            ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![4]
                            : null,
                        fontSize: 17),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class Releh1 extends StatelessWidget {
  const Releh1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.07,
      decoration: ShapeDecoration(
        color:
            theme[Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![4],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: theme[
                Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![5],
            blurRadius: 8,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(onTap: () {
            /*  final Telephony telephony = Telephony.instance;
            telephony.sendSms(
              to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
              message:
                  '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT1OFF',
            ); */
            sendsms(
                '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT1OFF');
            Get.find<controllerphoneinfo>(tag: 'secend').Relleh1.value = 'off';
            String copyrelleh =
                '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[0]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[1]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh1} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[2]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[3]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh2} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[4]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[5]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh3}';
            Get.find<controllerphoneinfo>(tag: 'secend')
                .updatephone('Relleh', copyrelleh);
            CherryToast.info(
              backgroundColor: theme[
                  Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![0],
              title: Text(
                'توجه',
                style: TextStyle(
                  fontFamily: 'A',
                ),
              ),
              action: Text("پیامک ارسال شد", style: TextStyle(fontFamily: 'A')),
              actionHandler: () {
                print("Action button pressed");
              },
            ).show(context);
          }, child: Obx(() {
            return Container(
              width: Get.width * 0.4,
              height: Get.height * 0.06,
              decoration: ShapeDecoration(
                color: Get.find<controllerphoneinfo>(tag: 'secend')
                            .Relleh1
                            .value ==
                        'off'
                    ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                        .theme
                        .value]![2]
                    : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Center(
                child: Text(
                  'غیر فعال',
                  style: TextStyle(
                      fontFamily: 'A',
                      color: Get.find<controllerphoneinfo>(tag: 'secend')
                                  .Relleh1
                                  .value ==
                              'off'
                          ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                              .theme
                              .value]![4]
                          : null,
                      //
                      fontSize: 17),
                ),
              ),
            );
          })),
          InkWell(onTap: () {
            /*  final Telephony telephony = Telephony.instance;
            telephony.sendSms(
              to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
              message:
                  '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT1ON',
            ); */
            sendsms(
                '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OUT1ON');
            Get.find<controllerphoneinfo>(tag: 'secend').Relleh1.value = 'on';
            String copyrelleh =
                '${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[0]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[1]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh1} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[2]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[3]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh2} ${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[4]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relehs[5]}+${Get.find<controllerphoneinfo>(tag: 'secend').Relleh3}';
            Get.find<controllerphoneinfo>(tag: 'secend')
                .updatephone('Relleh', copyrelleh);
            Get.find<controllerphoneinfo>(tag: 'secend').startfifteensecends();
            CherryToast.info(
              backgroundColor: theme[
                  Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![0],
              title: Text(
                'توجه',
                style: TextStyle(
                  fontFamily: 'A',
                ),
              ),
              action: Text("پیامک ارسال شد", style: TextStyle(fontFamily: 'A')),
              actionHandler: () {
                print("Action button pressed");
              },
            ).show(context);
          }, child: Obx(() {
            return Container(
              width: Get.width * 0.44,
              height: Get.height * 0.06,
              decoration: ShapeDecoration(
                color: Get.find<controllerphoneinfo>(tag: 'secend')
                            .Relleh1
                            .value ==
                        'on'
                    ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                        .theme
                        .value]![2]
                    : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Center(
                child: Text(
                  'فعال',
                  style: TextStyle(
                      fontFamily: 'A',
                      color: Get.find<controllerphoneinfo>(tag: 'secend')
                                  .Relleh1
                                  .value ==
                              'on'
                          ? theme[Get.find<controllerphoneinfo>(tag: 'secend')
                              .theme
                              .value]![4]
                          : null,
                      fontSize: 17),
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
