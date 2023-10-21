// import 'package:flutter/material.dart';
// import 'package:new_clocare_delivery_boy/backend/api/order_detail_api.dart';
// import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
// import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
// import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
// import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

// class DeliverScreen extends StatelessWidget {
//   DeliverScreen({super.key});

//   OrderDetailApi orderDetailApi = OrderDetailApi();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Order Deliver'),
//         elevation: 1,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Height(15),
//             const OrderDetailBox(
//               orderId: '#ORD974472494',
//               name: 'Wastik Ansari',
//               mobileNo: '8327724967',
//               services: 'Dry Cleaning',
//               servicesType: 'Regular Service',
//               totalGarment: '13',
        
//               // time: '12-45-2023',
//             ),
//             const Height(30),
//             Align(
//               alignment: Alignment.center,
//               child: BigText(
//                 text: 'Unpaid Amount',
//               ),
//             ),
//             const Height(15),
//             Align(
//               alignment: Alignment.center,
//               child: BigText(
//                 text: '₹ 120.00',
//                 size: 30,
//                 fontweights: FontWeight.bold,
//                 color: AppColor.primaryColor1,
//               ),
//             ),
//             const Height(30),
//             const buttomWidget(
//               text: 'Collect Case',
//             ),
//             const Height(15),
//             const buttomWidget(
//               text: 'Online Payment',
//             ),
//             const Height(25),
//             BigText(
//               text: 'Order Details',
//               fontweights: FontWeight.w500,
//               size: 18,
//             ),
//             const Height(15),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class buttomWidget extends StatelessWidget {
//   final String text;
//   const buttomWidget({
//     super.key,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 55,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: AppColor.primaryColor2Dark,
//         //const Color.fromARGB(8, 23, 79, 162),
//         border: Border.all(color: AppColor.primaryColorDark),
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Center(
//           child: SmallText(
//         text: text,
//         color: Colors.black,
//         size: 15,
//         fontweights: FontWeight.w400,
//       )),
//     );
//   }
// }

// class OrderDetailBox extends StatelessWidget {
//   final String orderId;
//   final String name;
//   final String mobileNo;
//   final String services;
//   final String servicesType;
//   final String totalGarment;


//   const OrderDetailBox({
//     super.key,
//     required this.orderId,
//     required this.name,
//     required this.mobileNo,
//     required this.services,
//     required this.servicesType,
//     required this.totalGarment,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(8, 23, 79, 162),
//           border: Border.all(color: AppColor.primaryColorDark),
//           borderRadius: BorderRadius.circular(6),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   BigText(
//                     text: 'Order id : ',
//                     fontweights: FontWeight.bold,
//                   ),
//                   BigText(
//                     text: orderId,
//                     fontweights: FontWeight.bold,
//                     color: AppColor.primaryColor1,
//                   ),
//                 ],
//               ),
//               const Divider(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BigText(
//                         text: name,
//                         size: 15,
//                         fontweights: FontWeight.w500,
//                       ),
//                       const Height(5),
//                       BigText(
//                         text: mobileNo,
//                         size: 14,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const Divider(),
//               Row(
//                 children: [
//                   BigText(
//                     text: 'Services : ',
//                     size: 14,
//                     fontweights: FontWeight.w500,
//                   ),
//                   BigText(
//                     text: services,
//                     size: 14,
//                   ),
//                 ],
//               ),
//               const Height(5),
//               Row(
//                 children: [
//                   BigText(
//                     text: 'Types : ',
//                     size: 14,
//                     fontweights: FontWeight.w500,
//                   ),
//                   BigText(
//                     text: servicesType,
//                     size: 14,
//                   ),
//                 ],
//               ),
//               const Height(5),
//               Row(
//                 children: [
//                   BigText(
//                     text: 'Total Garments : ',
//                     size: 14,
//                     fontweights: FontWeight.w500,
//                   ),
//                   BigText(
//                     text: totalGarment,
//                     size: 14,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
