// import 'package:get/get.dart';
// import 'package:new_clocare_delivery_boy/backend/controller/garment_controller.dart';
// import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/take_order/complete_order_screen.dart';
// import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
// import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
// import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
// import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
// import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
// import 'package:flutter/material.dart';
// import 'package:badges/badges.dart' as badges;

// class ChooseGarmentsScreen extends StatefulWidget {
//   const ChooseGarmentsScreen({super.key});

//   @override
//   _ChooseGarmentsScreenState createState() => _ChooseGarmentsScreenState();
// }

// class _ChooseGarmentsScreenState extends State<ChooseGarmentsScreen> {
//   // var garmentData = Get.find<GarmentController>();

//   GarmentController garmentController = Get.put(GarmentController());
//   List<List<int>> quantities = [];
//   double totalPrice = 0.0;
//   int totalQuantities = 0;

//   // List<List<String>> garments = [
//   //   // Men's Wear garments
//   //   [
//   //     "Shirt",
//   //     "T-shirt",
//   //     "Trouser",
//   //     "Suit(2 Pcs)",
//   //     "Suit(3 Pcs)",
//   //     "Jacket",
//   //     "Kameez / Kurta",
//   //     "Pajama",
//   //     "Denims / Jeans",
//   //     "Dhoti"
//   //   ],
//   //   // Women's Wear garments
//   //   [
//   //     "Top (Medium)",
//   //     "Top (Long)",
//   //     "Skirt (Medium)",
//   //     "Skirt (Long)",
//   //     "Saree (plain)",
//   //     "Saree (zari)",
//   //     "Salwar",
//   //     "Dupatta",
//   //     "Kurti",
//   //     "Jeans",
//   //     "Blouse",
//   //     "Long Gown Kurti",
//   //     "Chaniya (Normal)",
//   //     "Chaniya (Heavy)"
//   //   ],
//   //   // Kidswear garments
//   //   [
//   //     "T-shirt",
//   //     "Dungarees",
//   //     "Frock",
//   //     "Shorts",
//   //     "Trousers / Jeans",
//   //     "Baba suit",
//   //     "Onesies",
//   //     "Shirt"
//   //   ],
//   //   // Household garments
//   //   [
//   //     "Single Bedsheet",
//   //     "Double Bedsheet",
//   //     "Pillow cover",
//   //     "Curtain - Small",
//   //     "Curtain - Big",
//   //     "Curtain - Extra large",
//   //     "Sofa Cover - Single",
//   //     "Sofa Cover - Double",
//   //     "P&D Charges"
//   //   ],
//   //   // School Uniform garments
//   //   [
//   //     "School uniform - Shirt",
//   //     "School uniform - Shorts",
//   //     "School uniform full (Girls)",
//   //     "School uniform - Trouser",
//   //   ],
//   // ];

//   // List<List<int>> garmentPrices = [
//   //   // Men's Wear garment prices
//   //   [6, 6, 6, 40, 40, 50, 30, 6, 6, 8, 10],
//   //   // Women's Wear garment prices
//   //   [6, 8, 6, 8, 10, 20, 6, 6, 6, 8, 6, 15, 10, 18],
//   //   // Kidswear garment prices
//   //   [6, 6, 6, 6, 8, 6, 6, 6],
//   //   // Household garment prices
//   //   [12, 20, 6, 15, 30, 40, 20, 30, 30],
//   //   // School Uniform garment prices
//   //   [5, 5, 10, 5],
//   // ];

//   @override
//   void initState() {
//     super.initState();
//     // for (int i = 0; i < garments.length; i++) {
//     //   quantities.add(List<int>.filled(garments[i].length, 0));
//     //   print('total quantities $quantities');
//     // }
//   }

//   void updateTotalPrice(price) {
//     double p = double.parse(price);
//     setState(() {
//       totalPrice += p;
//       totalQuantities = totalQuantities + 1;
//     });
//     print('updateTotalPrice $totalPrice and $price and $totalQuantities');
//   }

