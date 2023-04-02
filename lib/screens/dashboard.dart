import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/profile_screen.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';
import '../utils/colors.dart';
import '../utils/font.dart';
import 'cart_screen.dart';
import 'fav_screen.dart';


// ignore: must_be_immutable
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        child: IndexedStack(
          index: mainController.index,
          children:  [
            HomePage(),
            const Favourite(),
            const Cart(),
            const Profile()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainController.index,
        onTap: mainController.pageIndex,
        unselectedItemColor: Colors.black.withOpacity(0.7),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.themeColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.house_fill),
            icon: Icon(CupertinoIcons.home),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.tag_fill),
            icon: Icon(CupertinoIcons.tag),
            label: "Offers",
            tooltip: "Offers",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.cart_fill),
            icon: Icon(CupertinoIcons.cart),
            label: "Cart",
            tooltip: "Cart",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.heart_fill),
            icon: Icon(CupertinoIcons.heart),
            label: "Like",
            tooltip: "Like",
          ),
        ],
      ),
    );
  }
}
