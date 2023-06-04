import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/main_car_page.dart';
import 'package:todo_app/utilis/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  int selectedIndex = 0;

  List<Widget> page = [
    MainFoodPage(),
    Container(
      alignment: Alignment.center,
      child: Text('Next Page'),
    ),
    Container(
      alignment: Alignment.center,
      child: Text('Next Next Page'),
    ),
    Container(
      alignment: Alignment.center,
      child: Text('Next Next Next Page'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.buttonBackgroundColor,
        unselectedItemColor: AppColors.iconColor1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), tooltip: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive), tooltip: 'Archive'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout_outlined),
              tooltip: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), tooltip: 'Person')
        ],
      ),
    );
  }
}
