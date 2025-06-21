class FoodItem {
  final String id;
  final String name;
  final String imgUrl;
  final double price;
  final bool isfavorite;
  final String categoryID;

  FoodItem(
    this.categoryID, {
      required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
    this.isfavorite = false,
  });
  FoodItem copyWith({
    String? categoryID,
    String ? id,
    String? name,
    String? imgUrl,
    double? price,
    bool? isfavorite,
  }) {
    return FoodItem(
      categoryID ?? this.categoryID,
       id: id?? this.id,
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
    id: 'burger 1',
  ),
  FoodItem(
    '1',
    name: 'Chicken bruger',
    imgUrl:
        'https://www.freepnglogos.com/uploads/fried-chicken-png/fried-chicken-jci-grill-james-coney-island-food-menu-sandwiches-37.png',
    price: 4.5,
    id: 'burger 2',
  ),
  FoodItem(
    '1',
    name: 'Cheese bruger',
    imgUrl:
        'https://www.freepnglogos.com/uploads/burger-png/burger-king-whopper-with-cheese-png-image-purepng-20.png',
    price: 5.5,
    id: 'burger 3',
  ),
  FoodItem(
    '2',
    name: 'Chicken pizza',
    imgUrl:
        'https://www.freepnglogos.com/uploads/pizza-png/pizza-images-download-pizza-19.png',
    price: 6.5,
    id: 'pizza 1',
  ),
  FoodItem(
    '2',
    name: 'Meet pizza',
    imgUrl:
        'https://www.freepnglogos.com/uploads/pizza-png/pepperoni-pizza-image-cuginos-pizzeria-35.png',
    price: 7.5,
    id: 'pizza 2',
  ),
  FoodItem(
    '3',
    name: 'Pasta',
    imgUrl:
        'https://www.freepnglogos.com/uploads/pasta-png/pasta-was-shocked-why-health-advocates-want-calorie-counts-21.png',
    price: 9.5,
    id: 'pasta 1',
  ),
];
