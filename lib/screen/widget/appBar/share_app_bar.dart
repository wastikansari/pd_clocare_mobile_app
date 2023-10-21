import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:flutter/material.dart';

class ShareAppBar extends StatelessWidget {
  final String title;

  const ShareAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.8,
      title: BigText(
        text: title,
        size: 19,
      ),
    );
  }
}