//   void decrementTotalPrice(price) {
//     double p = double.parse(price);
//     setState(() {
//       totalPrice -= p;
//       totalQuantities = totalQuantities - 1;
//     });
//     print('updateTotalPrice $totalPrice and $price and $totalQuantities');
//   }

//   // String getTabName(int index) {
//   //   switch (index) {
//   //     case 0:
//   //       return "Men's Wear";
//   //     case 1:
//   //       return "Women's Wear";
//   //     case 2:
//   //       return "Kidswear";
//   //     case 3:
//   //       return "Household";
//   //     case 4:
//   //       return "School Uniform";
//   //     default:
//   //       return "";
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColor.backgroundColor,
//         appBar: AppBar(
//           elevation: 2,
//           title: const Text('Choose garments'),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.refresh),
//               onPressed: () {
//                 resetQuantities();
//               },
//             ),
//           ],
//         ),
//         body: Obx(() {
//           if (garmentController.garmentModel.value.success == null) {
//             return const CircularProgressIndicator();
//           } else {
//             var data = garmentController.garmentModel.value.data;
//             var d = data![0];

//             for (int i = 0; i < d.itemsList!.length; i++) {}

//             for (int i = 0; i < d.itemsList!.length; i++) {
//               quantities
//                   .add(List<int>.filled(d.itemsList![i].items!.length, 0));
//               print('total quantities $quantities');
//             }

//             return DefaultTabController(
//               length: d.itemsList!.length,
//               child: Column(
//                 children: [
//                   TabBar(
                    
                    
//                     unselectedLabelColor: Colors.black45,
//                     labelColor: AppColor.primaryColor1,
//                     labelStyle: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold),
//                     isScrollable: true,
//                     tabs: [
//                       for (int i = 0; i < d.itemsList!.length; i++)
//                         Tab(text: d.itemsList![i].name),
//                     ],
//                   ),
//                   Expanded(
//                     child: TabBarView(
//                       children: [
//                         for (int i = 0; i < d.itemsList!.length; i++)
//                           ListView.builder(
//                             itemCount: d.itemsList![i].items!.length,
//                             itemBuilder: (context, index) {
//                               String garmentName =
//                                   d.itemsList![i].items![index].name.toString();
//                               // garments[categoryIndex][index];
//                               String price = d.itemsList![i].items![index].price
//                                   .toString();

//                               String image =
//                                   d.itemsList![i].items![index].icon.toString();
//                               String url =
//                                   '${AppConstants.BASE_URL}/uploads/$image';
//                               // 'https://cc.vcantech.biz/uploads/$image';

//                               int cat = d.itemsList!.indexOf(d.itemsList![i]);

//                               int quantity = quantities[cat][index];

//                               return Column(
//                                 children: [
//                                   Card(
//                                     elevation: 0,
//                                     color: quantity > 0
//                                         ? Colors.grey[300]
//                                         : AppColor.backgroundColor,
//                                     child: ListTile(
//                                       contentPadding:
//                                           const EdgeInsets.symmetric(
//                                               vertical: 15.0, horizontal: 10),
//                                       leading: SizedBox(
//                                         width: 70,
//                                         height: 70,
//                                         child: Image.network(url),
//                                       ),
//                                       title: Text(
//                                         garmentName,
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       subtitle: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           const Height(5),
//                                           SmallText(text: 'Per price:'),
//                                           const Height(5),
//                                           SmallText(
//                                             text: '₹$price',
//                                             size: 16,
//                                             color: Colors.green[700],
//                                             fontweights: FontWeight.w500,
//                                           )
//                                         ],
//                                       ),
//                                       trailing: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           IconButton(
//                                             icon: CircleAvatar(
//                                               radius: 14,
//                                               backgroundColor: Colors.grey[400],
//                                               child: const Icon(
//                                                 Icons.remove,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                             onPressed: () {
//                                               if (quantity > 0) {
//                                                 setState(() {
//                                                   quantity =
//                                                       quantities[cat][index]--;

