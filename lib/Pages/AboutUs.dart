import '/Getxcontroller/controllerphoneinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../color.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'راه های ارتباطی با ما',
                  style: TextStyle(fontFamily: 'A'),
                ),
                SizedBox(
                  width: 30,
                ),
                SvgPicture.asset('assets/info-circle.svg')
              ],
            ),
            SizedBox(
              height: 60,
            ),
            // Text('راه های ارتباطی با ما:'),
            Container(
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
                    onTap: () async {
                      final Uri _url =
                          Uri.parse('https://ermiya-electronic.com/');
                      await launchUrl(_url);
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
                        'ورود',
                        style: TextStyle(fontFamily: 'A'),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'ermiya-electronic.com',
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
                    onTap: () async {
                      final Uri _url = Uri.parse('tel:09120434687');
                      await launchUrl(_url);
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
                        'تماس',
                        style: TextStyle(fontFamily: 'A'),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      '09120434687',
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
      ),
    );
  }
}
