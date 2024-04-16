// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/Getxcontroller/controllerOnOff.dart';
//import 'package:test_web_luxsecurity/pages/PageSetting/inquryAll.dart';
import '/Datebase/Model.dart';

import 'package:test_speech_to_text/send sms.dart';
//import 'package:test_web_luxsecurity/GetxController/controllerOnOff.dart';

class controllerphoneinfo extends GetxController {
  @override
  void onInit() async {
    await getphones();
    final prefs = await SharedPreferences.getInstance();
    int L = prefs.getInt('LenghPage') ?? 0;
    lenghtmainpage.value = L;
    if (L > 0) {
      print('yesChangePage');
      changepage(0);
    }
    // TODO: implement onInit
    super.onInit();
  }

  RxBool selectpage = false.obs;
  RxBool show_setting = true.obs;
  RxString theme = 'orange'.obs;
  RxInt bootomnavbar = 0.obs;
  RxInt lenghtmainpage = 0.obs;
  RxInt ChangeDevices = 0.obs;
  //SwiperController mainpagecontroller = SwiperController();
  RxString id = ''.obs;
  RxInt indexdevice = 0.obs;
  RxList<phones> phoness = <phones>[].obs;
  RxString phone = ''.obs;
  RxString Name = ''.obs; // نام
  RxString OnPhones = 'on'.obs; //روشن خاموش
  RxString OpratorSim = ''.obs; //اپراتور سیم کارت
  RxString Contacts = ',,,,,'.obs; //مخاطبین
  RxString Zone = ''.obs; //زون ها
  RxString Relleh = 'on on'.obs; //رله
  RxString Language = 'fri'.obs; //زبان دستگاه
  RxString CallOnElectricity = 'on'.obs; //تماس قطعی برق
  RxString AlarmTime = '10'.obs; //زمان آژیر
  RxString PeriodicInventoryReport = '12'.obs; //گزارش دوره ای موجودی
  RxString PeriodicBatteryReport = '12'.obs; //گزارش دوره ای باطری
  RxString MoodAlarm = '0'.obs; //مد آلارم
  RxString Password = ''.obs; //پسورد
  RxString Relleh1 = 'on'.obs;
  RxString Relleh2 = 'on'.obs;
  RxString Relleh3 = 'on'.obs;
  RxInt Charge = 0.obs; //شارژ
  RxString VoltAc = ''.obs;
  RxString Speaker = ''.obs;
  RxString Countremote = ''.obs;
  RxString Anten = ''.obs;
  RxString CountConuntect = ''.obs;
  RxString StatusNetwork = ''.obs;
  RxString Voltbatry = ''.obs;
  RxString StatusRelleh = ''.obs;
  RxString StatusRelleh2 = ''.obs;
  RxString contacts1 = ''.obs;
  RxString contacts2 = ''.obs;
  RxString contacts3 = ''.obs;
  RxString contacts4 = ''.obs;
  RxString contacts5 = ''.obs;
  RxString contacts6 = ''.obs;
  RxString Statuszoons = '1111'.obs;
  RxList<bool> eyezoon = List.generate(15, (index) => true).obs;
  RxString eyezoonindex = '11111111111111'.obs;
  List<RxString> nameZoon = List.generate(15, (index) => ''.obs);
  RxBool OnPassword = false.obs;
  RxInt Chargemin = 0.obs, Chargemax = 0.obs;
  TextEditingController Text_i_contacts = TextEditingController(),
      Text_i_inquryAll = TextEditingController(),
      Text_i_zoon = TextEditingController();
  //RxInt testcopy = 0.obs;
  RxList<String> contact1 = <String>[
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
  ].obs;
  RxList<int> zones = <int>[0, 0, 0, 0, 0].obs;
  RxList<String> zonesdropdown = <String>[
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
    'Normaly close',
  ].obs;
  List<TextEditingController> namecontect =
      List.generate(10, (index) => TextEditingController());
  List<TextEditingController> phonecontect =
      List.generate(10, (index) => TextEditingController());
  List<TextEditingController> Rellehtime =
      List.generate(10, (index) => TextEditingController());
  RxList<String> dropdownValues =
      <String>['A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A'].obs;
  RxList<String> Relehs = <String>[' ', ' ', ' ', ' ', ' ', ' '].obs;
  RxInt TypeRelleh = 0.obs;
  TextEditingController textphone = TextEditingController(),
      textnamephone = TextEditingController();
  RxList<String> station = <String>[].obs;
  RxInt fifteensecends = 17.obs;
  startfifteensecends() async {
    fifteensecends.value = 0;
    for (var i = 0; i < 17; i++) {
      await Future.delayed(Duration(seconds: 1));
      fifteensecends = fifteensecends + 1;
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  void resetphone() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('LenghPage', 0);
    prefs.setStringList('id', []);

    prefs.setStringList('AlarmTime', []);

    prefs.setStringList('CallOnElectricity', []);

    prefs.setStringList('Contacts', []);

    prefs.setStringList('Language', []);

    prefs.setStringList('MoodAlarm', []);
    /* List<String> name = (prefs.getStringList('Name') ?? <String>[]);
    name.add(item.Name); */
    prefs.setStringList('Name', []);

    prefs.setStringList('OnPhones', []);

    prefs.setStringList('OpratorSim', []);

    prefs.setStringList('Password', []);

    prefs.setStringList('PeriodicBatteryReport', []);

    prefs.setStringList('PeriodicInventoryReport', []);

    prefs.setStringList('Relleh', []);

    prefs.setStringList('Zone', []);

    prefs.setStringList('phone', []);

    prefs.setStringList('Anten', []);

    prefs.setStringList('Charge', []);

    prefs.setStringList('Countremote', []);

    prefs.setStringList('CountConuntect', []);

    prefs.setStringList('Speaker', []);

    prefs.setStringList('StatusNetwork', []);

    prefs.setStringList('StatusRelleh', []);

    prefs.setStringList('VoltAc', []);

    prefs.setStringList('Voltbatry', []);

    prefs.setStringList('contacts1', []);

    prefs.setStringList('contacts2', []);

    prefs.setStringList('contacts3', []);

    prefs.setStringList('contacts4', []);
    prefs.setStringList('contacts5', []);
    prefs.setStringList('contacts6', []);
    prefs.setStringList('contacts10', []);
    prefs.setStringList('contacts7', []);
    prefs.setStringList('contacts8', []);
    prefs.setStringList('contacts9', []);
    prefs.setStringList('eyezoonindex', []);
    Get.snackbar('هشدار', 'یکبار برنامه را کامل ببندید دوباره وارد شوید');
  }

  void changepage(int count) {
    id.value = phoness[count].id;
    phone.value = phoness[count].phone;
    Name.value = phoness[count].Name; // نام
    OnPhones.value = phoness[count].OnPhones; //روشن خاموش

    OpratorSim.value = phoness[count].OpratorSim; //اپراتور سیم کارت
    Statuszoons.value = phoness[count].Contacts; //مخاطبین
    Zone.value = phoness[count].Zone; //زون ها
    Relleh.value = phoness[count].Relleh; //رله
    Language.value = phoness[count].Language; //زبان دستگاه
    CallOnElectricity.value = phoness[count].CallOnElectricity; //تماس قطعی برق
    AlarmTime.value = phoness[count].AlarmTime; //زمان آژیر
    PeriodicInventoryReport.value =
        phoness[count].PeriodicInventoryReport; //گزارش دوره ای موجودی
    PeriodicBatteryReport.value =
        phoness[count].PeriodicBatteryReport; //گزارش دوره ای باطری
    MoodAlarm.value = phoness[count].MoodAlarm; //مد آلارم
    Password.value = phoness[count].Password;
    VoltAc.value = phoness[count].VoltAc;
    Speaker.value = phoness[count].Speaker;
    Voltbatry.value = phoness[count].Voltbatry;
    Anten.value = phoness[count].Anten;
    CountConuntect.value = phoness[count].CountConuntect;
    Countremote.value = phoness[count].Countremote;
    StatusNetwork.value = phoness[count].StatusNetwork;
    StatusRelleh.value = phoness[count].StatusRelleh;
    //StatusRelleh2.value = phoness[count].StatusRelleh.split('+')[1];

    contact1[0] = phoness[count].contacts1;
    contact1[1] = phoness[count].contacts2;
    contact1[2] = phoness[count].contacts3;
    contact1[3] = phoness[count].contacts4;
    contact1[4] = phoness[count].contacts5;
    contact1[5] = phoness[count].contacts6;
    contact1[6] = phoness[count].contacts7;
    contact1[7] = phoness[count].contacts8;
    contact1[8] = phoness[count].contacts9;
    contact1[9] = phoness[count].contacts10;
    //charge
    Charge.value = int.parse(phoness[count].Charge.split(' ')[0]);
    Chargemin.value =
        int.parse(phoness[count].Charge.split(' ')[1].split(',')[0]);
    Chargemax.value =
        int.parse(phoness[count].Charge.split(' ')[1].split(',')[1]);
    //relleh
    TypeRelleh.value = int.parse(phoness[count].Relleh.split(' ')[2]);
    //relleh1
    Relehs[0] = phoness[count].Relleh.split(' ')[0].split('+')[0];
    Relehs[1] = phoness[count].Relleh.split(' ')[0].split('+')[1];
    Relleh1.value = phoness[count].Relleh.split(' ')[0].split('+')[2];
    //relleh2
    Relehs[2] = phoness[count].Relleh.split(' ')[1].split('+')[0];
    Relehs[3] = phoness[count].Relleh.split(' ')[1].split('+')[1];
    Relleh2.value = phoness[count].Relleh.split(' ')[1].split('+')[2];
    //contexts
    for (var j = 0; j < 10; j++) {
      if (contact1[j] != ' ') {
        namecontect[j].text = contact1[j].split('+')[0];
        phonecontect[j].text = contact1[j].split('+')[1];
        dropdownValues[j] = contact1[j].split('+')[2];
      } else {
        namecontect[j].text = '';
        phonecontect[j].text = '';
        dropdownValues[j] = 'A';
      }
      print(contact1);
    }
    //Zoon on off
    eyezoonindex.value = phoness[count].zoonOnOff;

    ///
    for (var i = 0; i < 15; i++) {
      eyezoonindex.value[i] == '1' ? eyezoon[i] = true : eyezoon[i] = false;
    }

    ///
    for (var i = 0; i < 15; i++) {
      nameZoon[i].value = phoness[count].nameZoon.split(',')[i];
    }
    //
    //zones
    // String copytext;
    List<String> typezoon = [
      'Normaly close',
      'Normaly Open',
      '24 ساعت',
      'دینگ دانگ',
      'حفاظت',
      'جاسوسی',
      'آبی',
      'حفاظت'
    ];
    print(phoness[count].Zone);
    print(Zone.value.split(' '));
    for (var i = 0; i < (Zone.value.split(' ').length - 2); i++) {
      zonesdropdown[i] = typezoon[int.parse(Zone.value.split(' ')[i])];
    }
    print(zonesdropdown);
    //Relleh
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  getphones() async {
    final prefs1 = await SharedPreferences.getInstance();
    List<String> copylistname = prefs1.getStringList('Name') ?? <String>[];
    int L = copylistname.length;
    lenghtmainpage.value = L;
    print(L);

    // int i = 0;
    for (int i = 0; i < L; i++) {
      final prefs = await SharedPreferences.getInstance();
      phones item = phones(
        nameZoon: prefs.getStringList('nameZoon')![i],
        zoonOnOff: prefs.getStringList('zoonOnOff')![i],
        AlarmTime: prefs.getStringList('AlarmTime')![i],
        CallOnElectricity: prefs.getStringList('CallOnElectricity')![i],
        Contacts: prefs.getStringList('Contacts')![i],
        Language: prefs.getStringList('Language')![i],
        MoodAlarm: prefs.getStringList('MoodAlarm')![i],
        Name: prefs.getStringList('Name')![i],
        OnPhones: prefs.getStringList('OnPhones')![i],
        OpratorSim: prefs.getStringList('OpratorSim')![i],
        Password: prefs.getStringList('Password')![i],
        PeriodicBatteryReport: prefs.getStringList('PeriodicBatteryReport')![i],
        PeriodicInventoryReport:
            prefs.getStringList('PeriodicInventoryReport')![i],
        Relleh: prefs.getStringList('Relleh')![i],
        Zone: prefs.getStringList('Zone')![i],
        phone: prefs.getStringList('phone')![i],
        Anten: prefs.getStringList('Anten')![i],
        Charge: prefs.getStringList('Charge')![i],
        CountConuntect: prefs.getStringList('CountConuntect')![i],
        Countremote: prefs.getStringList('Countremote')![i],
        Speaker: prefs.getStringList('Speaker')![i],
        StatusNetwork: prefs.getStringList('StatusNetwork')![i],
        StatusRelleh: prefs.getStringList('StatusRelleh')![i],
        VoltAc: prefs.getStringList('VoltAc')![i],
        Voltbatry: prefs.getStringList('Voltbatry')![i],
        contacts1: prefs.getStringList('contacts1')![i],
        contacts2: prefs.getStringList('contacts2')![i],
        contacts3: prefs.getStringList('contacts3')![i],
        contacts4: prefs.getStringList('contacts4')![i],
        contacts5: prefs.getStringList('contacts5')![i],
        contacts6: prefs.getStringList('contacts6')![i],
        contacts10: prefs.getStringList('contacts10')![i],
        contacts7: prefs.getStringList('contacts7')![i],
        contacts8: prefs.getStringList('contacts8')![i],
        contacts9: prefs.getStringList('contacts9')![i],
        id: prefs.getStringList('id')![i],
        DateGuarantee: '',
        remoteOnOff: '',
      );
      phoness.add(item);
      // print(phoness[i].Name);
    }
    print(phoness);
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  RxBool inquryall = false.obs;
  void updatephone(String name, String value) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(name) ?? <String>[''];
    print(list);
    list[ChangeDevices.value] = value;
    prefs.setStringList(name, list);
    print('${prefs.getStringList(name)}kkg');
    if (inquryall == true) {
      getphones();
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  void addphone() async {
    String copyphone = '';
    for (var i = 1; i < textphone.text.length; i++) {
      copyphone = copyphone + textphone.text[i];
    }

    String copyid = '${phoness.length + 1}';
    final prefs = await SharedPreferences.getInstance();
    int s = prefs.getInt('LenghPage') ?? 0 + 1;
    prefs.setInt('LenghPage', s);
    print(prefs.getInt('LenghPage'));
    phones item = phones(
      id: copyid,
      AlarmTime: '10',
      CallOnElectricity: 'on',
      Contacts: '1111',
      Language: 'fri',
      MoodAlarm: '0',
      Name: '${textnamephone.text}',
      OnPhones: 'on',
      OpratorSim:
          '${Get.find<controlleronoff>(tag: 'secend').opretorsim.value}',
      Password: '0000',
      PeriodicBatteryReport: '10',
      PeriodicInventoryReport: '12',
      Relleh: 'خروجی1+02,00,00+on خروجی2+02,00,00+on خروجی3+02,00,00+on',
      Zone: '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
      phone: '${copyphone}',
      Anten: ' ',
      Charge: '0 2000,20000',
      CountConuntect: ' ',
      Countremote: ' ',
      Speaker: ' ',
      StatusNetwork: ' ',
      StatusRelleh: ' ',
      VoltAc: ' ',
      Voltbatry: ' ',
      contacts1: ' ',
      contacts2: ' ',
      contacts3: ' ',
      contacts4: ' ',
      contacts5: ' ',
      contacts6: ' ',
      contacts10: ' ',
      contacts7: ' ',
      contacts8: ' ',
      contacts9: ' ',
      zoonOnOff: '111111111111111',
      nameZoon: ',,,,,,,,,,,,,,,',
      DateGuarantee: '',
      remoteOnOff: '',
    );

    ///
    ///
    ///
    ///
    prefs.setStringList(
        'zoonOnOff',
        (prefs.getStringList('zoonOnOff') ?? <String>[]) +
            <String>[item.zoonOnOff]);

    prefs.setStringList(
        'nameZoon',
        (prefs.getStringList('nameZoon') ?? <String>[]) +
            <String>[item.nameZoon]);

    prefs.setStringList(
        'id', (prefs.getStringList('id') ?? <String>[]) + <String>[item.id]);

    prefs.setStringList(
        'AlarmTime',
        (prefs.getStringList('AlarmTime') ?? <String>[]) +
            <String>[item.AlarmTime]);

    prefs.setStringList(
        'CallOnElectricity',
        (prefs.getStringList('CallOnElectricity') ?? <String>[]) +
            <String>[item.CallOnElectricity]);

    prefs.setStringList(
        'Contacts',
        (prefs.getStringList('Contacts') ?? <String>[]) +
            <String>[item.Contacts]);

    prefs.setStringList(
        'Language',
        (prefs.getStringList('Language') ?? <String>[]) +
            <String>[item.Language]);

    prefs.setStringList(
        'MoodAlarm',
        (prefs.getStringList('MoodAlarm') ?? <String>[]) +
            <String>[item.MoodAlarm]);
    List<String> name = (prefs.getStringList('Name') ?? <String>[]);
    name.add(item.Name);
    prefs.setStringList('Name', name);

    prefs.setStringList(
        'OnPhones',
        (prefs.getStringList('OnPhones') ?? <String>[]) +
            <String>[item.OnPhones]);

    prefs.setStringList(
        'OpratorSim',
        (prefs.getStringList('OpratorSim') ?? <String>[]) +
            <String>[item.OpratorSim]);

    prefs.setStringList(
        'Password',
        (prefs.getStringList('Password') ?? <String>[]) +
            <String>[item.Password]);

    prefs.setStringList(
        'PeriodicBatteryReport',
        (prefs.getStringList('PeriodicBatteryReport') ?? <String>[]) +
            <String>[item.PeriodicBatteryReport]);

    prefs.setStringList(
        'PeriodicInventoryReport',
        (prefs.getStringList('PeriodicInventoryReport') ?? <String>[]) +
            <String>[item.PeriodicInventoryReport]);

    prefs.setStringList('Relleh',
        (prefs.getStringList('Relleh') ?? <String>[]) + <String>[item.Relleh]);

    prefs.setStringList('Zone',
        (prefs.getStringList('Zone') ?? <String>[]) + <String>[item.Zone]);

    prefs.setStringList('phone',
        (prefs.getStringList('phone') ?? <String>[]) + <String>[item.phone]);

    prefs.setStringList('Anten',
        (prefs.getStringList('Anten') ?? <String>[]) + <String>[item.Anten]);

    prefs.setStringList('Charge',
        (prefs.getStringList('Charge') ?? <String>[]) + <String>[item.Charge]);

    prefs.setStringList(
        'Countremote',
        (prefs.getStringList('CountConuntect') ?? <String>[]) +
            <String>[item.Countremote]);

    prefs.setStringList(
        'CountConuntect',
        (prefs.getStringList('CountConuntect') ?? <String>[]) +
            <String>[item.CountConuntect]);

    prefs.setStringList(
        'Speaker',
        (prefs.getStringList('Speaker') ?? <String>[]) +
            <String>[item.Speaker]);

    prefs.setStringList(
        'StatusNetwork',
        (prefs.getStringList('StatusNetwork') ?? <String>[]) +
            <String>[item.StatusNetwork]);

    prefs.setStringList(
        'StatusRelleh',
        (prefs.getStringList('StatusRelleh') ?? <String>[]) +
            <String>[item.StatusRelleh]);

    prefs.setStringList('VoltAc',
        (prefs.getStringList('VoltAc') ?? <String>[]) + <String>[item.VoltAc]);

    prefs.setStringList(
        'Voltbatry',
        (prefs.getStringList('Voltbatry') ?? <String>[]) +
            <String>[item.Voltbatry]);

    prefs.setStringList(
        'contacts1',
        (prefs.getStringList('contacts1') ?? <String>[]) +
            <String>[item.contacts1]);

    prefs.setStringList(
        'contacts2',
        (prefs.getStringList('contacts2') ?? <String>[]) +
            <String>[item.contacts2]);

    prefs.setStringList(
        'contacts3',
        (prefs.getStringList('contacts3') ?? <String>[]) +
            <String>[item.contacts3]);

    prefs.setStringList(
        'contacts4',
        (prefs.getStringList('contacts4') ?? <String>[]) +
            <String>[item.contacts4]);
    prefs.setStringList(
        'contacts5',
        (prefs.getStringList('contacts5') ?? <String>[]) +
            <String>[item.contacts5]);
    prefs.setStringList(
        'contacts6',
        (prefs.getStringList('contacts6') ?? <String>[]) +
            <String>[item.contacts6]);
    prefs.setStringList(
        'contacts10',
        (prefs.getStringList('contacts10') ?? <String>[]) +
            <String>[item.contacts10]);
    prefs.setStringList(
        'contacts7',
        (prefs.getStringList('contacts7') ?? <String>[]) +
            <String>[item.contacts7]);
    prefs.setStringList(
        'contacts8',
        (prefs.getStringList('contacts8') ?? <String>[]) +
            <String>[item.contacts8]);
    prefs.setStringList(
        'contacts9',
        (prefs.getStringList('contacts9') ?? <String>[]) +
            <String>[item.contacts9]);
    //
    //get
    //
    await getphones();
    if (s == 1) {
      changepage(0);
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  void onoff(String mode, int code) async {
    if (fifteensecends.value >= 15) {
      sendsms(
        '$code',
      );
      OnPhones.value = mode;
      updatephone('OnPhones', mode);
    } else {
      Get.snackbar('خطا', 'هر 15 ثانیه یکبار درخواست ارسال کنید');
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  void inqurycontacts() {
    sendsms('91');
    Get.find<controlleronoff>(tag: 'secend').Inquirycontect.value = true;

    startfifteensecends();
  }

  ///
  ///
  void inqurycontacts1() {
    Get.find<controlleronoff>(tag: 'secend').Inquirycontect.value = false;
    Get.snackbar('توجه', 'اعمال شد');
    List<String> copycontexts = Text_i_contacts.text.split('*');
    for (var i = 1; i < copycontexts.length; i++) {
      String copyphonecontext = '';
      for (var j = 0; j < 11; j++) {
        copyphonecontext = copyphonecontext + copycontexts[i][j];
      }
      phonecontect[i - 1].text = copyphonecontext;
      dropdownValues[i - 1] = copycontexts[i][11];
      contact1[i - 1] = ' +${copyphonecontext}+${copycontexts[i][11]}';
      print(contact1[i - 1]);
      updatephone('contacts$i', ' +${copyphonecontext}+${copycontexts[i][11]}');
      Get.find<controlleronoff>(tag: 'secend').Inquirycontect.value = false;
      //  updatePhone();
    }
    //updatephone('contact1$i', ' +${copyphonecontext}+${copycontexts[i][11]}');
  }

  ///
  ///
  ///
  ///
  ///
  ///
  inquryall_1() {
    inquryall.value = true;
    sendsms('90');

    startfifteensecends();
  }

  TextEditingController field_inqury = TextEditingController();
  inquryall_2() {
    Get.snackbar('توجه', 'اعمال شد');
    inquryall.value = false;

    List<String> resivesms = field_inqury.text.split(',');
//1
    if (resivesms[0] == '0') {
      OnPhones.value = 'off';
    }
    if (resivesms[0] == '4') {
      OnPhones.value = 'on';
    }
    if (resivesms[0] == '3') {
      OnPhones.value = 'silent';
    }
    if (resivesms[0] == '2') {
      OnPhones.value = 'halfon';
    }
    updatephone('OnPhones', OnPhones.value);
    //2
    if (resivesms[1] == '1') {
      VoltAc.value = 'روشن';
    } else {
      VoltAc.value = 'خاموش';
    }
    updatephone('VoltAc', VoltAc.value);
    //3
    Statuszoons.value = resivesms[2];
    updatephone('Statuszoons', Statuszoons.value);
    //4
    if (resivesms[3] == '1') {
      Speaker.value = 'روشن';
    } else {
      Speaker.value = 'خاموش';
    }
    updatephone('Speaker', Speaker.value);
    //5
    Countremote.value = resivesms[4];
    updatephone('Countremote', Countremote.value);
    //6
    // String copyAnten='${(int.parse(resivesms[5]) / 31) * 100}'[0];
    Anten.value = '${(int.parse(resivesms[5]) / 31) * 100}'[0] +
        '${(int.parse(resivesms[5]) / 31) * 100}'[1] +
        '${(int.parse(resivesms[5]) / 31) * 100}'[2] +
        '${(int.parse(resivesms[5]) / 31) * 100}'[3];
    // (resivesms[5]);
    updatephone('Anten', Anten.value);
    //7
    CountConuntect.value = resivesms[6];
    updatephone('CountConuntect', CountConuntect.value);
    //8
    if (resivesms[7] == '1') {
      StatusNetwork.value = 'روشن';
    } else {
      StatusNetwork.value = 'خاموش';
    }
    updatephone('StatusNetwork', StatusNetwork.value);
    //9
    Voltbatry.value = resivesms[8];
    updatephone('Voltbatry', Voltbatry.value);
    //10
    if (resivesms[9] == '1') {
      StatusRelleh.value = 'روشن';
    } else {
      StatusRelleh.value = 'خاموش';
    }
    updatephone('StatusRelleh', StatusRelleh.value);
    inquryall.value = true;
  }

  ///
  ///
  ///
  ///
  ///
  ///
  TextEditingController field_inquryzoon = TextEditingController();
  inquryzoon_1() {
    Get.find<controlleronoff>(tag: 'secend').Inquiryzoon.value = true;
    sendsms('92');
    startfifteensecends();
  }

  inquryzoon_2() {
    Get.find<controlleronoff>(tag: 'secend').Inquiryzoon.value = false;
    Get.snackbar('اطلاعیه', 'اعمال شد');
    List<String> type = ['N', 'O', 'D', 'H', 'G', 'S'];
    List<String> copyzone = Zone.value.split(' ');
    for (var i = 1; i < field_inquryzoon.text.split('*Z').length; i++) {
      for (var j = 1; j < type.length; j++) {
        if (field_inquryzoon.text.split('*Z')[i][1] == type[j]) {
          // j == 1 ? j = 0 : print('hello');
          copyzone[i - 1] = '$j';
        }
      }
    }
    Zone.value = '';
    for (var i = 0; i < copyzone.length; i++) {
      Zone.value = Zone.value + copyzone[i] + (i == 14 ? '' : ' ');

      print(i);
    }
    updatephone('Zone', Zone.value);
    List<String> typezoon = [
      'Normaly close',
      'Normaly Open',
      'دینگ دانگ',
      '24 ساعت',
      'حفاظت',
      'جاسوسی',
      'آبی',
      'حفاظت'
    ];

    for (var i = 0; i < (Zone.value.split(' ').length - 2); i++) {
      zonesdropdown[i] = typezoon[int.parse(Zone.value.split(' ')[i])];
    }
  }
}
