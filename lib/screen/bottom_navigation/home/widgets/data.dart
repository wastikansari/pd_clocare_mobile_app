import 'package:flutter/material.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';


class DataBox extends StatelessWidget {
  final String title;
  final String values;

   const DataBox({super.key, required this.title, required this.values});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 75,
      width: 155,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 56, 56, 56),
        borderRadius: BorderRadius.all(
            Radius.circular(10) //                 <--- border radius here
            ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(
              text: title,
              size: 15,
              fontweights: FontWeight.w700,
            ),
             SizedBox(
              height: 10,
            ),
            SmallText(
              text: values,
              color: Colors.white,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
