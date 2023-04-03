import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/cart_screen.dart';
import '../screens/fav_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../utils/colors.dart';

class MainController extends GetxController {
  static MainController mainController = Get.put(MainController());
  CollectionReference food = FirebaseFirestore.instance.collection('food');
  int index = 0;
  int currentCategory = 0;
  List categoryTab = [
    "All",
    "Fast Food",
    "Gujarati",
    "North Indian",
    "South Indian",
    "Street Food",
    "Chinese",
    "Coffee",
    "Desert",
  ];

  pageIndex(int val) {
    index = val;
    print(index);
    update();
  }

  String val = 'All';

  categoryValue(int index) {
    switch (index) {
      case 0:
        val = "All";
        break;
      case 1:
        val = "Fast Food";
        break;
      case 2:
        val = "Gujarati";
        break;
      case 3:
        val = "North Indian";
        break;
      case 4:
        val = "South Indian";
        break;
      case 5:
        val = "Street Food";
        break;
      case 6:
        val="Chinese";
        break;
      case 7:
        val = "Coffee";
        break;
      case 8:
        val = "Desert";
        break;
    }
    update();
  }

  selectFoodCategory(int val) {
    currentCategory = val;

    update();
  }
  quantityIncrement(String index, int qty) async {
    if (qty > 0) qty++;
    update();
    return food
        .doc(index)
        .update({'foodQuantity': qty})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }

  quantityDecrement(String index, int qty) async {
    if (qty > 1) qty--;
    update();
    return food
        .doc(index)
        .update({'foodQuantity': qty})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }
  addCart(String id, bool val) {
    snackBar(context) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: !val?const Text("Added to cart"):const Text("Removed from cart"),
        backgroundColor: AppColor.themeColor,
      ));
    }
    update();
    return food
        .doc(id)
        .update({'foodQuantity': 1, 'foodInCart': !val,})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }

  updateFavourite(String id, bool val) {
    update();
    return food
        .doc(id)
        .update({'foodInFavourite': !val})
        .then((value) => print("Added to favourite"))
        .catchError((error) => print("Error :: $error"));
  }
}