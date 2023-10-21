
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void showCustomSnackBar(
  String message,
  

    {bool isError = true, String title = 'Error'}) {
  Get.snackbar(title, message,
      titleText: BigText(
        text: title,
        color: Colors.white,
        fontweights: FontWeight.bold,
      ),
      messageText: SmallText(text: message, color: Colors.white70,fontweights: FontWeight.w500,
      

      ),
      colorText: Colors.black,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black54);
}
