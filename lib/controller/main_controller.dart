import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../screens/cart_screen.dart';
import '../screens/fav_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

class MainController extends GetxController {
  static MainController mainController = Get.put(MainController());

  //CollectionReference favouriteFood = FirebaseFirestore.instance.collection('favouriteFood');
  int index = 0;
  int currentCategory = 0;
  List categoryTab = [
    "All",
    "Fast Food",
    "Gujarati",
    "North Indian",
    "South Indian",
    "Street Food",
    "Chinese",
    "Coffee",
    "Desert",
  ];

  pageIndex(int val) {
    index = val;
    print(index);
    update();
  }

  String val = 'All';

  categoryValue(int index) {
    switch (index) {
      case 0:
        val = "All";
        break;
      case 1:
        val = "Fast Food";
        break;
      case 2:
        val = "Gujarati";
        break;
      case 3:
        val = "North Indian";
        break;
      case 4:
        val = "South Indian";
        break;
      case 5:
        val = "Street Food";
        break;
      case 6:
        val="Chinese";
        break;
      case 7:
        val = "Coffee";
        break;
      case 8:
        val = "Desert";
        break;
    }
    update();
  }

  selectFoodCategory(int val) {
    currentCategory = val;

    update();
  }

  quantityIncrement(int index, int qty) async {
    if (qty > 0) qty++;
    CollectionReference food = FirebaseFirestore.instance.collection('food');
    var docSnap = await food.get();
    var docId = docSnap.docs;
    update();
    return food
        .doc(docId[index].id)
        .update({'foodQuantity': qty})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }

  quantityDecrement(int index, int qty) async {
    if (qty > 1) qty--;
    CollectionReference food = FirebaseFirestore.instance.collection('food');
    var doc_snap = await food.get();
    var doc_id = doc_snap.docs;
    update();
    return food
        .doc(doc_id[index].id)
        .update({'foodQuantity': qty})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }

/*updateFavourite(int index, bool val) async {
    CollectionReference foods = FirebaseFirestore.instance
        .collection('foodsProduct')
        .doc(HomeController.homeController.category.value)
        .collection(HomeController.homeController.category.value);
    var doc_snap = await foods.get();
    var doc_id = doc_snap.docs;
    return foods
        .doc(doc_id[index].id)
        .update({'fav': !val})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }

  insertFoodFav(QueryDocumentSnapshot data) async {
    var doc_snap = await favouriteFood.get();
    var doc_id = doc_snap.docs;
    if(data['fav'] == false) {
      Food food = Food(name: data['name'], img: data['img'], price: data['price'], qty: data['qty'], cart: data['cart'], fav: data['fav']);
      for(int i = 0 ; i < doc_id.length ; i++) {
        if(doc_id[i]['name'] != data['name']) {
          return favouriteFood
              .add(food.toMap())
              .then((value) => print("Value Added..."))
              .catchError((error) => print("Error :: $error"));
        }
      }
    }
  }*/
}
