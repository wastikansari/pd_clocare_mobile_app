import 'package:flutter/material.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class OnlinePaymentScreen extends StatefulWidget {
  const OnlinePaymentScreen({super.key});

  @override
  State<OnlinePaymentScreen> createState() => _OnlinePaymentScreenState();
}

class _OnlinePaymentScreenState extends State<OnlinePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPI Pay'),
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 250,
                width: 250,
                child: Image.network(
                    'https://qrcg-free-editor.qr-code-generator.com/main/assets/images/websiteQRCode_noFrame.png')),
          ),
          const Height(60),
          Container(
            height: 45,
            width: 200,
            decoration: BoxDecoration(
              color: AppColor.primaryColor1,
              // color: Color.fromARGB(255, 228, 241, 252),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
                child: SmallText(
              text: 'Share QR',
              size: 14,
              color: Colors.white,
            )),
          )
        ],
      ),
    );
  }
}
