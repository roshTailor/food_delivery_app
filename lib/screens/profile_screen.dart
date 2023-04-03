import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/font.dart';
import 'package:food_delivery_app/utils/size.dart';

import '../utils/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: ScreenSize.height,
          width: ScreenSize.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    "Profile",
                    style: AppFont.bodyText3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(CupertinoIcons.person_alt_circle,size: 80,),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.edit),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Edit Profile",
                        style: AppFont.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hi there Roshni!",
                    style: AppFont.bodyText
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InputForm(
                    label: "Name",
                    value: "Roshni Lungiwala",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputForm(
                    label: "Email",
                    value: "roshTailor@gmail.com",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputForm(
                    label: "Mobile No",
                    value: "2356489544",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputForm(
                    label: "Address",
                    value: "No 23, 6th Lane, Colombo 03",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputForm(
                    label: "Password",
                    value: "#******#",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputForm(
                    label: "Confirm Password",
                    value: "#******#",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
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
                    child:  const Text(
                      "Save ",
                      style: TextStyle(
                          color: AppColor.placeholderBg,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget InputForm({required String label,
required String value,}){
  return Container(
    width: double.infinity,
    height: 60,
    padding: const EdgeInsets.only(left: 20),
    decoration:  BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColor.placeholderBg,
    ),
    child: TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: label,
        contentPadding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
      ),
      initialValue: value,
      style: AppFont.bodyText1,
    ),
  );
}
