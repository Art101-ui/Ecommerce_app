import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_app/base/custom_loader.dart';
import 'package:todo_app/data/controllers/authControllers.dart';
import 'package:todo_app/data/controllers/cartControllers.dart';
import 'package:todo_app/data/controllers/userControllers.dart';
import 'package:todo_app/screens/routes/routes_help.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/account_widget.dart';
import 'package:todo_app/widgets/app_icon.dart';
import 'package:todo_app/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool userLoggedIn = Get.find<AuthController>().isuserLoggedIn();
    print(userLoggedIn);
    if (userLoggedIn) {
      Get.find<UserController>().getProfile();
      print('User has logged in');
    }
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: 'Profile',
          color: Colors.white,
          size: Dimensions.height25,
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        return userLoggedIn
            ? (userController.isLoading
                ? Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                        left: Dimensions.height20,
                        right: Dimensions.height20,
                        top: Dimensions.height20,
                        bottom: Dimensions.height20),
                    child: Column(
                      children: [
                        AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimensions.height25 * 3,
                          iconcolor: Colors.white,
                          size: Dimensions.height30 * 5,
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.person,
                                    backgroundColor: AppColors.mainColor,
                                    iconSize: Dimensions.height20,
                                    iconcolor: Colors.white,
                                    size: Dimensions.height10 * 4,
                                  ),
                                  bigText: BigText(
                                    text: userController.userModel.name,
                                  )),
                              SizedBox(
                                height: Dimensions.height30,
                              ),
                              // phone number
                              AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.phone,
                                    backgroundColor: Colors.blueAccent,
                                    iconSize: Dimensions.height20,
                                    iconcolor: Colors.white,
                                    size: Dimensions.height10 * 4,
                                  ),
                                  bigText: BigText(
                                    text: userController.userModel.phone,
                                  )),
                              SizedBox(
                                height: Dimensions.height30,
                              ),
                              // email
                              AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.email,
                                    backgroundColor: Colors.purple,
                                    iconSize: Dimensions.height20,
                                    iconcolor: Colors.white,
                                    size: Dimensions.height10 * 4,
                                  ),
                                  bigText: BigText(
                                    text: userController.userModel.email,
                                  )),
                              SizedBox(
                                height: Dimensions.height30,
                              ),
                              // address
                              AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.location_on,
                                    backgroundColor: Colors.green,
                                    iconSize: Dimensions.height20,
                                    iconcolor: Colors.white,
                                    size: Dimensions.height10 * 4,
                                  ),
                                  bigText: BigText(
                                    text: 'Fill in your address',
                                  )),
                              SizedBox(
                                height: Dimensions.height30,
                              ),
                              // message
                              AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.message_outlined,
                                    backgroundColor: Colors.redAccent,
                                    iconSize: Dimensions.height20,
                                    iconcolor: Colors.white,
                                    size: Dimensions.height10 * 4,
                                  ),
                                  bigText: BigText(
                                    text: 'Messages',
                                  )),
                              SizedBox(
                                height: Dimensions.height30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (Get.find<AuthController>()
                                      .isuserLoggedIn()) {
                                    Get.find<AuthController>().clearData();
                                    Get.find<CartControllers>().clear();
                                    Get.find<CartControllers>()
                                        .clearCartHistory();
                                    Get.offNamed(RoutesHelper.getloginPage());
                                  } else {
                                    print('You are logged in');
                                  }
                                },
                                child: AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.logout,
                                      backgroundColor: Colors.redAccent,
                                      iconSize: Dimensions.height20,
                                      iconcolor: Colors.white,
                                      size: Dimensions.height10 * 4,
                                    ),
                                    bigText: BigText(
                                      text: 'LogOut',
                                    )),
                              ),
                            ],
                          ),
                        ))

                        // profile name
                      ],
                    ),
                  )
                : CustomLoader())
            : Container(
                child: Center(child: BigText(text: 'You are not logged in')),
              );
      }),
    );
  }
}
