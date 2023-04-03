import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/main_controller.dart';
import 'package:food_delivery_app/utils/size.dart';
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
            ),
            SizedBox(
              height: ScreenSize.height * 0.50,
              child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection('food').snapshots(),
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.25,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            List data = snapShot.data!.docs;
                            if (data[index]['foodCategory'] == 'Fruits') {
                              return Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data[index]['foodName']),
                                      Text(data[index]['foodCategory'])
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
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

/*ListView(
                        children: snapShot.data!.docs.map((e) {
                          Map<String, dynamic> data =
                          e.data();
                          if(data['foodCategory']=='FastFood'){
                            return ListTile(
                              title: Text(data['foodName']),
                              subtitle: Text(data['foodCategory']),
                            );
                          }
                          else{
                            return Container();
                          }
                        }).toList(),
                      );*/
