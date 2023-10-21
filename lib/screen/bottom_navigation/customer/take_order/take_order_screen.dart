import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/customer_api.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/created_new_customer/create_new_customer_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/created_new_customer/customer_mobile_number_check_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/take_order/customer_info_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/appBar/share_app_bar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class TakeOrderScreen extends StatefulWidget {
  TakeOrderScreen({super.key});

  @override
  State<TakeOrderScreen> createState() => _TakeOrderScreenState();
}

class _TakeOrderScreenState extends State<TakeOrderScreen> {
  TextEditingController phoneController = TextEditingController();

  CustomerApi customerApi = CustomerApi();

  bool isLoading = false;

  _next() async {
    final String phone = phoneController.text.trim();
    if (phone.isEmpty) {
      showCustomSnackBar(
          title: 'Number', 'Please enter customer mobile number');
    } else if (!GetUtils.isPhoneNumber(phone)) {
      showCustomSnackBar(
          title: 'Number', 'Please enter customer valid mobile number');
    } else {
      setState(() {
        isLoading = true;
      });
      await customerApi.custmerInfo(phone).then((value) {
        if (value.data!.status == 'ok') {
          setState(() {
            isLoading = false;
          });
          Get.to(CustomerInfoScreen(
            userNumber: phone,
          ));
        } else {
          setState(() {
            isLoading = false;
          });
          showCustomSnackBar(title: 'Error', '${value.data!.list![0]}');
          // Get.to(const CreateNewCustomer());
        }
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Take Customer Order'),
      ),
      // appBar: const PreferredSize(
      //     preferredSize: Size(double.infinity, 60),
      //     child: ShareAppBar(
      //       title: 'Take Customer Order',
      //     )),
      body: isLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
              color: AppColor.primaryColor2,
              size: 60,
            ))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Customer Number',
                      fontweights: FontWeight.bold,
                    ),
                    const Height(10),
                    const Text(
                        "Please enter customer's registred mobile number to get pickup"),
                    CustomTextFieldForm(
                      hintText: 'Mobile no',
                      keyboardType: TextInputType.phone,
                      icon: Icons.phone,
                      controller: phoneController,
                    ),
                    const Height(30),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            Get.to(MobileNumberVerifyScreen());
                          },
                          child: SmallText(
                            text: 'Create New Customer',
                            color: Colors.blue,
                            fontweights: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                    const Height(40),
                    ButtonWidget(
                        backgroundColor: AppColor.primaryColor1,
                        text: 'Next',
                        onPressed: () {
                          _next();
                        }),
                  ],
                ),
              ),
            ),
    );
  }
}