//                                                   decrementTotalPrice(price);
//                                                   print(
//                                                       'decrementTotalPrice $price');
//                                                 });
//                                               }
//                                             },
//                                           ),
//                                           // const Widths(5),
//                                           BigText(
//                                             text: '$quantity',
//                                             fontweights: FontWeight.w400,
//                                           ),
//                                           // const Widths(5),
//                                           IconButton(
//                                             icon: CircleAvatar(
//                                               radius: 14,
//                                               backgroundColor: Colors.grey[400],
//                                               child: const Icon(
//                                                 Icons.add,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                             // icon: const Icon(Icons.add),
//                                             onPressed: () {
//                                               setState(() {
//                                                 quantity = quantity + 1;
//                                                 quantity =
//                                                     quantities[cat][index]++;
//                                                 updateTotalPrice(price);
//                                                 print(
//                                                     'updateTotalPrice $price');
//                                               });
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   const Divider()
//                                 ],
//                               );
//                             },
//                           )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     color: Colors.grey[200],
//                     child: Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           badges.Badge(
//                               badgeContent: Text(
//                                 '$totalQuantities',
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                               badgeStyle: const badges.BadgeStyle(
//                                 padding: EdgeInsets.all(7),
//                                 badgeColor: Colors.redAccent,
//                               ),
//                               child: const Icon(
//                                 Icons.shopping_cart_outlined,
//                                 size: 28,
//                               )),
//                           BigText(
//                             text: '\₹$totalPrice',
//                             size: 18,
//                             color: Colors.green[700],
//                             fontweights: FontWeight.w500,
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: AppColor.primaryColor1,
//                                 textStyle: const TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.w500)),
//                             onPressed: () {
//                               Get.to( CompleteOrderScreen());
//                               // Continue button tapped
//                             },
//                             child: const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text('Continue'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//         }));
//   }

//   // Widget _buildGarmentsList(int categoryIndex) {
//   //   return ListView.builder(
//   //     itemCount: garments[categoryIndex].length,
//   //     itemBuilder: (context, index) {
//   //       String garmentName = garments[categoryIndex][index];
//   //       int price = garmentPrices[categoryIndex][index];
//   //       int quantity = quantities[categoryIndex][index];

//   //       return Card(
//   //         color: quantity > 0 ? Colors.grey[300] : Colors.white,
//   //         child: ListTile(
//   //           contentPadding:
//   //               const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
//   //           leading: Container(
//   //             width: 70,
//   //             height: 70,
//   //             decoration: const BoxDecoration(
//   //               // color: Colors.amber,
//   //               shape: BoxShape.circle,
//   //               image: DecorationImage(
//   //                 fit: BoxFit.fill,
//   //                 image: NetworkImage(
//   //                     'https://www.freepnglogos.com/uploads/garments-png/sardar-garments-fast-shipping-trendy-apparel-39.png'), // Replace with your image URL
//   //               ),
//   //             ),
//   //           ),
//   //           title: Text(
//   //             garmentName,
//   //             style: const TextStyle(
//   //               fontSize: 16,
//   //               fontWeight: FontWeight.w600,
//   //             ),
//   //           ),

//   //           //  BigText(
//   //           //   text: garmentName,
//   //           //   fontweights: FontWeight.bold,
//   //           //   size: 16,
//   //           // ),
//   //           //Text(garmentName),
//   //           subtitle: Column(
//   //             mainAxisAlignment: MainAxisAlignment.start,
//   //             crossAxisAlignment: CrossAxisAlignment.start,
//   //             children: [
//   //               Height(5),
//   //               SmallText(text: 'Per price:'),
//   //               Height(5),
//   //               SmallText(
//   //                 text: '\₹$price.00',
//   //                 size: 16,
//   //                 color: Colors.green[700],
//   //                 fontweights: FontWeight.w500,
//   //               )
//   //             ],
//   //           ),
//   //           trailing: Row(
//   //             mainAxisSize: MainAxisSize.min,
//   //             children: [
//   //               IconButton(
//   //                 icon: CircleAvatar(
//   //                   radius: 14,
//   //                   backgroundColor: Colors.grey[400],
//   //                   child: const Icon(
//   //                     Icons.remove,
//   //                     color: Colors.white,
//   //                   ),
//   //                 ),
//   //                 onPressed: () {
//   //                   if (quantity > 0) {
//   //                     setState(() {
//   //                       quantities[categoryIndex][index]--;
//   //                       decrementTotalPrice(price);
//   //                     });
//   //                   }
//   //                 },
//   //               ),
//   //               // const Widths(5),
//   //               BigText(
//   //                 text: '$quantity',
//   //                 fontweights: FontWeight.w400,
//   //               ),
//   //               // const Widths(5),
//   //               IconButton(
//   //                 icon: CircleAvatar(
//   //                   radius: 14,
//   //                   backgroundColor: Colors.grey[400],
//   //                   child: const Icon(
//   //                     Icons.add,
//   //                     color: Colors.white,
//   //                   ),
//   //                 ),
//   //                 // icon: const Icon(Icons.add),
//   //                 onPressed: () {
//   //                   setState(() {
//   //                     quantities[categoryIndex][index]++;
//   //                     updateTotalPrice(price);
//   //                   });
//   //                 },
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }

