// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:typof_app/ui/utiles/colors.dart';
// import 'package:typof_app/ui/widget/big_text.dart';
// import 'package:typof_app/ui/widget/small_text.dart';
// import '../../../../../../controllers/product_controllers.dart';

// class MyStore extends StatelessWidget {
//   const MyStore({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ProductControllers>(builder: (productList) {
//       return Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
          
//           //color: Color.fromARGB(255, 0, 0, 0),
//           //   borderRadius: BorderRadius.only(
//           //     bottomLeft: Radius.circular(50),
//           //     bottomRight: Radius.circular(50)
//           //     )
//           //),
//           // borderRadius: BorderRadius.all(Radius.circular(10))
//         ),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 BigText(
//                   text: 'My Stores',
//                   color: Colors.white,
//                   size: 20,
//                   fontweights: FontWeight.w500,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Colors.pink,
//                       borderRadius: BorderRadius.circular(9)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: SmallText(
//                       text: 'store.typof.in',
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//            const SizedBox(
//             height: 12,
//           ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SmallText(
//                   text: 'Store Name',
//                 ),
//                 SmallText(
//                   text: 'Typof',
//                 ),
//               ],
//             ),
//            const SizedBox(
//             height: 12,
//           ),
//             // ignore: prefer_const_constructors
//             SizedBox(
//               height: 10,
//             ),
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: SmallText(
//                 text: 'VIEW MORE',
//                 color: Colors.blue,
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
