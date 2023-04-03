import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/dashboard.dart';
import 'package:food_delivery_app/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      routes: {
        '/': (context) => const Splash(),
        'HomePage': (context) => DashBoard(),
      },
    ),
  );
}
