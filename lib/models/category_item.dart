import 'package:food_delivery/utilities/app_assets';

class CategoryItem {
  final String id;
  final String tittle;
  final String imaPath;

  CategoryItem({required this.id, required this.tittle, required this.imaPath});
}

final List<CategoryItem> categories = [
  CategoryItem(id: '1', tittle: 'Burger', imaPath: AppAssets.burgerIcon),
  CategoryItem(id: '2', tittle: 'pizza', imaPath: AppAssets.pizzaIcon),
  CategoryItem(id: '3', tittle: 'pasta', imaPath: AppAssets.pasta),
 
];
