import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/main_controller.dart';
import 'package:food_delivery_app/utils/size.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/font.dart';
import 'detail_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      builder: (MainController controller) {
        return ListView(
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
              height: Get.height / 18,
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
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categoryTab.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectFoodCategory(index);
                        controller.categoryValue(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10),
                        height: 25,
                        child: Text(
                          "${controller.categoryTab[index]}",
                          style: TextStyle(
                              color: (controller.currentCategory == index)
                                  ? AppColor.themeColor
                                  : AppColor.placeholder,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: ScreenSize.height/1.6,
              child: StreamBuilder(
                  stream: (controller.val == 'All')
                      ? FirebaseFirestore.instance
                          .collection('food')
                          .snapshots()
                      : FirebaseFirestore.instance
                          .collection('food')
                          .where('foodCategory', isEqualTo: controller.val)
                          .snapshots(),
                  builder: (context, snapShot) {
                    if (snapShot.hasError) {
                      return const Center(
                        child: Text("Something went Wrong!!"),
                      );
                    } else if (snapShot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColor.themeColor,
                      ));
                    } else {
                      return GridView.builder(
                          itemCount: snapShot.data!.docs.length,
                          //shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.35,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            List data = snapShot.data!.docs;
                            return GestureDetector(
                              onTap: () => Get.to(() => FoodDetails(index: index, food: data[index],)),
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          icon: (data[index]['foodInFavourite'])
                                              ? Icon(CupertinoIcons.heart_fill, color: AppColor.themeColor,)
                                              : const Icon(CupertinoIcons.heart, color: AppColor.placeholder,),
                                          splashRadius: 5,
                                          onPressed: () {}/*controller.updateFavourite(index, data[index]['fav']),*/
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height : 60,
                                        child: Hero(
                                          tag: data[index]['foodImage'],
                                          child: Image.network("${data[index]['foodImage']}"),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Text("${data[index]['foodName']}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("₹ ${data[index]['foodPrice']}",style: AppFont.bodyText1,),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: GestureDetector(
                                                //onTap: () => controller.addCart(context, index, data[index]['cart']),
                                                child: Container(
                                                  height: ScreenSize.height * 0.060,
                                                  width: ScreenSize.width * 0.14,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.themeColor,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                                  ),
                                                  child: const Icon(CupertinoIcons.cart, color: AppColor.placeholderBg,),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      /*Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Text("₹ ${data[index]['foodPrice']}"),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: GestureDetector(
                                          //onTap: () => controller.addCart(context, index, data[index]['cart']),
                                          child: Container(
                                            height: ScreenSize.height * 0.060,
                                            width: ScreenSize.width * 0.14,
                                            decoration: BoxDecoration(
                                              color: AppColor.themeColor,
                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                            ),
                                            child: const Icon(CupertinoIcons.cart, color: AppColor.placeholderBg,),
                                          ),
                                        ),
                                      )*/
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  }),
            ),
          ],
        );
      },
    );
  }
}

