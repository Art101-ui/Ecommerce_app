import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/controllers/productControllers.dart';
import 'package:todo_app/data/controllers/recommendedControllers.dart';
import 'package:todo_app/helpers/dependencies.dart' as dep;
import 'package:todo_app/screens/cart/cart_page.dart';
import 'package:todo_app/screens/home/main_car_page.dart';
import 'package:todo_app/screens/routes/routes_help.dart';

void main() async {
  // To make sure dependencies are loaded first
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ProductControllers>().getRepoList();
    Get.find<RecommendedControllers>().getRepoList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
      initialRoute: RoutesHelper.initial,
      getPages: RoutesHelper.getPage,
      // MainFoodPage(),
    );
  }
}
