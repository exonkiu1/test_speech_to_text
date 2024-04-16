import 'package:cherry_toast/cherry_toast.dart';
import 'package:test_speech_to_text/send%20sms.dart';
import '/Getxcontroller/controllerphoneinfo.dart';
import 'package:get/get.dart';
//import 'package:telephony/telephony.dart';
import 'package:flutter/material.dart';

ondev() {
  Get.find<controllerphoneinfo>(tag: 'secend').OnPhones.value = 'on';
  /* final Telephony telephony = Telephony.instance;
  telephony.sendSms(
    to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
    message:
        '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} ON',
  ); */
  sendsms('${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} ON');
  Get.find<controllerphoneinfo>(tag: 'secend').updatephone('OnPhones', 'on');

  /*  CherryToast.info(
    title: Text(
      'توجه',
      style: TextStyle(fontFamily: 'A'),
    ),
    action: Text("پیامک ارسال شد", style: TextStyle(color: Colors.black)),
    actionHandler: () {
      print("Action button pressed");
    },
  ).show(context); */
  // Get.snackbar('اطلاعیه', 'پیامک فرستاده شد');
}

offdev() {
  Get.find<controllerphoneinfo>(tag: 'secend').OnPhones.value = 'off';
  /*  final Telephony telephony = Telephony.instance;
  telephony.sendSms(
    to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
    message:
        '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OFF',
  ); */
  sendsms('${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} OFF');
  Get.find<controllerphoneinfo>(tag: 'secend').updatephone('OnPhones', 'off');

//  Get.snackbar('اطلاعیه', 'پیامک فرستاده شد');
}
