import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_app/base/custom_loader.dart';
import 'package:todo_app/base/show_custom_message.dart';
import 'package:todo_app/data/controllers/authControllers.dart';
import 'package:todo_app/data/repository/authRepo.dart';
import 'package:todo_app/models/signup_model.dart';
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

    void register(AuthController authController) {
      String name = usernameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim();

      if (name.isEmpty) {
        showCustomMessage("Fill in your name", title: "Name");
      } else if (email.isEmpty) {
        showCustomMessage("Fill in your email", title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomMessage("Fill in a valid email address",
            title: "Invalid Email Address");
      } else if (password.isEmpty) {
        showCustomMessage("Fill in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomMessage("Password cannot be less than 6 characters",
            title: "Invalid Password");
      } else if (phone.isEmpty) {
        showCustomMessage("Fill in your phone number", title: "Phone Number");
      } else {
        SignUpModel signUpModel = SignUpModel(
            name: name, password: password, email: email, phone: phone);

        authController.registration(signUpModel).then((value) {
          if (value.isSuccess) {
            print("Success");
          } else {
            showCustomMessage(value.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        return !authController.isLoading
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  SizedBox(
                    height: Dimensions.screenHeight * 0.05,
                  ),
                  // app logo
                  SizedBox(
                    height: Dimensions.screenHeight * 0.25,
                    child: Center(
                        child: Image.asset('assets/images/onboarding.png')),
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),

                  // username
                  AppTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      iconData: Icons.person,
                      color: AppColors.mainColor),
                  SizedBox(
                    height: Dimensions.height15,
                  ),

                  // email
                  AppTextField(
                      controller: emailController,
                      hintText: 'Email',
                      iconData: Icons.email_outlined,
                      color: Colors.purple),
                  SizedBox(
                    height: Dimensions.height15,
                  ),

                  // password
                  AppTextField(
                    isObscure: true,
                      controller: passwordController,
                      hintText: 'Password',
                      iconData: Icons.password,
                      color: Colors.greenAccent),
                  SizedBox(
                    height: Dimensions.height15,
                  ),

                  // phone
                  AppTextField(
                      controller: phoneController,
                      hintText: 'Phone',
                      iconData: Icons.phone,
                      color: Colors.blueAccent),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  GestureDetector(
                    onTap: () {
                      register(authController);
                    },
                    child: Container(
                      width: Dimensions.screenWidth / 2,
                      height: Dimensions.screenHeight / 15,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor),
                      child: Center(
                        child: BigText(
                          text: 'Sign Up',
                          size: Dimensions.font20 + 5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  RichText(
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: 'Already have an account? ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: Dimensions.font16))),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'or Continue with ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: Dimensions.font16))),
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
              )
            : CustomLoader();
      }),
    );
  }
}
