// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:new_clocare_delivery_boy/backend/api/order_detail_api.dart';
// import 'package:new_clocare_delivery_boy/backend/models/order_detail_model.dart';
// import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
// import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/pending_deliveries_start_screen.dart';
// import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
// import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
// import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
// import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../not_able_to_deliver_screen.dart';

// class PendingPickupDetailScreen extends StatefulWidget {
//   final String orderId;
//   PendingPickupDetailScreen({super.key, required this.orderId});

//   @override
//   State<PendingPickupDetailScreen> createState() =>
//       _PendingPickupDetailScreenState();
// }

// class _PendingPickupDetailScreenState extends State<PendingPickupDetailScreen> {
//   OrderDetailApi orderDetailApi = OrderDetailApi();

//   OrderModel orderModel = OrderModel();

//   String totalOrder = '0';

//   String totalPickup = '0';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Order Details'),
//         elevation: 1,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         child: SingleChildScrollView(
//           physics: const ScrollPhysics(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Height(15),
//               FutureBuilder<OrderModel>(
//                   future: orderDetailApi.getOrderDetail(widget.orderId),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       var allData = snapshot.data!.data;
//                       print('wastikkkkkkkkkkkk ${snapshot.data!.success}');

//                       return CustomBox(
//                         orderId: '#${allData!.orderInfo!.orderDisplayId}',
//                         name: '${allData.orderInfo!.orderBookedBy!.name}',
//                         mobileNo: '${allData.orderInfo!.orderBookedBy!.mobile}',
//                         services: '${allData.orderInfo!.service!.name}',
//                         servicesType:
//                             '${allData.orderInfo!.orderType!.typeName}',
//                       );
//                     } else {
//                       return SizedBox(
//                         height: 200,
//                         width: double.infinity,
//                         child: Center(
//                           child: LoadingAnimationWidget.fourRotatingDots(
//                             color: AppColor.primaryColor2,
//                             size: 60,
//                           ),
//                         ),
//                       );
//                     }
//                   }),
//               const Height(15),
//               BigText(
//                 text: 'Delivery Address',
//                 fontweights: FontWeight.w500,
//                 size: 18,
//               ),
//               const Height(15),
//               FutureBuilder<OrderModel>(
//                   future: orderDetailApi.getOrderDetail(widget.orderId),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       var allData = snapshot.data!.data;
//                       print('wastikkkkkkkkkkkk ${snapshot.data!.success}');

//                       return Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           // color: const Color.fromARGB(255, 228, 241, 252),
//                           borderRadius: BorderRadius.circular(6),
//                           color: const Color.fromARGB(8, 23, 79, 162),
//                           border: Border.all(color: AppColor.primaryColor1),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(15),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // SmallText(
//                               //   text: 'Haripura',
//                               //   color: Colors.black87,
//                               // ),
//                               // const Height(4),
//                               // SmallText(
//                               //     text: 'Alkapuri', color: Colors.black87),
//                               // const Height(4),
//                               Text(
//                                 allData!.orderInfo!.formattedDeliveryAddress
//                                     .toString(),
//                                 style: const TextStyle(
//                                     fontSize: 14, fontWeight: FontWeight.w400),
//                               ),
//                               // SmallText(
//                               //     text: allData!
//                               //         .orderInfo!.formattedDeliveryAddress
//                               //         .toString(),
//                               //     color: Colors.black87),
//                               const Height(10),
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.watch_later_outlined,
//                                     size: 19,
//                                   ),
//                                   const Widths(8),
//                                   BigText(
//                                     text: allData.orderInfo!.deliveryDate
//                                         .toString(),
//                                     // text: '${allData!.orderInfo!.deliveryDate.toString()}   7AM to 10 PM',
//                                     size: 14,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     } else {
//                       return Container(
//                         height: 80,
//                         width: double.infinity,
//                         child: Center(
//                           child: LoadingAnimationWidget.fourRotatingDots(
//                             color: AppColor.primaryColor2,
//                             size: 60,
//                           ),
//                         ),
//                       );
//                     }
//                   }),
//               const Height(15),
//               BigText(
//                 text: 'Total Garments',
//                 fontweights: FontWeight.w500,
//                 size: 18,
//               ),
//               const Height(15),
//               Container(
//                 width: double.infinity,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   // color: Colors.red,
//                   // color: Color.fromARGB(255, 228, 241, 252),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 65,
//                         // width: 130,
//                         decoration: BoxDecoration(
//                           color: Colors.white12,
//                           borderRadius: BorderRadius.circular(8),
//                           border: Border.all(color: Colors.grey),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SmallText(
//                                 text: 'Garments Order',
//                                 color: Colors.black,
//                                 fontweights: FontWeight.w500,
//                               ),
//                               const Height(5),
//                               FutureBuilder<OrderModel>(
//                                   future: orderDetailApi
//                                       .getOrderDetail(widget.orderId),
//                                   builder: (context, snapshot) {
//                                     if (snapshot.hasData) {
//                                       var allData = snapshot.data!.data;
//                                       // print(
//                                       //     'qqqqqqqqqq ${snapshot.data!.success}');
//                                       // int totalPickup = 0;

