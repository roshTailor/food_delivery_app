class FoodProduct {
  bool? foodFavourite,foodCart;
  String? foodImage,foodName;
  int? foodPrice,foodQuantity;


  FoodProduct({
    required this.foodCart,
    required this.foodFavourite,
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
    required this.foodQuantity,
  });

  FoodProduct.fromMap(Map<String, dynamic> mapData) {
    foodCart = mapData[foodCart];
    foodFavourite = mapData[foodFavourite];
    foodImage = mapData[foodImage];
    foodName = mapData[foodName];
    foodPrice = mapData[foodPrice];
    foodQuantity = mapData[foodQuantity];
  }

  Map<String,dynamic> toMap()=>{
    'foodCart':foodCart,
    'foodFavourite':foodFavourite,
    'foodImage':foodImage,
    'foodName':foodName,
    'foodPrice':foodPrice,
    'foodQuantity':foodQuantity,

  };
}
