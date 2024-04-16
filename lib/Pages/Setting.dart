import 'package:cherry_toast/cherry_toast.dart';
import 'package:test_speech_to_text/send%20sms.dart';
import '/Getxcontroller/controllerphoneinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
//import 'package:telephony/telephony.dart';

import '../color.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تنظیمات',
                style: TextStyle(fontFamily: 'A'),
              ),
              SizedBox(
                width: 30,
              ),
              SvgPicture.asset('assets/setting-2.svg')
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            'گزارش پیام کوتاه',
            style: TextStyle(fontFamily: 'A'),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Container(
              width: Get.width * 0.9,
              height: Get.height * 0.07,
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
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(onTap: () {
                      /*  final Telephony telephony = Telephony.instance;
                      telephony.sendSms(
                        to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                        message:
                            '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} REPORTOFF',
                      ); */
                      sendsms(
                          '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} REPORTOFF');
                      Get.find<controllerphoneinfo>(tag: 'secend')
                          .CallOnElectricity
                          .value = 'off';
                      Get.find<controllerphoneinfo>(tag: 'secend')
                          .updatephone('CallOnElectricity', 'off');

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
                    }, child: Obx(() {
                      return Container(
                        width: Get.width * 0.4,
                        height: Get.height * 0.06,
                        decoration: ShapeDecoration(
                          color: Get.find<controllerphoneinfo>(tag: 'secend')
                                      .CallOnElectricity
                                      .value ==
                                  'off'
                              ? theme[
                                  Get.find<controllerphoneinfo>(tag: 'secend')
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
                                color:
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                                .CallOnElectricity
                                                .value ==
                                            'off'
                                        ? theme[Get.find<controllerphoneinfo>(
                                                tag: 'secend')
                                            .theme
                                            .value]![4]
                                        : null,
                                /* // color: theme[
                                Get.find<controllerphoneinfo>(tag: 'secend')
                                    .theme
                                    .value]![4], */
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
                            '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} REPORTON',
                      ); */
                      sendsms(
                          '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} REPORTON');
                      Get.find<controllerphoneinfo>(tag: 'secend')
                          .CallOnElectricity
                          .value = 'on';
                      Get.find<controllerphoneinfo>(tag: 'secend')
                          .updatephone('CallOnElectricity', 'on');

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
                    }, child: Obx(() {
                      return Container(
                        width: Get.width * 0.44,
                        height: Get.height * 0.06,
                        decoration: ShapeDecoration(
                          color: Get.find<controllerphoneinfo>(tag: 'secend')
                                      .CallOnElectricity
                                      .value ==
                                  'on'
                              ? theme[
                                  Get.find<controllerphoneinfo>(tag: 'secend')
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
                                color:
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                                .CallOnElectricity
                                                .value ==
                                            'on'
                                        ? theme[Get.find<controllerphoneinfo>(
                                                tag: 'secend')
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
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () {
                /*  final Telephony telephony = Telephony.instance;
                telephony.sendSms(
                  to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                  message:
                      '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} VERSION',
                ); */
                sendsms(
                    '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} VERSION');
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
              child: Container(
                width: Get.width * 0.9,
                height: Get.height * 0.06,
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
                    )
                  ],
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'اطلاعات دستگاه',
                      style: TextStyle(fontFamily: 'A'),
                    ),
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
