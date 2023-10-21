import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_clocare_delivery_boy/screen/auth/login_screen.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/app_asset.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 6), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen()),
          ((route) => false));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Height(30),
            Column(
              children: [
                Lottie.asset('asset/svg/success.json', height: 190),
                const Height(50),
                SmallText(
                  text: 'Success!',
                  size: 30,
                  color: AppColor.primaryColor1,
                  fontweights: FontWeight.bold,
                ),
                const Height(10),
                SmallText(
                  text: 'Your Clocare account created successfully!',
                  size: 15,
                  color: Colors.black,
                ),
                const Height(80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAsset.logo,
                      height: 22,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ButtonWidget(
                  text: "Login",
                  backgroundColor: AppColor.primaryColor1,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginScreen()),
                        ((route) => false));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
