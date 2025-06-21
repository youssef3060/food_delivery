import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/utilities/app_assets';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final favoriteFood =
        food.where((foodItems) => foodItems.isfavorite == true).toList();
    final isLandEscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (favoriteFood.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset(
              AppAssets.favoritesImage,
              height: size.height * .4,
              width: size.width * 1,
            ),
            Text(
              'No favorites was added !',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: favoriteFood.length,
        itemBuilder:
            (context, index) => InkWell(
              onTap: () {
                int targetedIndex = food.indexOf(favoriteFood[index]);
                Navigator.of(context)
                    .pushNamed(
                      FoodDetailsPage.routeName,
                      arguments: FoodDetailsArgs(foodIndex: targetedIndex),
                    )
                    .then((value) {
                      setState(() {});
                      debugPrint('the value of $value');
                    });
              },

              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(
                        favoriteFood[index].imgUrl,
                        height:
                            isLandEscape ? size.height * .3 : size.height * .1,
                        width:
                            isLandEscape ? size.height * .3 : size.width * .2,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favoriteFood[index].name,
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),

                            Text(
                              "\$${favoriteFood[index].price}",
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(color: Colors.deepOrange),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          final targetItem = favoriteFood[index];

                          int targetIndex = food.indexOf(targetItem);

                          setState(() {
                            food[targetIndex] = food[targetIndex].copyWith(
                              isfavorite: false,
                            );
                            favoriteFood.remove(targetItem);
                          });
                        },

                        icon: Icon(
                          Icons.favorite,
                          color: Colors.deepOrange,
                          size: isLandEscape ? 50 : 30,
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
