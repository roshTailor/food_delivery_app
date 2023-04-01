import 'package:get/get.dart';

class IndexController extends GetxController {
  int index = 0;

  void pageIndex(int val) {
    index= val;
    update();
  }
}