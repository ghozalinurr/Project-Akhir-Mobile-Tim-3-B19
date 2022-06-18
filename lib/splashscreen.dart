import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamob/getstarted.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Get.to(MainPage());
    });
  }

  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF016170),
      body: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              child: Image.asset(
                "assets/logomob.png",
                width: lebar / 2,
                height: tinggi / 2,
              ),
            ),
            Text(
              "Tips App",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
              ),
            ),
            Text(
              "\nTIM 3",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
