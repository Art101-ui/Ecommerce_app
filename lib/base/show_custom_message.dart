import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/widgets/big_text.dart';

void showCustomMessage(String message,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(title, message,
      titleText: BigText(
        text: title,
        color: Colors.white,
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Colors.redAccent : Colors.greenAccent);
}
