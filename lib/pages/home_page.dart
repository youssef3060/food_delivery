//dart pac
// import 'dart:io';

// flutter

// external

// internal

import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/utilities/app_assets';
import '../widgets/food_grid_item.dart';
import '../models/food_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? categoryChoseID;
  late List<FoodItem> filteredFood;
  bool enableCategoryFilter = false;

  @override
  void initState() {
    super.initState();
    filteredFood = food;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandEscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                AppAssets.bannerPic,
                height: isLandEscape ? size.height * .5 : size.height * .23,
                width: isLandEscape ? size.height * 2 : size.height * .50,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: size.height * .05),
            SizedBox(
              height: size.height * .13,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder:
                    (BuildContext context, int index) => InkWell(
                      onTap: () {
                        setState(() {
                          if (categoryChoseID == categories[index].id ||
                              !enableCategoryFilter) {
                            enableCategoryFilter = !enableCategoryFilter;
                          }
                          if (enableCategoryFilter) {
                            categoryChoseID = categories[index].id;
                            filteredFood =
                                food
                                    .where(
                                      (item) =>
                                          item.categoryID == categoryChoseID,
                                    )
                                    .toList();
                          } else {
                            categoryChoseID = null;
                            filteredFood = food;
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 16.0),
                        child: Container(
                          width: size.width * .2,

                          decoration: BoxDecoration(
                            color:
                                categoryChoseID == categories[index].id
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset(categories[index].imaPath),
                                const SizedBox(height: 6),
                                Text(
                                  categories[index].tittle,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium!.copyWith(
                                    color:
                                        categoryChoseID == categories[index].id
                                            ? Colors.white
                                            : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              ),
            ),
            SizedBox(height: size.height * .05),

            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filteredFood.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandEscape ? 4 : 2,
                mainAxisSpacing: size.height * .02,
                crossAxisSpacing: size.height * .02,
              ),
              itemBuilder:
                  (BuildContext context, int index) => InkWell(
                    splashColor: const Color.fromARGB(255, 223, 169, 153),
                    onTap: () {
                      final targetedFoodItem = food.firstWhere(
                        (item) => item.id == filteredFood[index].id,
                      );
                      final targetedIndex = food.indexOf(targetedFoodItem);
                      Navigator.of(context)
                          .pushNamed(
                            FoodDetailsPage.routeName,
                            arguments: FoodDetailsArgs(
                              foodIndex: targetedIndex,
                            ),
                          )
                          .then((value) {
                            filteredFood = food;
                            categoryChoseID = null;
                            setState(() {});
                            debugPrint('the value of $value');
                          });
                    },
                    child: FoodGridItem(
                      foodIndex: index,
                      filteredFood: filteredFood,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
