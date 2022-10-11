import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/food/food_detail.dart';
import 'package:todo_app/screens/food/recommended_food_detail.dart';
import 'package:todo_app/screens/home/main_car_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecommendedFoodDetail(),
      // MainFoodPage(),
    );
  }
}