//                                       // for (int i = 0;
//                                       //     i <
//                                       //         allData!.orderInfo!.orderItems!
//                                       //             .length;
//                                       //     i++) {
//                                       //   totalPickup = allData.orderInfo!
//                                       //           .orderItems![i].qty! +
//                                       //       totalPickup;
//                                       // }

//                                       return SmallText(
//                                         text: allData!.orderInfo!.totalItems
//                                             .toString(),
//                                         size: 16,
//                                         color: AppColor.primaryColor1,
//                                         fontweights: FontWeight.w500,
//                                       );
//                                     } else {
//                                       return LoadingAnimationWidget
//                                           .fourRotatingDots(
//                                         color: AppColor.primaryColor2,
//                                         size: 20,
//                                       );
//                                     }
//                                   }),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: 65,
//                         decoration: BoxDecoration(
//                           color: Colors.white12,
//                           borderRadius: BorderRadius.circular(8),
//                           border: Border.all(color: Colors.grey),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SmallText(
//                                 text: 'Garments Pickup',
//                                 color: Colors.black,
//                                 fontweights: FontWeight.w500,
//                               ),
//                               const Height(5),
//                               FutureBuilder<OrderModel>(
//                                   future: orderDetailApi
//                                       .getOrderDetail(widget.orderId),
//                                   builder: (context, snapshot) {
//                                     if (snapshot.hasData) {
//                                       var allData = snapshot.data!.data;
//                                       print(
//                                           'qqqqqqqqqq ${snapshot.data!.success}');
//                                       int totalPickup = 0;

//                                       for (int i = 0;
//                                           i <
//                                               allData!.orderInfo!.orderItems!
//                                                   .length;
//                                           i++) {
//                                         totalPickup = allData.orderInfo!
//                                                 .orderItems![i].qty! +
//                                             totalPickup;
//                                       }

//                                       return SmallText(
//                                         text: totalPickup.toString(),
//                                         size: 16,
//                                         color: AppColor.primaryColor1,
//                                         fontweights: FontWeight.w500,
//                                       );
//                                     } else {
//                                       return LoadingAnimationWidget
//                                           .fourRotatingDots(
//                                         color: AppColor.primaryColor2,
//                                         size: 20,
//                                       );
//                                     }
//                                   }),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // const Height(15),
//               // BigText(
//               //   text: 'Items in order',
//               //   fontweights: FontWeight.w500,
//               //   size: 18,
//               // ),
//               // const Height(15),
//               // FutureBuilder<OrderModel>(
//               //     future: orderDetailApi.getOrderDetail(widget.orderId),
//               //     builder: (context, snapshot) {
//               //       if (snapshot.hasData) {
//               //         var allData = snapshot.data!.data;
//               //         print('wastikkkkkkkkkkkk ${snapshot.data!.success}');

