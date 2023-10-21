import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class NewPickupRequestsScreen extends StatelessWidget {
  const NewPickupRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('New Pickup Requests'),
        ),
        body: Center(
            child: Column(children: [
          const SizedBox(
            height: 230,
          ),
          Image.asset(
            'asset/image/pickup_requests.png',
            height: 100,
          ),
          // Lottie.asset('asset/image/historys.json', height: 300),
          const Height(20),
          SizedBox(
            width: 200,
            child: EasyRichText(
              'Assigned a pickup requests orders you will see here!',
              // 'Any Pending pick-up orders showing here!',
              textAlign: TextAlign.center,
              patternList: [
                EasyRichTextPattern(
                  targetString: 'orders you will see here!',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ])));
  }
}
