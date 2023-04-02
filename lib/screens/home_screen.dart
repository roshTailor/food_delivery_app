import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/main_controller.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/font.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      builder: (Object controller) {
        return Column(
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
                        width: Get.width / 5,
                        height: Get.height / 10,
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
        );
      },
    );
  }
}