//               //         return Container(
//               //           width: double.infinity,
//               //           decoration: BoxDecoration(
//               //             // color:
//               //             // Color.fromARGB(255, 228, 241, 252),
//               //             // const Color.fromARGB(255, 243, 243, 243),
//               //             borderRadius: BorderRadius.circular(6),
//               //             color: const Color.fromARGB(10, 77, 172, 223),
//               //             // color: const Color.fromARGB(8, 23, 79, 162),
//               //             // border: Border.all(color: AppColor.primaryColor1),
//               //             border: Border.all(color: Colors.grey),
//               //           ),
//               //           child: Padding(
//               //             padding: const EdgeInsets.all(12),
//               //             child: ListView.builder(
//               //                 physics: const NeverScrollableScrollPhysics(),
//               //                 shrinkWrap: true,
//               //                 itemCount: allData!.orderInfo!.orderItems!.length,
//               //                 itemBuilder: (BuildContext, index) {
//               //                   var data =
//               //                       allData.orderInfo!.orderItems![index];
//               //                   print(
//               //                       'dddddddddd ${data.icon} and ${data.mainType} and ${data.subType} and ${allData.orderInfo!.orderItems!.length}');
//               //                   // var price = data.qty * data.basePrice;
//               //                   int a = int.parse(data.qty.toString());
//               //                   double b = double.parse('${data.basePrice}');

//               //                   var d = a * b;

//               //                   totalOrder = '5';
//               //                   totalPickup = '44';

//               //                   return ListTile(
//               //                     contentPadding: const EdgeInsets.symmetric(
//               //                         vertical: 15.0, horizontal: 10),
//               //                     leading: Container(
//               //                       width: 60,
//               //                       height: 60,
//               //                       decoration: BoxDecoration(
//               //                         color: Colors.white70,
//               //                         shape: BoxShape.circle,
//               //                         border: Border.all(color: Colors.black),
//               //                         // boxShadow: [
//               //                         //   BoxShadow(
//               //                         //     blurRadius: 25.0,
//               //                         //   ),
//               //                         // ],
//               //                         // image: DecorationImage(
//               //                         //   fit: BoxFit.fill,
//               //                         //   image: NetworkImage("https://cc.vcantech.biz/uploads/${data.icon.toString()}"),
//               //                         //       // 'https://www.freepnglogos.com/uploads/garments-png/sardar-garments-fast-shipping-trendy-apparel-39.png'
//               //                         //       // Replace with your image URL
//               //                         // ),
//               //                       ),
//               //                       child: Padding(
//               //                         padding: const EdgeInsets.all(10),
//               //                         child: Image.network(
//               //                           'https://cc.vcantech.biz/uploads/${data.icon.toString()}',
//               //                           height: 80,
//               //                         ),
//               //                       ),
//               //                     ),
//               //                     title: Text(
//               //                       "${data.mainType} >> ${data.subType}",
//               //                       style: const TextStyle(
//               //                         fontSize: 16,
//               //                         fontWeight: FontWeight.w600,
//               //                       ),
//               //                     ),
//               //                     subtitle: Column(
//               //                       mainAxisAlignment: MainAxisAlignment.start,
//               //                       crossAxisAlignment:
//               //                           CrossAxisAlignment.start,
//               //                       children: [
//               //                         const Height(6),
//               //                         SmallText(
//               //                           text:
//               //                               '${data.qty} X ${data.basePrice} = ₹$d',
//               //                           size: 12,
//               //                         ),
//               //                         const Height(6),
//               //                         SmallText(
//               //                           text:
//               //                               'Ordered/Picked: ${data.qty}/${data.qty}',
//               //                           size: 12,
//               //                         )
//               //                       ],
//               //                     ),
//               //                   );
//               //                 }),
//               //           ),
//               //         );
//               //       } else {
//               //         return Container(
//               //           height: 200,
//               //           width: double.infinity,
//               //           child: Center(
//               //             child: LoadingAnimationWidget.fourRotatingDots(
//               //               color: AppColor.primaryColor2,
//               //               size: 60,
//               //             ),
//               //           ),
//               //         );
//               //       }
//               //     }),

