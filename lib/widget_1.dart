import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:super_tooltip/super_tooltip.dart';

import 'Getxcontroller/controllerphoneinfo.dart';
import 'color.dart';

class cont extends StatelessWidget {
  const cont({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.08,
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
    );
  }
}

class cont2 extends StatelessWidget {
  const cont2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.08,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        //verticalDirection: VerticalDirection.up,
        children: [
          Container(
            height: Get.height * 0.06,
            width: 80,
            margin: EdgeInsets.only(
              left: 10,
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: theme[Get.find<controllerphoneinfo>(tag: 'secend')
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
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '',
              style: TextStyle(fontFamily: 'A'),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}

bottomsh() {
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
            Text(''),
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
                  Container(
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
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      '',
                      style: TextStyle(fontFamily: 'A'),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
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
      barrierColor: Color.fromARGB(76, 34, 34, 34));
}

class helpheader extends StatelessWidget {
  const helpheader(
      {super.key,
      required this.name,
      required this.name_svg,
      required this.help});
  final String name;
  final String name_svg;
  final String help;
  @override
  Widget build(BuildContext context) {
    final _controller = SuperTooltipController();

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () => _controller.showTooltip(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SuperTooltip(
              controller: _controller,
              content: const Text(
                "این یک متن برای راهنمایی است",
                softWrap: true,
                style: TextStyle(fontFamily: 'A'),
              ),
              child: SvgPicture.asset(
                'assets/info-circle.svg',
                height: 23,
              ),
            ),
            Text(
              name,
              style: TextStyle(fontFamily: 'A'),
            ),
            const SizedBox(
              width: 30,
            ),
            SvgPicture.asset(
              'assets/${name_svg}.svg',
              height: 23,
            )
          ],
        ),
      ),
    );
  }
}
