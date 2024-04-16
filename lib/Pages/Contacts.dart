//import 'dart:ffi';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
//import 'package:telephony/telephony.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:test_speech_to_text/send%20sms.dart';
import '../Getxcontroller/controllerphoneinfo.dart';
import '../color.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مخاطبین(مدیران)',
                  style: TextStyle(fontFamily: 'A'),
                ),
                SizedBox(
                  width: 30,
                ),
                SvgPicture.asset(
                  'assets/profile-circle.svg',
                  height: 23,
                )
              ],
            ),
            SizedBox(
              height: 20,
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
                  onTap: () {
                    print('hello');
                    //  Get.find<controllerphoneinfo>(tag: 'secend').adddevice();
                    String phone_contacts = '';
                    for (var i = 0; i < 10; i++) {
                      if (Get.find<controllerphoneinfo>(tag: 'secend')
                              .phonecontect[i]
                              .text
                              .length ==
                          11) {
                        Get.find<controllerphoneinfo>(tag: 'secend')
                                .contact1[i] =
                            '${Get.find<controllerphoneinfo>(tag: 'secend').namecontect[i].text}+${Get.find<controllerphoneinfo>(tag: 'secend').phonecontect[i].text}+${Get.find<controllerphoneinfo>(tag: 'secend').dropdownValues[i]}';
                        phone_contacts = phone_contacts +
                            '\n${i + 1}-${Get.find<controllerphoneinfo>(tag: 'secend').phonecontect[i].text}';
                      }
                      Get.find<controllerphoneinfo>(tag: 'secend').updatephone(
                          'contacts${i + 1}',
                          '${Get.find<controllerphoneinfo>(tag: 'secend').namecontect[i].text}+${Get.find<controllerphoneinfo>(tag: 'secend').phonecontect[i].text}+${Get.find<controllerphoneinfo>(tag: 'secend').dropdownValues[i]}');
                    }
                    /* final Telephony telephony = Telephony.instance;
                    telephony.sendSms(
                      to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                      message:
                          '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}M$phone_contacts',
                    ); */
                    sendsms(
                        '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}M$phone_contacts');

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
                  child: Center(
                      child: Text(
                    'ثبت مخاطبین',
                    style: TextStyle(fontFamily: 'A'),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  )),
                )),
            SizedBox(
              height: 15,
            ),
            Column(
              children: List.generate(
                10,
                (index) => Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      width: Get.width * 0.8,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: theme[
                            Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![4],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shadows: [
                          BoxShadow(
                            color: theme[
                                Get.find<controllerphoneinfo>(tag: 'secend')
                                    .theme
                                    .value]![5],
                            blurRadius: 8,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: Get.find<controllerphoneinfo>(tag: 'secend')
                            .namecontect[index],
                        //  keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: index == 0
                                ? 'نام مدیر ارشد'
                                : index > 0 && index < 5
                                    ? 'نام مدیر ${('${index}').toWord()}'
                                    : 'نام کاربر${('${index - 4}').toWord()}',
                            /* ? 'نام مدیر ${('${index + 1}').toWord()}م'
                                : ' نام مدیر سوم', */
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(fontFamily: 'A'),
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      width: Get.width * 0.8,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: theme[
                            Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![4],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shadows: [
                          BoxShadow(
                            color: theme[
                                Get.find<controllerphoneinfo>(tag: 'secend')
                                    .theme
                                    .value]![5],
                            blurRadius: 8,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: Get.find<controllerphoneinfo>(tag: 'secend')
                            .phonecontect[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: index == 0
                                ? 'شماره تلفن مدیر ارشد'
                                : index > 0 && index < 5
                                    ? 'شماره تلفن مدیر ${('${index}').toWord()}'
                                    : 'شماره تلفن کاربر ${('${index - 4}').toWord()}',
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(fontFamily: 'A'),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