//               const Height(35),
//               ButtonWidget2(
//                   text: 'Not able to Pickup',
//                   onPressed: () {
//                     Get.to(NotAbleToDeliver());
//                   }),
//               const Height(20),
//               ButtonWidget(
//                   backgroundColor: AppColor.primaryColor2,
//                   text: 'Collect Garments',
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                                PendingDeliveriesStartScreen(address: '',)),
//                     );
//                   }),
//               const Height(15),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomBox extends StatelessWidget {
//   final String orderId;
//   final String name;
//   final String mobileNo;
//   final String services;
//   final String servicesType;

//   const CustomBox({
//     super.key,
//     required this.orderId,
//     required this.name,
//     required this.mobileNo,
//     required this.services,
//     required this.servicesType,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // height: 200,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Color.fromARGB(8, 23, 79, 162),
//           border: Border.all(color: AppColor.primaryColor1),

//           //Color.fromARGB(255, 243, 243, 243),
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
//                   IconButton(
//                       onPressed: () {
//                         print('call');
//                       },
//                       icon: const Icon(Icons.call))
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
//                     // fontweights: FontWeight.w500,
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
//                     // fontweights: FontWeight.w500,
//                     size: 14,
//                   ),
//                 ],
//               ),
//               const Height(5),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // BigText(
//                   //   text: 'Address : ',
//                   //   size: 14,
//                   //   fontweights: FontWeight.w500,
//                   // ),
//                 ],
//               ),
//               const Height(10),
//               const Divider(),
//             ],
//           ),
//         )

//         // ListTile(
//         //   onTap: () {
//         //     //Get.to(OrdersDetailsScreen(position: OrdersList,));
//         //     print('dat');
//         //   },
//         //   title: Padding(
//         //     padding: const EdgeInsets.only(bottom: 10),
//         //     child: BigText(
//         //       text:
//         //           'Corder', //!= null ? ordersList.allOrdersList[index].addressDetail.name.toString() : '',
//         //       color: Colors.white,
//         //       size: 18,
//         //       fontweights: FontWeight.w400,
//         //     ),
//         //   ),
//         //   subtitle: Column(
//         //       mainAxisAlignment: MainAxisAlignment.start,
//         //       crossAxisAlignment: CrossAxisAlignment.start,
//         //       children: [
//         //         Row(
//         //           children: [
//         //             SmallText(text: 'Order ID : '),
//         //             SmallText(text: '#OR12332434')
//         //           ],
//         //         ),
//         //         SizedBox(
//         //           height: 10,
//         //         ),
//         //         Row(
//         //           children: [
//         //             SmallText(text: 'Price : '),
//         //             SmallText(text: '12')
//         //           ],
//         //         ),
//         //         SizedBox(
//         //           height: 10,
//         //         ),
//         //         Row(
//         //           children: [
//         //             SmallText(text: 'Status : '),
//         //             SmallText(text: 'PENDING')
//         //           ],
//         //         ),
//         //       ]),
//         //   trailing: SmallText(
//         //     text: 'Status',
//         //     color: Colors.redAccent,
//         //     size: 10,
//         //   ),
//         //   // leading: Padding(
//         //   //   padding: const EdgeInsets.only(right: 10),
//         //   //   child: CircleAvatar(
//         //   //     backgroundColor: const Color.fromARGB(255, 39, 39, 39),
//         //   //     child: Text('12'),
//         //   //   ),
//         //   // ),
//         // )

//         );
//   }
// }