//   void resetQuantities() {
//     setState(() {
//       quantities = [];
//       totalPrice = 0;
//       totalQuantities = 0;
//       // for (int i = 0; i < garments.length; i++) {
//       //   quantities.add(List<int>.filled(garments[i].length, 0));
//       // }
//     });
//   }
// }










// //////////////////////////////////// ------------------  tesing code of choose garments  ---------------------------   //////////////////////////////////////////








// // import 'package:get/get.dart';
// // import 'package:new_clocare_delivery_boy/backend/controller/garment_controller.dart';
// // import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
// // import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
// // import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
// // import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
// // import 'package:flutter/material.dart';
// // import 'package:badges/badges.dart' as badges;

// // class ChooseGarmentsScreen extends StatefulWidget {
// //   const ChooseGarmentsScreen({super.key});

// //   @override
// //   _ChooseGarmentsScreenState createState() => _ChooseGarmentsScreenState();
// // }

// // class _ChooseGarmentsScreenState extends State<ChooseGarmentsScreen> {
// //   // var garmentData = Get.find<GarmentController>();

// //   GarmentController garmentController = Get.put(GarmentController());

// //   List<List<String>> garments = [
// //     // Men's Wear garments
// //     [
// //       "Shirt",
// //       "T-shirt",
// //       "Trouser",
// //       "Suit(2 Pcs)",
// //       "Suit(3 Pcs)",
// //       "Jacket",
// //       "Kameez / Kurta",
// //       "Pajama",
// //       "Denims / Jeans",
// //       "Dhoti"
// //     ],
// //     // Women's Wear garments
// //     [
// //       "Top (Medium)",
// //       "Top (Long)",
// //       "Skirt (Medium)",
// //       "Skirt (Long)",
// //       "Saree (plain)",
// //       "Saree (zari)",
// //       "Salwar",
// //       "Dupatta",
// //       "Kurti",
// //       "Jeans",
// //       "Blouse",
// //       "Long Gown Kurti",
// //       "Chaniya (Normal)",
// //       "Chaniya (Heavy)"
// //     ],
// //     // Kidswear garments
// //     [
// //       "T-shirt",
// //       "Dungarees",
// //       "Frock",
// //       "Shorts",
// //       "Trousers / Jeans",
// //       "Baba suit",
// //       "Onesies",
// //       "Shirt"
// //     ],
// //     // Household garments
// //     [
// //       "Single Bedsheet",
// //       "Double Bedsheet",
// //       "Pillow cover",
// //       "Curtain - Small",
// //       "Curtain - Big",
// //       "Curtain - Extra large",
// //       "Sofa Cover - Single",
// //       "Sofa Cover - Double",
// //       "P&D Charges"
// //     ],
// //     // School Uniform garments
// //     [
// //       "School uniform - Shirt",
// //       "School uniform - Shorts",
// //       "School uniform full (Girls)",
// //       "School uniform - Trouser",
// //     ],
// //   ];

