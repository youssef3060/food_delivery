import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/widgets/custom_back_button.dart';
import 'package:food_delivery/widgets/favorite_button.dart';
import 'package:food_delivery/widgets/food_details/food_item_counter.dart';
import 'package:food_delivery/widgets/food_details/property_item.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({super.key});

  static const String routeName = '/-food-details';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final FoodDetailsArgs FoodArgs =
        ModalRoute.of(context)!.settings.arguments as FoodDetailsArgs;
    final foodIndex = FoodArgs.foodIndex;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    leading: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomBackButton(
                        onTap:
                            () => Navigator.of(
                              context,
                            ).pop<String>(food[foodIndex].name.toString()),
                        width: size.width * 0.1,
                        height: size.height * 0.1,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FavoriteButton(
                          foodIndex: foodIndex,
                          width: size.width * .09,
                          height: size.height * .05,
                        ),
                      ),
                    ],

                    expandedHeight: size.height * .4,
                    flexibleSpace: FlexibleSpaceBar(
                      background: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey[400]),
                        child: Image.network(
                          food[foodIndex].imgUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            food[foodIndex].name,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.headlineSmall!.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            "Buffalo burger",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge!.copyWith(
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                      FoodItemCounter(foodIndex: foodIndex),
                                    ],
                                  ),
                                  const SizedBox(height: 32.0),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PropertyItem(
                                          propertyName: 'Size',
                                          propertyValue: 'Medium',
                                        ),
                                        VerticalDivider(
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                        PropertyItem(
                                          propertyName: 'Calories',
                                          propertyValue: '150KCal',
                                        ),
                                        VerticalDivider(
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                        PropertyItem(
                                          propertyName: 'Cocking',
                                          propertyValue: '10-20 min',
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem lorem Ibsem ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.grey[600]),
                                  ),
                                  SizedBox(height: 32.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    '\$ ${food[foodIndex].price}',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 46.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('ChecK Out'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
