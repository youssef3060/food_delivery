import 'package:flutter/material.dart';

import 'package:food_delivery/pages/button_nav_bar.dart';
import 'package:food_delivery/pages/food_details_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // // SystemChrome.setPreferredOrientations([
  // //   DeviceOrientation.portraitUp,
  // //   DeviceOrientation.portraitDown,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'foodak- food delivery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[100],
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),

        useMaterial3: true,
        dividerTheme: DividerThemeData(thickness: 2, indent: 20, endIndent: 20),
        textTheme: TextTheme(),
      ),
      routes: {
        '/': (context) => const BottonNavBarPage(),
        FoodDetailsPage.routeName: (context) => FoodDetailsPage(),
      },
    );
  }
}
