import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/dashboard.dart';
import 'package:food_delivery_app/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      routes: {
        '/': (context) => const Splash(),
        'HomePage':(context) =>  HomePage(),
      },
    ),
  );
}
