import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class PickedupOrderScreen extends StatelessWidget {
  const PickedupOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Pickedup order'),
        ),
        body: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
          Image.asset(
            'asset/image/rd.png',
            height: 120,
          ),
          const Height(60),
          SmallText(
            text: 'Currently no picked-up orders to show.',
            size: 14,
            fontweights: FontWeight.w400,
          ),
          const Height(6),
          SmallText(
            text: 'Stay ready for new assignments!',
            color: AppColor.primaryColor1,
            size: 14,
            fontweights: FontWeight.w500,
          ),
          const Height(60),
        ])));
  }
}
