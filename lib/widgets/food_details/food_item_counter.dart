import 'package:flutter/material.dart';

class FoodItemCounter extends StatefulWidget {
  const FoodItemCounter({super.key, required int foodIndex});

  @override
  State<FoodItemCounter> createState() => _FoodItemCounterState();
}

class _FoodItemCounterState extends State<FoodItemCounter> {
  int counter = 1;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            InkWell(
              onTap: decrementCounter,
              child: Text(
                "-",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: counter > 1 ? Colors.black : Colors.grey,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: incrementCounter,
              child: Text(
                '+',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
