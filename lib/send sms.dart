import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get.dart';
import 'package:test_speech_to_text/Getxcontroller/controllerphoneinfo.dart';
import 'package:url_launcher/url_launcher.dart';

sendsms(String message) async {
  /* await sendSMS(message: message, recipients: [
    '+98${Get.find<controllerphoneinfo>(tag: 'secend').phone.value}'
  ]).catchError((onError) {
    print(onError);
  }); */
  String phoneD = Get.find<controllerphoneinfo>(tag: 'secend').phone.value;
  String phoneU =
      '${phoneD[0]}${phoneD[1]}${phoneD[2]}${phoneD[3]}-${phoneD[4]}${phoneD[5]}${phoneD[6]}-${phoneD[7]}${phoneD[8]}${phoneD[9]}';
  String uri =
      //'sms:9307-114-409&body=hello%20there';
      'sms:${phoneU}&body=${message}';
  print(uri);
  // ignore: deprecated_member_use
  if (await canLaunch(uri)) {
    // ignore: deprecated_member_use
    await launch(uri);
  }
}
