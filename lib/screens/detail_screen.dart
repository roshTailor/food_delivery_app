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

  FoodDetails({Key? key, required this.food})
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(CupertinoIcons.back,
                                color: AppColor.placeholderBg),
                            color: AppColor.placeholderBg.withOpacity(0.2),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: (food['foodInFavourite'])
                                ? const Icon(
                                    CupertinoIcons.heart_fill,
                                    color: AppColor.placeholderBg,
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        height: ScreenSize.height * 0.7,
                        width: ScreenSize.width,
                        decoration: const BoxDecoration(
                          color: AppColor.placeholderBg,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(50)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 80),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(food['foodName'],
                                        style: AppFont.bodyText2),
                                    Text(
                                      "\$ ${food['foodPrice']}",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: AppColor.themeColor,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          constraints: const BoxConstraints(maxWidth: 20),
                                          icon: Icon(
                                            Icons.star_rate_rounded,
                                            color: AppColor.themeColor,
                                          ),
                                          splashRadius: 1,
                                        ),
                                        IconButton(
                                          onPressed: () {},constraints: const BoxConstraints(maxWidth: 20),
                                          icon: Icon(
                                            Icons.star_rate_rounded,
                                            color: AppColor.themeColor,
                                          ),
                                          splashRadius: 1,
                                        ),
                                        IconButton(
                                          onPressed: () {},constraints: const BoxConstraints(maxWidth: 20),
                                          icon: Icon(
                                            Icons.star_rate_rounded,
                                            color: AppColor.themeColor,
                                          ),
                                          splashRadius: 1,
                                        ),
                                        IconButton(
                                          onPressed: () {},constraints: const BoxConstraints(maxWidth: 20),
                                          icon: Icon(
                                            Icons.star_rate_rounded,
                                            color: AppColor.themeColor,
                                          ),
                                          splashRadius: 1,
                                        ),
                                        IconButton(
                                          onPressed: () {},constraints: const BoxConstraints(maxWidth: 20),
                                          icon: const Icon(
                                            Icons.star_rate_rounded,
                                            color: AppColor.placeholder,
                                          ),
                                          splashRadius: 1,
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text("Quantity",style: AppFont.bodyText2,),const SizedBox(width: 20),
                                Center(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () =>
                                              controller.quantityDecrement(
                                                  food.id,
                                                  food['foodQuantity']),
                                          icon: const Icon(
                                            Icons.remove_circle,
                                            color: AppColor.placeholder,size: 40,
                                          )),
                                      Container(
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: AppColor.placeholderBg,width: 1),

                                        ),
                                        child: Text(
                                          "$controller",
                                          style:  TextStyle(
                                              fontSize: 20,
                                              color: AppColor.themeColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () =>
                                              controller.quantityIncrement(
                                                  food.id,
                                                  food['foodQuantity']),
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: AppColor.placeholder,size:40
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "About food",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 6),
                             Text(
                              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. ",
                              style: AppFont.bodyText1,
                            ),const SizedBox(height: 20),
                            InkWell(
                              onTap: () => controller.addCart( food.id, food['foodInCart']),
                              child: Container(
                                height: 55,
                                width: ScreenSize.width,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: (food['foodInCart']==false)?AppColor.themeColor:AppColor.placeholder,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(0, 3))
                                    ]),
                                child:  Text(
                                  "Add to cart",
                                  style: TextStyle(
                                      color: (food['foodInCart']==false)?AppColor.placeholder:AppColor.placeholderBg,
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
                        height: 200,
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
      backgroundColor: AppColor.themeColor.withOpacity(0.7),
    );
  }
}
