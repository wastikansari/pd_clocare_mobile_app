// import 'package:bestow/screen/widget/big_text.dart';
// import 'package:flutter/material.dart';
// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: BigText(
//           text: 'Notification',
//           color: Colors.black,
//         ),
//       ),
//       body: const Center(
//         child: Text('Notification'),
//       ),
//     );
//   }
// }

import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Center(
            child: Column(children: [
          const SizedBox(
            height: 60,
          ),
          Lottie.asset('asset/image/historys.json', height: 300),
          SizedBox(
            width: 200,
            child: EasyRichText(
              'Any message from user site you get notifi here!',
              textAlign: TextAlign.center,
              patternList: [
                EasyRichTextPattern(
                  targetString: 'get notifi here!',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ]))
        
        );
  }
}
