import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import 'home_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 4),
          () => Get.off(() =>  HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.themeColor,
      body: Center(
        child: Image.asset(
          "assets/image/logo.png",
        ),
      ),
    );
  }
}
