import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/index_controller.dart';
import '../utils/colors.dart';
import '../utils/font.dart';


// ignore: must_be_immutable
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  IndexController homeController = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hey!!",
                  style: AppFont.bodyText,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.shopping_cart,
                    color: AppColor.themeColor,
                  ),
                )
              ],
            ),
            Text(
              "Delivering to",
              style: AppFont.bodyText1,
            ),
            DropdownButtonHideUnderline(
              child: SizedBox(
                width: 250,
                child: DropdownButton(
                  value: "current location",
                  items: const [
                    DropdownMenuItem(
                      value: "current location",
                      child: Text("Current Location"),
                    ),
                  ],
                  icon: Icon(
                    CupertinoIcons.chevron_down,
                    color: AppColor.themeColor,
                  ),
                  style: AppFont.bodyText2,
                  onChanged: (_) {},
                ),
              ),
            ),
            Container(
              height: Get.height / 14,
              width: double.infinity,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: AppColor.placeholderBg,
              ),
              child: TextField(
                decoration: InputDecoration(
                  focusColor: AppColor.themeColor,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: AppColor.themeColor,
                  ),
                  hintText: "Search Your food here",
                  hintStyle: const TextStyle(
                    color: AppColor.placeholder,
                    fontSize: 18,
                  ),
                  contentPadding: const EdgeInsets.only(
                    top: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: Get.width/5,
                        height: Get.height/10,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "food name",
                      style: AppFont.bodyText,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeController.index,
        onTap: homeController.pageIndex,
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
