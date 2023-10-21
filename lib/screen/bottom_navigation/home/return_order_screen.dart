import 'package:flutter/material.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class ReturnOrderScreen extends StatelessWidget {
  const ReturnOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Return Order'),
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'asset/image/rd.png',
              height: 120,
            ),
            const Height(60),
            SmallText(
              text: 'No returned orders at the moment.',
              size: 14,
              fontweights: FontWeight.w400,
            ),
            const Height(6),
            SmallText(
              text: " you will see them here!",
              color: AppColor.primaryColor1,
                 fontweights: FontWeight.w500,
              size: 14,
            ),
            const Height(60),
          ],
        ),
      ),
    );
  }
}
