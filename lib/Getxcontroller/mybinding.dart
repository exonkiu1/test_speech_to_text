import 'package:get/get.dart';

import 'controllerOnOff.dart';
import 'controllercolor.dart';
import 'controllerphoneinfo.dart';
import 'controllershow.dart';

class mybinding implements Bindings {
  @override
  void dependencies() {
    Get.put(controllercolor(), tag: 'secend', permanent: true);
    //Get.put(testcontroller(), tag: 'secend', permanent: true);
    Get.put(controlleronoff(), tag: 'secend', permanent: true);
    Get.put(controllerphoneinfo(), tag: 'secend', permanent: true);
    Get.put(controllershow(), tag: 'secend', permanent: true);
    // TODO: implement dependencies
  }
}
