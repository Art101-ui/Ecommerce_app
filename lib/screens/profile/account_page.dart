import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/account_widget.dart';
import 'package:todo_app/widgets/app_icon.dart';
import 'package:todo_app/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: 'Profile',
          color: Colors.white,
          size: Dimensions.height25,
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
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
                        text: 'Farouk',
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
                        text: '+2349073650735',
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
                        text: 'badmusfarouk399@gmail.com',
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
                        text: 'Farouk',
                      )),
                ],
              ),
            ))

            // profile name
          ],
        ),
      ),
    );
  }
}
