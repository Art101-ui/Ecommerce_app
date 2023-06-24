import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/app_text.dart';
import 'package:todo_app/widgets/big_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();

    var signUpMethods = [
      'f.png',
      'google.png',
      't.png',
    ];

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: Dimensions.screenHeight * 0.05,
          ),
          // app logo
          SizedBox(
            height: Dimensions.screenHeight * 0.25,
            child: Center(child: Image.asset('assets/images/onboarding.png')),
          ),
          SizedBox(
            height: Dimensions.height15,
          ),

          // username
          AppText(
              controller: usernameController,
              hintText: 'Username',
              iconData: Icons.person,
              color: AppColors.mainColor),
          SizedBox(
            height: Dimensions.height15,
          ),

          // email
          AppText(
              controller: emailController,
              hintText: 'Email',
              iconData: Icons.email_outlined,
              color: Colors.purple),
          SizedBox(
            height: Dimensions.height15,
          ),

          // password
          AppText(
              controller: passwordController,
              hintText: 'Password',
              iconData: Icons.password,
              color: Colors.greenAccent),
          SizedBox(
            height: Dimensions.height15,
          ),
          AppText(
              controller: phoneController,
              hintText: 'Phone',
              iconData: Icons.phone,
              color: Colors.blueAccent),
          SizedBox(
            height: Dimensions.height20,
          ),
          Container(
            width: Dimensions.screenWidth / 2,
            height: Dimensions.screenHeight / 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.mainColor),
            child: Center(
              child: BigText(
                text: 'Sign Up',
                size: Dimensions.font20 + 5,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: 'Already have an account? Log in ',
                  style: TextStyle(
                      color: Colors.grey, fontSize: Dimensions.font16))),
          SizedBox(
            height: Dimensions.height10,
          ),
          RichText(
              text: TextSpan(
                  text: 'or Continue with ',
                  style: TextStyle(
                      color: Colors.grey, fontSize: Dimensions.font16))),
          Wrap(
            direction: Axis.horizontal,
            children: List.generate(
                signUpMethods.length,
                (index) => Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Image.asset(
                        'assets/images/' + signUpMethods[index],
                        height: Dimensions.height45 * 1.7,
                        width: Dimensions.width45 * 1.7,
                      ),
                    )),
          )
        ]),
      ),
    );
  }
}
