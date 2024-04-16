import '/Getxcontroller/controllerphoneinfo.dart';
import '/testpage/home%20page%201%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'از بین دستگاه های زیر یکی را انتخاب کنید',
              style: TextStyle(fontFamily: 'A'),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Wrap(
                children: List.generate(
                    Get.find<controllerphoneinfo>(tag: 'secend')
                        .lenghtmainpage
                        .value,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.01,
                              vertical: Get.width * 0.01),
                          child: InkWell(
                            onTap: () {
                              Get.find<controllerphoneinfo>(tag: 'secend')
                                  .changepage(index);
                              Get.off(HomePage1());
                              Get.find<controllerphoneinfo>(tag: 'secend')
                                  .selectpage
                                  .value = true;
                            },
                            child: Container(
                              width: Get.width * 0.3,
                              height: Get.width * 0.3,
                              decoration: ShapeDecoration(
                                color: theme[
                                    Get.find<controllerphoneinfo>(tag: 'secend')
                                        .theme
                                        .value]![4],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
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
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: Image.asset(Get.find<
                                                            controllerphoneinfo>(
                                                        tag: 'secend')
                                                    .phoness[index]
                                                    .Anten ==
                                                '' ||
                                            Get.find<controllerphoneinfo>(
                                                        tag: 'secend')
                                                    .phoness[index]
                                                    .Anten ==
                                                ' '
                                        ? 'assets/home.png'
                                        : 'assets/${Get.find<controllerphoneinfo>(tag: 'secend').phoness[index].Anten}.png'),
                                  ),
                                  Text(
                                    '${Get.find<controllerphoneinfo>(tag: 'secend').phoness[index].Name}',
                                    style: TextStyle(
                                      fontFamily: 'A',
                                      color: theme[
                                          Get.find<controllerphoneinfo>(
                                                  tag: 'secend')
                                              .theme
                                              .value]![3],
                                    ),
                                  ),
                                  Text(
                                    '${Get.find<controllerphoneinfo>(tag: 'secend').phoness[index].phone}',
                                    style: const TextStyle(
                                      fontFamily: 'A',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
