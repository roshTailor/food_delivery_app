import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController mainController = Get.put(MainController());
  CollectionReference favouriteFood = FirebaseFirestore.instance.collection('favouriteFood');
  int index = 0;
  String category = "All";
  pageIndex(int val) {

    index= val;
    update();
  }
  selectFoodCategory(String val) {
    category = val;
    update();
  }

  updateFavourite(int index, bool val) async {
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
  }
}