// //   List<List<int>> garmentPrices = [
// //     // Men's Wear garment prices
// //     [6, 6, 6, 40, 40, 50, 30, 6, 6, 8, 10],
// //     // Women's Wear garment prices
// //     [6, 8, 6, 8, 10, 20, 6, 6, 6, 8, 6, 15, 10, 18],
// //     // Kidswear garment prices
// //     [6, 6, 6, 6, 8, 6, 6, 6],
// //     // Household garment prices
// //     [12, 20, 6, 15, 30, 40, 20, 30, 30],
// //     // School Uniform garment prices
// //     [5, 5, 10, 5],
// //   ];

// //   List<List<int>> quantities = [];

// //   int totalPrice = 0;
// //   int totalQuantities = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     for (int i = 0; i < garments.length; i++) {
// //       quantities.add(List<int>.filled(garments[i].length, 0));
// //       print('total quantities $quantities');
// //     }
// //   }

// //   void updateTotalPrice(int price) {
// //     setState(() {
// //       totalPrice += price;
// //       totalQuantities = totalQuantities + 1;
// //     });
// //     print('updateTotalPrice $totalPrice and $price and $totalQuantities');
// //   }

// //   void decrementTotalPrice(int price) {
// //     setState(() {
// //       totalPrice -= price;
// //       totalQuantities = totalQuantities - 1;
// //     });
// //     print('updateTotalPrice $totalPrice and $price and $totalQuantities');
// //   }

// //   // String getTabName(int index) {
// //   //   switch (index) {
// //   //     case 0:
// //   //       return "Men's Wear";
// //   //     case 1:
// //   //       return "Women's Wear";
// //   //     case 2:
// //   //       return "Kidswear";
// //   //     case 3:
// //   //       return "Household";
// //   //     case 4:
// //   //       return "School Uniform";
// //   //     default:
// //   //       return "";
// //   //   }
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Choose garments'),
// //           actions: [
// //             IconButton(
// //               icon: const Icon(Icons.refresh),
// //               onPressed: () {
// //                 resetQuantities();
// //               },
// //             ),
// //           ],
// //         ),
// //         body: Obx(() {
// //           if (garmentController.garmentModel.value.success == null) {
// //             return const CircularProgressIndicator();
// //           } else {
// //             var data = garmentController.garmentModel.value.data;
// //             var d = data![0];

// //             for (int i = 0; i < d.itemsList!.length; i++) {}
// //             return DefaultTabController(
// //               length: d.itemsList!.length,
// //               child: Column(
// //                 children: [
// //                   TabBar(
// //                     unselectedLabelColor: Colors.black45,
// //                     labelColor: AppColor.primaryColor1,
// //                     labelStyle: const TextStyle(
// //                         fontSize: 16, fontWeight: FontWeight.bold),
// //                     isScrollable: true,
// //                     tabs: [
// //                       for (int i = 0; i < d.itemsList!.length; i++)
// //                         Tab(text: d.itemsList![i].name),
// //                     ],
// //                   ),
// //                   Expanded(
// //                     child: TabBarView(
// //                       children: [
// //                         for (int i = 0; i < d.itemsList!.length; i++)
// //                           _buildGarmentsList(i),
// //                       ],
// //                     ),
// //                   ),
// //                   Container(
// //                     color: Colors.grey[200],
// //                     child: Padding(
// //                       padding: const EdgeInsets.all(12),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           badges.Badge(
// //                               badgeContent: Text(
// //                                 '$totalQuantities',
// //                                 style: const TextStyle(color: Colors.white),
// //                               ),
// //                               badgeStyle: const badges.BadgeStyle(
// //                                 padding: EdgeInsets.all(7),
// //                                 badgeColor: Colors.redAccent,
// //                               ),
// //                               child: const Icon(
// //                                 Icons.shopping_cart_outlined,
// //                                 size: 28,
// //                               )),
// //                           BigText(
// //                             text: '₹$totalPrice.00',
// //                             size: 18,
// //                             color: Colors.green[700],
// //                             fontweights: FontWeight.w500,
// //                           ),
// //                           ElevatedButton(
// //                             style: ElevatedButton.styleFrom(
// //                                 backgroundColor: AppColor.primaryColor1,
// //                                 textStyle: const TextStyle(
// //                                     fontSize: 16, fontWeight: FontWeight.w500)),
// //                             onPressed: () {
// //                               // Continue button tapped
// //                             },
// //                             child: const Padding(
// //                               padding: EdgeInsets.all(8.0),
// //                               child: Text('Continue'),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             );
// //           }
// //         }));
// //   }

