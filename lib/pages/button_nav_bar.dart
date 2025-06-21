import 'package:flutter/material.dart';
import 'package:food_delivery/pages/account_page.dart';
import 'package:food_delivery/pages/favorites_page.dart';
import 'package:food_delivery/pages/home_page.dart';

class BottonNavBarPage extends StatefulWidget {
  const BottonNavBarPage({super.key});

  @override
  State<BottonNavBarPage> createState() => _BottonNavBarPageState();
}

class _BottonNavBarPageState extends State<BottonNavBarPage> {
  int selectedIndex = 0;
  void onItemTapped(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  List<Widget> bodyOptions = [HomePage(), FavoritesPage(), AccountPage()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color.fromARGB(246, 255, 255, 255),
        drawer: Drawer(),
        appBar: AppBar(
          // foregroundColor: Colors.black,
          // elevation: 0,
          title: Center(child: const Text("Foodak")),
        ),
        body: bodyOptions[selectedIndex],

        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'favorite',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 255, 182, 160),
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
