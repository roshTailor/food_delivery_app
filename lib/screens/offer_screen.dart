import 'package:flutter/material.dart';

import '../Utils/size.dart';
import '../utils/font.dart';

class Offer extends StatelessWidget {
  const Offer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: ScreenSize.height,
      child: Text("No Offer",
        style:AppFont.bodyText3,
      ),
    );
  }
}