// //   Widget _buildGarmentsList(int categoryIndex) {
// //     return ListView.builder(
// //       itemCount: garments[categoryIndex].length,
// //       itemBuilder: (context, index) {
// //         String garmentName = garments[categoryIndex][index];
// //         int price = garmentPrices[categoryIndex][index];
// //         int quantity = quantities[categoryIndex][index];

// //         return Card(
// //           color: quantity > 0 ? Colors.grey[300] : Colors.white,
// //           child: ListTile(
// //             contentPadding:
// //                 const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
// //             leading: Container(
// //               width: 70,
// //               height: 70,
// //               decoration: const BoxDecoration(
// //                 // color: Colors.amber,
// //                 shape: BoxShape.circle,
// //                 image: DecorationImage(
// //                   fit: BoxFit.fill,
// //                   image: NetworkImage(
// //                       'https://www.freepnglogos.com/uploads/garments-png/sardar-garments-fast-shipping-trendy-apparel-39.png'), // Replace with your image URL
// //                 ),
// //               ),
// //             ),
// //             title: Text(
// //               garmentName,
// //               style: const TextStyle(
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),

// //             //  BigText(
// //             //   text: garmentName,
// //             //   fontweights: FontWeight.bold,
// //             //   size: 16,
// //             // ),
// //             //Text(garmentName),
// //             subtitle: Column(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Height(5),
// //                 SmallText(text: 'Per price:'),
// //                 Height(5),
// //                 SmallText(
// //                   text: '\₹$price.00',
// //                   size: 16,
// //                   color: Colors.green[700],
// //                   fontweights: FontWeight.w500,
// //                 )
// //               ],
// //             ),
// //             trailing: Row(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 IconButton(
// //                   icon: CircleAvatar(
// //                     radius: 14,
// //                     backgroundColor: Colors.grey[400],
// //                     child: const Icon(
// //                       Icons.remove,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   onPressed: () {
// //                     if (quantity > 0) {
// //                       setState(() {
// //                         quantities[categoryIndex][index]--;
// //                         decrementTotalPrice(price);
// //                       });
// //                     }
// //                   },
// //                 ),
// //                 // const Widths(5),
// //                 BigText(
// //                   text: '$quantity',
// //                   fontweights: FontWeight.w400,
// //                 ),
// //                 // const Widths(5),
// //                 IconButton(
// //                   icon: CircleAvatar(
// //                     radius: 14,
// //                     backgroundColor: Colors.grey[400],
// //                     child: const Icon(
// //                       Icons.add,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   // icon: const Icon(Icons.add),
// //                   onPressed: () {
// //                     setState(() {
// //                       quantities[categoryIndex][index]++;
// //                       updateTotalPrice(price);
// //                     });
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   void resetQuantities() {
// //     setState(() {
// //       quantities = [];
// //       totalPrice = 0;
// //       totalQuantities = 0;
// //       for (int i = 0; i < garments.length; i++) {
// //         quantities.add(List<int>.filled(garments[i].length, 0));
// //       }
// //     });
// //   }
// // }




import 'package:get/get.dart';
import 'package:new_clocare_delivery_boy/backend/controller/garment_controller.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/complete_pickup_order_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/recording_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ChooseGarmentsScreen extends StatefulWidget {
  // final String orderId;
  final String serviceId;
  final String miniOrderValue;

  const ChooseGarmentsScreen(
      {super.key,
      // required this.orderId,
      required this.miniOrderValue,
      required this.serviceId});

  @override
  // ignore: library_private_types_in_public_api
  _ChooseGarmentsScreenState createState() => _ChooseGarmentsScreenState();
}

