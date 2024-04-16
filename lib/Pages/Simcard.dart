import 'package:cherry_toast/cherry_toast.dart';
import 'package:test_speech_to_text/send%20sms.dart';
import '/Getxcontroller/controllerphoneinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
//import 'package:telephony/telephony.dart';

import '../Datebase/Datebase.dart';
import '../color.dart';

class simcard extends StatelessWidget {
  const simcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'سیمکارت',
                style: TextStyle(fontFamily: 'A'),
              ),
              SizedBox(
                width: 30,
              ),
              SvgPicture.asset('assets/simcard.svg')
            ],
          ),
          SizedBox(
            height: 60,
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
              children: [
                InkWell(
                  onTap: () {
                    // Get.find<controllerphoneinfo>(tag: 'secend').inqurycharge();
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
                    // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: theme[
                                Get.find<controllerphoneinfo>(tag: 'secend')
                                    .theme
                                    .value]![1]),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'استعلام',
                        style: TextStyle(fontFamily: 'A'),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'استعلام شارژ',
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
              children: [
                InkWell(
                  onTap: () {
                    TextEditingController tcontroller = TextEditingController();
                    Get.bottomSheet(Container(
                      decoration: BoxDecoration(
                        color: theme[
                            Get.find<controllerphoneinfo>(tag: 'secend')
                                .theme
                                .value]![0],
                      ),
                      width: Get.width,
                      child: Column(
                        children: [
                          Container(
                            width: Get.width * 0.9,
                            child: TextField(
                              controller: tcontroller,
                              autofocus: true,
                              maxLength: 16,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'کد شارژ را وارد کنید',
                                  hintStyle: TextStyle(fontFamily: 'A')),
                            ),
                            // height: 48,
                            decoration: ShapeDecoration(
                              color: theme[
                                  Get.find<controllerphoneinfo>(tag: 'secend')
                                      .theme
                                      .value]![4],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              shadows: [
                                BoxShadow(
                                  color: theme[Get.find<controllerphoneinfo>(
                                          tag: 'secend')
                                      .theme
                                      .value]![5],
                                  blurRadius: 8,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                              if (Get.find<controllerphoneinfo>(tag: 'secend')
                                      .OpratorSim
                                      .value ==
                                  'ir') {
                                /*  final Telephony telephony = Telephony.instance;
                                telephony.sendSms(
                                  to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                                  message:
                                      '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}*141*${tcontroller.text}#',
                                ); */
                                sendsms(
                                    '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}*141*${tcontroller.text}#');
                              }
                              if (Get.find<controllerphoneinfo>(tag: 'secend')
                                      .OpratorSim
                                      .value ==
                                  'ha') {
                                /*  final Telephony telephony = Telephony.instance;
                                telephony.sendSms(
                                  to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                                  message:
                                      '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}*140*#${tcontroller.text}#',
                                ); */
                                sendsms(
                                    '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}*140*#${tcontroller.text}#');
                              }
                              if (Get.find<controllerphoneinfo>(tag: 'secend')
                                      .OpratorSim
                                      .value ==
                                  'rl') {
                                /* final Telephony telephony = Telephony.instance;
                                telephony.sendSms(
                                  to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                                  message:
                                      '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}*141*${tcontroller.text}#',
                                ); */
                                sendsms(
                                    '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}*141*${tcontroller.text}#');
                              }
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
                                            Get.find<controllerphoneinfo>(
                                                    tag: 'secend')
                                                .theme
                                                .value]![1]),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Text(
                                    'اعمال',
                                    style: TextStyle(fontFamily: 'A'),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ));
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
                        'اعمال',
                        style: TextStyle(fontFamily: 'A'),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'شارژ سیمکارت',
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
                  onTap: () => delete_device(),
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
                    'حذف دستگاه',
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
                  onTap: () => change_name(),
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
                    'تغییر نام دستگاه',
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
                  onTap: () => Change_phone(),
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
                    'تغییر شماره تلفن دستگاه',
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

TextEditingController tf_phone = TextEditingController();
TextEditingController tf_name = TextEditingController();
Change_phone() {
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
          Text(
            'تغیر شماره تلفن دستگاه',
            style: TextStyle(fontFamily: 'A'),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
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
                  onTap: () => change_phone_confirm(),
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
                    width: Get.width * 0.5,
                    child: TextField(
                      controller: tf_phone,
                      autofocus: true,
                      decoration: InputDecoration(hintText: '09922993653مانند'),
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontFamily: 'A'),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(''),
        ],
      ),
    ),
    elevation: 10,
    barrierColor: Color.fromARGB(76, 34, 34, 34),
  );
}

change_phone_confirm() {
  Get.back();
  Get.defaultDialog(
    title: 'هشدار!',
    middleText: 'از تغییر شماره تلفن دستگاه مطمعن هستید؟',
    textConfirm: 'بله',
    onConfirm: () {
      String copyphone = '';
      for (var i = 1; i < tf_phone.text.length; i++) {
        copyphone = copyphone + tf_phone.text[i];
      }
      Get.find<controllerphoneinfo>(tag: 'secend').phone.value = copyphone;
      Get.find<controllerphoneinfo>(tag: 'secend')
          .updatephone('phone', copyphone);
      Get.back();
      Get.snackbar('توجه', 'شماره تلفن دستگاه تغییر کرد');
    },
  );
}

change_name() {
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
          Text(
            'تغیر نام دستگاه',
            style: TextStyle(fontFamily: 'A'),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
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
                  onTap: () => change_name_confirm(),
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
                    width: Get.width * 0.5,
                    child: TextField(
                      controller: tf_name,
                      autofocus: true,
                      decoration:
                          InputDecoration(hintText: 'نام دستگاه را وارد کنید'),
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontFamily: 'A'),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(''),
        ],
      ),
    ),
    elevation: 10,
    barrierColor: Color.fromARGB(76, 34, 34, 34),
  );
}

change_name_confirm() {
  Get.back();
  Get.defaultDialog(
    title: 'هشدار!',
    middleText: 'از تغییر نام دستگاه مطمعن هستید؟',
    textConfirm: 'بله',
    onConfirm: () {
      Get.find<controllerphoneinfo>(tag: 'secend').Name.value = tf_name.text;
      Get.find<controllerphoneinfo>(tag: 'secend')
          .updatephone('Name', tf_name.text);
      Get.back();
      Get.snackbar('توجه', 'نام  دستگاه تغییر کرد');
    },
  );
}

delete_device() {
  Get.defaultDialog(
    title: 'هشدار!',
    middleText: 'از حذف دستگاه مطمعن هستید؟',
    textConfirm: 'بله',
    /* onConfirm: () =>
          Get.find<controllerphoneinfo>(tag: 'secend').() */
  );
}
