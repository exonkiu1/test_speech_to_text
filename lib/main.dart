import '/Getxcontroller/mybinding.dart';
import '/Pages/Half%20On%20.dart';
import '/Pages/HomePage.dart/HomePage.dart';
import '/Pages/Relleh/Relleh.dart';
import '/Pages/add%20device.dart';
import '/Pages/splashscreen.dart';
import '/testpage/home%20page%201%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

//flutter build apk --split-per-abi
void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
//  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      /*  theme: /*  ThemeData(
          scaffoldBackgroundColor: 
          Color.fromARGB(255, 152, 189, 217),

          

          ), */
          // Color.fromARGB(255, 48, 8, 11)
          ThemeData.dark().copyWith(
        scaffoldBackgroundColor:
            // Color.fromARGB(255, 27, 90, 103)
            Color.fromARGB(255, 34, 33, 33),
      ), */
      //
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:
            // Color.fromARGB(255, 27, 90, 103)
            Color.fromARGB(255, 34, 34, 34),
      ),

      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor:
            // Color.fromARGB(255, 27, 90, 103)
            // Color.fromARGB(255, 222, 246, 255),
            Color.fromARGB(255, 252, 255, 222),
        // Color.fromARGB(255, 255, 251, 222),
      ),
      home: HomePage1(),
      initialBinding: mybinding(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // GoToHomePage();
    // TODO: implement initState
    super.initState();
  }

  GoToHomePage() async {
    await Future.delayed(Duration(seconds: 2));
    Get.to(HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: mybinding(),
        /*  darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:
              // Color.fromARGB(255, 27, 90, 103)
              Color.fromARGB(255, 34, 34, 34),
        ), */
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor:
              // Color.fromARGB(255, 27, 90, 103)
              Color.fromARGB(255, 220, 206, 206),
        ),
        home: Splashscreen()
        /* Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 200,
                ),
                Text(
                  'Home Alarm',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ) */
        );
  }
}
