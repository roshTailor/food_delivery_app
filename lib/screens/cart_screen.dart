import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/main_controller.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/font.dart';
import 'package:get/get.dart';

import '../Utils/size.dart';
import 'detail_screen.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MainController(),
        builder: (MainController controller) {
          return Center(
            child: Column(
              children: [
                Text(
                  "My Cart",
                  style: AppFont.bodyText3,
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('food').where('foodInCart', isEqualTo: true,).snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(child: Text("Something went Wrong!!"),);
                        } else if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator(color: AppColor.themeColor,));
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              List data = snapshot.data!.docs;
                              if (data[index]['foodInCart']) {
                                return GestureDetector(
                                  onTap: () => Get.to(() => FoodDetails(food: snapshot.data!.docs[index])),
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      height: ScreenSize.height * 0.1,
                                      width: ScreenSize.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width: 90,
                                              child: Hero(
                                                tag: data[index]['foodImage'],
                                                child: Image.network(
                                                  data[index]['foodImage'],
                                                  height: 60,
                                                ),
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${data[index]['foodName']}",
                                              ),
                                              Text(
                                                "₹ ${data[index]['foodPrice'] * data[index]['foodQuantity']}",
                                                style: AppFont.bodyText,
                                              ),
                                              Text(
                                                "Qty: ${data[index]['foodQuantity']}",
                                                style: AppFont.bodyText1,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () => controller.addCart(
                                                    snapshot.data!.docs[index].id,
                                                    data[index]['foodInCart']),
                                                child: Icon(
                                                  CupertinoIcons.delete,
                                                  size: 22,
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () =>
                                                        controller.quantityDecrement(
                                                            snapshot.data!.docs[index].id,
                                                            data[index]['foodQuantity']),
                                                    child: Icon(
                                                      Icons.remove_circle,
                                                      color: AppColor.themeColor,
                                                    ),
                                                  ),
                                                  Text(" ${data[index]['foodQuantity']} "),
                                                  GestureDetector(
                                                    onTap: () =>
                                                        controller.quantityIncrement(
                                                            snapshot.data!.docs[index].id,
                                                            data[index]['foodQuantity']),
                                                    child: Icon(
                                                      CupertinoIcons
                                                          .add_circled_solid,
                                                      color: AppColor.themeColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        }
                      }),
                ),
              ],
            ),
          );
        });
  }
}