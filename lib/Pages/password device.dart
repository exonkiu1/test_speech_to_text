import 'package:cherry_toast/cherry_toast.dart';
import 'package:test_speech_to_text/send%20sms.dart';
import '/Getxcontroller/controllerphoneinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
//import 'package:telephony/telephony.dart';

import '../color.dart';

class PasswordDevice extends StatelessWidget {
  const PasswordDevice({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pass1 = TextEditingController(),
        pass2 = TextEditingController(),
        pass3 = TextEditingController();
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'پسورد دستگاه',
                style: TextStyle(fontFamily: 'A'),
              ),
              SizedBox(
                width: 30,
              ),
              SvgPicture.asset('assets/pass-dev.svg')
            ],
          ),
          SizedBox(
            height: 60,
          ),
          /*   Container(
            width: Get.width * 0.9,
            height: Get.height * 0.08,
            decoration: ShapeDecoration(
              color: theme[
                  Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![4],
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
            child: TextField(
              controller: pass1,
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'پسورد فعلی',
                  hintStyle: TextStyle(fontFamily: 'A'),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 20,
          ), */
          Container(
            width: Get.width * 0.9,
            height: Get.height * 0.08,
            decoration: ShapeDecoration(
              color: theme[
                  Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![4],
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
            child: TextField(
              controller: pass2,
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'پسورد جدید',
                  hintStyle: TextStyle(fontFamily: 'A'),
                  border: InputBorder.none),
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
            child: TextField(
              controller: pass3,
              maxLength: 4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'تکرار پسورد جدید',
                  hintStyle: TextStyle(fontFamily: 'A'),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              if (pass2.text == pass3.text) {
                /* final Telephony telephony = Telephony.instance;
                telephony.sendSms(
                  to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                  message:
                      '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} PASS ${pass2.text}',
                ); */
                sendsms(
                    '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value} PASS ${pass2.text}');
                Get.find<controllerphoneinfo>(tag: 'secend').Password.value =
                    pass2.text;
                Get.find<controllerphoneinfo>(tag: 'secend')
                    .updatephone('Password', pass2.text);

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
                  action: Text("پیامک ارسال شد و پسورد جدید اعمال شد",
                      style: TextStyle(fontFamily: 'A')),
                  actionHandler: () {
                    print("Action button pressed");
                  },
                ).show(context);
              } else {
                CherryToast.error(
                  backgroundColor: theme[
                      Get.find<controllerphoneinfo>(tag: 'secend')
                          .theme
                          .value]![0],
                  title: Text(
                    'خطا',
                    style: TextStyle(
                      fontFamily: 'A',
                    ),
                  ),
                  action: Text('اعمال نشد !! ورودی ها اشتباه وارد شده است',
                      style: TextStyle(fontFamily: 'A')),
                  actionHandler: () {
                    print("Action button pressed");
                  },
                ).show(context);
              }
            },
            child: Container(

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
                child: Center(
                    child: Text(
                  'اعمال',
                  style: TextStyle(fontFamily: 'A'),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ))),
          ),
        ],
      )),
    );
  }
}
