import 'package:flutter/foundation.dart';

class FoodItem {
  final String name;
  final String imgUrl;
  final double price;
  final bool isfavorite;
  final String categoryID;

  FoodItem(this.categoryID, {
    required this.name,
    required this.imgUrl,
    required this.price,  
    this.isfavorite = false,
  });
  FoodItem copyWith({
    String? categoryID,
    String? name,
    String? imgUrl,
    double? price,
    bool? isfavorite,
  }) {
    return FoodItem(
      categoryID ?? this.categoryID,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      isfavorite: isfavorite ?? this.isfavorite,
    );
  }
}

List<FoodItem> food = [
  FoodItem(
    '1',
    name: 'Beef bruger',
    imgUrl:
        'https://www.freepnglogos.com/uploads/burger-png/burger-png-beef-raised-without-hormones-steroids-guarantee-6.png',
    price: 8.5,
  ),
  FoodItem(
    '1',
    name: 'Chicken bruger',
    imgUrl:
        'https://www.freepnglogos.com/uploads/fried-chicken-png/fried-chicken-jci-grill-james-coney-island-food-menu-sandwiches-37.png',
    price: 4.5,
  ),
  FoodItem(
    '1',
    name: 'Cheese bruger',
    imgUrl:
        'https://www.freepnglogos.com/uploads/burger-png/burger-king-whopper-with-cheese-png-image-purepng-20.png',
    price: 5.5,
  ),
  FoodItem(
    '2',
    name: 'Chicken pizza',
    imgUrl:
        'https://www.freepnglogos.com/uploads/pizza-png/pizza-images-download-pizza-19.png',
    price: 6.5,
  ),
  FoodItem(
    '2',
    name: 'Meet pizza',
    imgUrl:
        'https://www.freepnglogos.com/uploads/pizza-png/pepperoni-pizza-image-cuginos-pizzeria-35.png',
    price: 7.5,
  ),
  FoodItem(
    '3',
    name: 'Pasta',
    imgUrl:
        'https://www.freepnglogos.com/uploads/pasta-png/pasta-was-shocked-why-health-advocates-want-calorie-counts-21.png',
    price: 9.5,
  ),
];
