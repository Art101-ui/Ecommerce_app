import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/auth/sign_up_page.dart';
import 'package:todo_app/utilis/colors.dart';
import 'package:todo_app/utilis/dimensions.dart';
import 'package:todo_app/widgets/app_text.dart';
import 'package:todo_app/widgets/big_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

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

          BigText(
            text: 'Hi',
            size: Dimensions.font20 + 50,
            fontWeight: FontWeight.bold,
            color: AppColors.mainColor,
          ),
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
                text: 'Login',
                size: Dimensions.font20 + 5,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          RichText(
              text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                      color: Colors.grey, fontSize: Dimensions.font16),
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => SignUpPage(),
                          transition: Transition.fadeIn),
                    text: 'Sign Up',
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold))
              ])),
        ]),
      ),
    );
  }
}
