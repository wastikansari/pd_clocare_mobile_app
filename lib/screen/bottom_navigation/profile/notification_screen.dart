import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          'Notification',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Lottie.asset('asset/svg/notification.json',height: 300 ),
            const Height(10),
            SmallText(
              text: 'Nothing to show here at the moment.',
              size: 14,
              fontweights: FontWeight.w400,
            ),
            const Height(6),
            SmallText(
              text: "Stay tuned for updates!",
              color: AppColor.primaryColor1,
                 fontweights: FontWeight.w500,
              size: 14,
            ),
            const Height(100),
          ],
        ),
      ));
    
  }
}
