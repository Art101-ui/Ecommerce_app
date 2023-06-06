import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/controllers/productControllers.dart';
import 'package:todo_app/data/controllers/recommendedControllers.dart';
import 'package:todo_app/screens/routes/routes_help.dart';
import 'package:todo_app/utilis/dimensions.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  Future<void> _loadResources() async {
    await Get.find<ProductControllers>().getRepoList();
    await Get.find<RecommendedControllers>().getRepoList();
  }

  @override
  void initState() {
    _loadResources();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);

    Timer(Duration(seconds: 3), () => Get.offNamed(RoutesHelper.getinitial()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Image.asset(
                'assets/images/onboarding.png',
              )),
          Center(
            child: Image.asset(
              'assets/images/best.png',
              width: Dimensions.onboard,
            ),
          )
        ],
      ),
    );
  }
}
