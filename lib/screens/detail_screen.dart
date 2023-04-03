import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/main_controller.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/font.dart';
import 'package:food_delivery_app/utils/size.dart';
import 'package:get/get.dart';

class FoodDetails extends StatelessWidget {
  QueryDocumentSnapshot food;
  int index;

  FoodDetails({Key? key, required this.food, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
            init: MainController(),
            builder: (MainController controller) {
              return SizedBox(
                height: ScreenSize.height,
                width: ScreenSize.width,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(CupertinoIcons.back,
                                color: AppColor.placeholderBg),
                            color: AppColor.placeholderBg.withOpacity(0.2),
                          ),
                          const Text(
                            "Food Details",
                            style: TextStyle(
                                fontSize: 18, color: AppColor.placeholderBg),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: (food['foodInFavourite'])
                                ? Icon(
                                    CupertinoIcons.heart_fill,
                                    color: AppColor.themeColor,
                                  )
                                : const Icon(
                                    CupertinoIcons.heart,
                                    color: AppColor.placeholderBg,
                                  ),
                            color: AppColor.placeholderBg.withOpacity(0.2),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        height: ScreenSize.height * 0.7,
                        width: ScreenSize.width,
                        decoration: const BoxDecoration(
                          color: AppColor.placeholderBg,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 100),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food['foodName'],
                                      style: AppFont.bodyText1
                                    ),
                                    Text(
                                      "\$ ${food['foodPrice']}",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: AppColor.themeColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  width: ScreenSize.width * 0.3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.themeColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            spreadRadius: 0.5,
                                            blurRadius: 2,
                                            offset: const Offset(0, 3))
                                      ]),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                            onPressed: () =>
                                                controller.quantityDecrement(
                                                    index, food['foodQuantity']),
                                            icon: const Icon(
                                              Icons.remove,
                                              color: AppColor.placeholderBg,
                                            )),
                                        Text(
                                          "${food['foodQuantity']}",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: AppColor.placeholderBg,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                            onPressed: () =>
                                                controller.quantityIncrement(
                                                    index, food['foodQuantity']),
                                            icon: const Icon(
                                              Icons.add,
                                              color: AppColor.placeholderBg,
                                            )),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "⌚ 20 Min",
                                  style: TextStyle(
                                      color: AppColor.placeholderBg, fontSize: 16),
                                ),
                                Text(
                                  "🔥 100 Kcal",
                                  style: TextStyle(
                                      color: AppColor.placeholderBg, fontSize: 16),
                                ),
                                Text(
                                  "⭐ 4.5",
                                  style: TextStyle(
                                      color: AppColor.placeholderBg, fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "About food",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const Text(
                              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. ",
                              style: TextStyle(color: AppColor.placeholderBg),
                            ),
                            const Spacer(),
                            InkWell(
                              // onTap: () => controller.addCart(
                              //     context, index, food['cart']),
                              child: Container(
                                height: 55,
                                width: ScreenSize.width,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.themeColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(0, 3))
                                    ]),
                                child: const Text(
                                  "Add to cart",
                                  style: TextStyle(
                                      color: AppColor.placeholderBg,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: ScreenSize.width * 0.20,
                      top: ScreenSize.height * 0.13,
                      child: Container(
                        alignment: Alignment.center,
                        height: 160,
                        child: Hero(
                          tag: food['foodImage'],
                          child: Image.network("${food['foodImage']}"),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      backgroundColor: AppColor.themeColor,
    );
  }
}
