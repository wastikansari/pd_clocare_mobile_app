import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';


class AnalyticsBox extends StatelessWidget {
  const AnalyticsBox({super.key});

  @override
  Widget build(BuildContext context) {
   
      return Container(
    //  width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(20),
        //   bottomRight: Radius.circular(20)
        //   )
        // ),
      // borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: 'Analytics',
              color: Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),
            SmallText(
              text: 'Last 28 days',
              color: Colors.grey,
              size: 12,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Total Product',
                  size: 15,
                ),
                SmallText(
                  text:  '21',
                  size: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Sell',
                  size: 15,
                ),
                SmallText(
                  text: '276',
                  size: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Earning',
                  size: 15,
                ),
                SmallText(
                  text: '24k',
                  size: 15,
                ),
              ],
            ),
             const SizedBox(
              height: 22,
            ),
             TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
            ),
            onPressed:(){
              print('bbbb');

            },
            child: SmallText(
                    text: 'VIEW MORE',
                    color: Colors.blue,
                    
                  ),
          ),
              

          ],
        ),
      ),

    );

   
  }
}