class _ChooseGarmentsScreenState extends State<ChooseGarmentsScreen> {
  GarmentController garmentController = Get.put(GarmentController());
  List<List<int>> quantities = [];
  double miniOrderValue = 0.0;
  double totalPrice = 0.0;
  int totalQuantities = 0;

  var addGarment = [];

  @override
  void initState() {
    super.initState();
    // miniOrderValue = double.parse(widget.miniOrderValue.toString());
  }

  void updateTotalPrice(price) {
    double p = double.parse(price);
    setState(() {
      totalPrice += p;
      totalQuantities = totalQuantities + 1;
    });
    print('updateTotalPrice $totalPrice and $price and $totalQuantities');
  }

  void decrementTotalPrice(price) {
    double p = double.parse(price);
    setState(() {
      totalPrice -= p;
      totalQuantities = totalQuantities - 1;
    });
    print('updateTotalPrice $totalPrice and $price and $totalQuantities');
  }

  // addItems() {
  //   AddOrderItemModel addOrderItemModel = AddOrderItemModel(
  //       item_id: '12',
  //       gtype_id: 'fd',
  //       main_type: 'hfg',
  //       gsubtype_id: 'gfh',
  //       sub_type: 'gfh',
  //       base_price: 'gfh',
  //       qty: '234',
  //       rcvd_qty: '4',
  //       icon: '24');

