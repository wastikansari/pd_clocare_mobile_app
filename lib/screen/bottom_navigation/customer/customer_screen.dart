import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/created_new_customer/create_new_customer_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/created_new_customer/customer_mobile_number_check_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/take_order/take_order_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/services/services_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Customer',
          style: TextStyle(fontSize: 22),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ServicesBox(
              imageUrl: 'asset/image/add-user.png',
              name: 'Created New Customer',
              onPressed: () {
                Get.to( MobileNumberVerifyScreen());
              },
            ),
            ServicesBox(
              imageUrl: 'asset/image/cargo.png',
              name: 'Take Order',
              onPressed: () {
                Get.to(TakeOrderScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
