import 'package:cherry_toast/cherry_toast.dart';
import 'package:test_speech_to_text/send%20sms.dart';
import '/Getxcontroller/controllerphoneinfo.dart';
import '/testpage/home%20page%201%20.dart';
import '/widget_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
//import 'package:telephony/telephony.dart';

import '../color.dart';

class HalfOn extends StatefulWidget {
  const HalfOn({super.key});

  @override
  State<HalfOn> createState() => _HalfOnState();
}

class _HalfOnState extends State<HalfOn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          helpheader(name: 'نیمه فعالسازی', name_svg: 'shield', help: 'help'),
          /* Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'نیمه فعالسازی',
                  style: TextStyle(fontFamily: 'A'),
                ),
                const SizedBox(
                  width: 30,
                ),
                SvgPicture.asset(
                  'assets/shield.svg',
                  height: 23,
                )
              ],
            ),
          ), */
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: Get.width,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                zoon_bisim(),
                zoon_asli(),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: InkWell(
              onTap: () {
                String binaryNumber_asli = '';

                for (var i = 3; i > -1; i--) {
                  if (Get.find<controllerphoneinfo>(tag: 'secend').eyezoon[i] ==
                      true) {
                    binaryNumber_asli = binaryNumber_asli + '1';
                  } else {
                    binaryNumber_asli = binaryNumber_asli + '0';
                  }
                }
                // عدد باینری ورودی

                int decimalNumber_asli = int.parse(binaryNumber_asli,
                    radix: 2); // تبدیل عدد باینری به عدد دسیمال

                String hexNumber_asli = decimalNumber_asli
                    .toRadixString(16); // تبدیل عدد دسیمال به عدد هگز

                print(' $hexNumber_asli-$binaryNumber_asli');

                ///

                String binaryNumber_bisim = '';

                for (var i = 7; i > 3; i--) {
                  if (Get.find<controllerphoneinfo>(tag: 'secend').eyezoon[i] ==
                      true) {
                    binaryNumber_bisim = binaryNumber_bisim + '1';
                  } else {
                    binaryNumber_bisim = binaryNumber_bisim + '0';
                  }
                }
                // عدد باینری ورودی

                int decimalNumber_bisim = int.parse(binaryNumber_bisim,
                    radix: 2); // تبدیل عدد باینری به عدد دسیمال

                String hexNumber_bisim = decimalNumber_bisim
                    .toRadixString(16); // تبدیل عدد دسیمال به عدد هگز

                print(' $hexNumber_bisim-$binaryNumber_bisim');

                String copy = '';
                for (var i = 0; i < 9; i++) {
                  copy = copy +
                      (Get.find<controllerphoneinfo>(tag: 'secend')
                                  .eyezoon[i] ==
                              true
                          ? '1'
                          : '0');
                }
                Get.find<controllerphoneinfo>(tag: 'secend')
                    .eyezoonindex
                    .value = copy;
                Get.find<controllerphoneinfo>(tag: 'secend')
                    .updatephone('zoonOnOff', copy);
                Get.find<controllerphoneinfo>(tag: 'secend').OnPhones.value =
                    'halfon';
                Get.find<controllerphoneinfo>(tag: 'secend')
                    .updatephone('OnPhones', 'halfon');
                /*  final Telephony telephony = Telephony.instance;
                telephony.sendSms(
                  to: "+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}",
                  message:
                      '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}P$hexNumber_asli$hexNumber_bisim',
                ); */
                sendsms(
                    '${Get.find<controllerphoneinfo>(tag: 'secend').Password.value}P$hexNumber_asli$hexNumber_bisim');
                Get.off(HomePage1());
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
                // Get.snackbar('اطلاعیه', 'پیامک فرستاده شد');
              },
              child: Container(
                width: Get.width * 0.46,
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
                child: const Center(
                    child: Text(
                  'اعمال تغییرات نیمه فعالسازی',
                  style: TextStyle(fontFamily: 'A'),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class zoon_asli extends StatelessWidget {
  const zoon_asli({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.45,
      height: Get.height * 0.5,
      decoration: BoxDecoration(
        // shape: BoxShape.rectangle,
        color:
            // Colors.white,
            theme[Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![4],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: theme[
                Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![5],
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/graph.svg'),
              Text(
                'زون های اصلی',
                style: TextStyle(
                    color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                        .theme
                        .value]![3],
                    fontFamily: 'A'),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  4,
                  (index) => Obx(() {
                        return CheckboxListTile(
                          value: Get.find<controllerphoneinfo>(tag: 'secend')
                              .eyezoon[index],
                          onChanged: (value) {
                            Get.find<controllerphoneinfo>(tag: 'secend')
                                .eyezoon[index] = value!;
                          },
                          //checkboxSemanticLabel: 'AA',
                          title: Text(
                            'زون ${'${index + 1}'.toPersianDigit()}',
                            style: TextStyle(fontFamily: 'A'),
                          ),
                          //title: Icon(Icons.drive_file_rename_outline)
                        );
                      })),
            ),
          )
        ],
      ),
    );
  }
}

class zoon_bisim extends StatelessWidget {
  const zoon_bisim({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.45,
      height: Get.height * 0.5,
      decoration: BoxDecoration(
        // shape: BoxShape.rectangle,
        color:
            theme[Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![4],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: theme[
                Get.find<controllerphoneinfo>(tag: 'secend').theme.value]![5],
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/radar.svg'),
              Text(
                'زون های بیسیم',
                style: TextStyle(
                    color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
                        .theme
                        .value]![3],
                    fontFamily: 'A'),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  4,
                  (index) => Obx(() {
                        return CheckboxListTile(
                          value: Get.find<controllerphoneinfo>(tag: 'secend')
                              .eyezoon[index + 4],
                          onChanged: (value) {
                            Get.find<controllerphoneinfo>(tag: 'secend')
                                .eyezoon[index + 4] = value!;
                          },
                          //checkboxSemanticLabel: 'AA',
                          title: Text(
                            'زونw ${'${index + 1}'.toPersianDigit()}',
                            style: TextStyle(fontFamily: 'A'),
                          ),
                          //title: Icon(Icons.drive_file_rename_outline)
                        );
                      })),
            ),
          )
        ],
      ),
    );
  }
}