  //   for (int i = 0; i < 10; i++) {
  //     addGarment.add(addOrderItemModel);
  //   }
  //   print(addGarment[0].qty);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      // backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar(
          elevation: 1,
          title: const Text('Add garments'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                resetQuantities();
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (garmentController.garmentModel.value.success == null) {
          return const CircularProgressIndicator();
        } else {
          var data = garmentController.garmentModel.value.data;
          var orderServiceId = int.parse(widget.serviceId.toString());
          int serviceId = 0;
          for (int i = 0; i < data!.length; i++) {
            if (data[i]!.id == orderServiceId) {
              serviceId = i;
            }
          }
          print('serviceidddddddddddddddddd $serviceId and order service id $orderServiceId');

          var allGarmentList = data[serviceId];
          for (int i = 0; i < allGarmentList.itemsList!.length; i++) {
            quantities.add(List<int>.filled(
                allGarmentList.itemsList![i].items!.length, 0));

            var itemsList = allGarmentList.itemsList![i].items;
            List<Map<String, dynamic>> datas = [];
            for (int j = 0; j < itemsList!.length; j++) {
              // var d = itemsList[i].price.toString();
              Map<String, dynamic> item = {
                "gtype_id": itemsList[j].subtypeId.toString(),
                "price_id": itemsList[j].priceId.toString(),
                "base_price": itemsList[j].price.toString(),
                "rcvd_qty": 0,
              };
              datas.add(item);
            }
            addGarment.add(datas);
          }
          print('total quantities $quantities and ${quantities.runtimeType}');
          print('final data $addGarment and ${addGarment.runtimeType}');
          print(' ${addGarment.runtimeType}');
          return DefaultTabController(
            length: allGarmentList.itemsList!.length,
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColor.primaryButtonColor),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: InkWell(
                      onTap: () {
                        // Get.to( RecordeingScreen(orderId: widget.orderId,));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(text: 'Take garments using recording...'),
                          Image.asset(
                            'asset/image/voice.png',
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TabBar(
                  unselectedLabelColor: Colors.black45,
                  labelColor: AppColor.primaryColor1,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  isScrollable: true,
                  tabs: [
                    for (int i = 0; i < allGarmentList.itemsList!.length; i++)
                      Tab(text: allGarmentList.itemsList![i].name),
                  ],
                ),
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 240, 240, 240),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Center(
                      child: SmallText(
                        text:
                            'Minimum order amount should be : ₹$miniOrderValue',
                        color: totalPrice >= miniOrderValue
                            ? Colors.black
                            : Colors.red,
                        size: 14,
                        fontweights: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      for (int i = 0; i < allGarmentList.itemsList!.length; i++)
                        ListView.builder(
                          itemCount: allGarmentList.itemsList![i].items!.length,
                          itemBuilder: (context, index) {
                            String garmentName = allGarmentList
                                .itemsList![i].items![index].name
                                .toString();
                            String price = allGarmentList
                                .itemsList![i].items![index].price
                                .toString();
                            String image = allGarmentList
                                .itemsList![i].items![index].icon
                                .toString();
                            String url =
                                '${AppConstants.BASE_URL}/uploads/$image';
                            int indexOfItemsList = allGarmentList.itemsList!
                                .indexOf(allGarmentList.itemsList![i]);
                            int quantity = quantities[indexOfItemsList][index];

                            return Column(
                              children: [
                                Card(
                                  elevation: 0,
                                  color: quantity > 0
                                      ? Colors.grey[300]
                                      : AppColor.backgroundColor,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 10),
                                    leading: SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: Image.network(url),
                                    ),
                                    title: Text(
                                      garmentName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Height(5),
                                        SmallText(
                                          text: 'Per price:',
                                          size: 12,
                                        ),
                                        const Height(5),
                                        SmallText(
                                          text: '₹$price',
                                          size: 16,
                                          color: Colors.green[700],
                                          fontweights: FontWeight.w500,
                                        )
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: CircleAvatar(
                                            radius: 14,
                                            backgroundColor: Colors.grey[400],
                                            child: const Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            if (quantity > 0) {
                                              setState(() {
                                                quantity =
                                                    quantities[indexOfItemsList]
                                                        [index]--;
                                                addGarment[indexOfItemsList]
                                                    [index]['rcvd_qty']--;
                                                decrementTotalPrice(price);
                                                print(
                                                    'decrementTotalPrice $price');
                                              });
                                            }
                                          },
                                        ),
                                        BigText(
                                          text: '$quantity',
                                          fontweights: FontWeight.w400,
                                        ),
                                        IconButton(
                                          icon: CircleAvatar(
                                            radius: 14,
                                            backgroundColor: Colors.grey[400],
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              quantity = quantity + 1;
                                              quantity =
                                                  quantities[indexOfItemsList]
                                                      [index]++;
                                              addGarment[indexOfItemsList]
                                                  [index]['rcvd_qty']++;
                                              updateTotalPrice(price);
                                              print('updateTotalPrice $price');
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider()
                              ],
                            );
                          },
                        )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 244, 244, 244),
              blurRadius: 1.0,
              spreadRadius: 1.0,
              offset: Offset(
                1.0,
                1.0,
              ),
            ),
          ],
          border: Border.all(color: const Color.fromARGB(255, 221, 221, 221)),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  badges.Badge(
                      badgeContent: Text(
                        '$totalQuantities',
                        style: const TextStyle(color: Colors.white),
                      ),
                      badgeStyle: const badges.BadgeStyle(
                        padding: EdgeInsets.all(7),
                        badgeColor: Colors.redAccent,
                      ),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 28,
                      )),
                  const SizedBox(
                    width: 25,
                  ),
                  BigText(
                    text: '\₹$totalPrice',
                    size: 18,
                    color: Colors.green[700],
                    fontweights: FontWeight.w500,
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor1,
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                onPressed: () {
                  orderContinue();
                },
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetQuantities() {
    setState(() {
      quantities = [];
      addGarment = [];
      totalPrice = 0;
      totalQuantities = 0;
    });
  }

  orderContinue() {
    if (totalPrice < miniOrderValue) {
      conformationDialogBox(miniOrderValue);
    } else {
      var items = addGarment.expand((innerList) => innerList).toList();
      print('data 1 $addGarment');
      print('data 2 $items');
      // Get.to(CompletePickupOrderScreen(
      //   orderId: widget.orderId,
      //   totalPrice: totalPrice,
      //   garmentCollection: items,
      //   totalPickupItems: totalQuantities,
      // ));
    }
  }

  conformationDialogBox(miniOrderValue) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Alert'),
        content: Text('Minimum order amount should be : ₹$miniOrderValue'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

