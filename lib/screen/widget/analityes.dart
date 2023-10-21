// import 'package:flutter/material.dart';
// // import 'package:linktyp/backend/api/product_api.dart';
// // import 'package:linktyp/backend/models/user_data.dart';
// // import 'package:linktyp/utiles/small_text.dart';
// // import 'package:pie_chart/pie_chart.dart';

// class Analytics extends StatefulWidget {
//   const Analytics({super.key});

//   @override
//   State<Analytics> createState() => _AnalyticsState();
// }

// class _AnalyticsState extends State<Analytics> {
//   // ProductApi productApi = ProductApi();

//   List<Color> pieColor = [
//     Color.fromARGB(255, 70, 163, 240),
//     Color.fromARGB(255, 23, 170, 196),
//     Colors.purple,
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration:  BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(12)),
        
//         // only(
//         //   bottomLeft: Radius.circular(30),
//         //   bottomRight: Radius.circular(30),
//         // ),
//         // color:  Color.fromARGB(255, 110, 171, 221),
//         gradient: LinearGradient(
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//             colors: [
//               Colors.white,
//               Color.fromARGB(179, 247, 80, 136),
//             ]),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF979797).withOpacity(0.4),
//             spreadRadius: 0.5,
//             blurRadius: 0.5,
//             offset: const Offset(0, 0.5),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding:
//             const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 50),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FutureBuilder<Userdata>(
//               future: productApi.getProductsApi(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return PieChart(
//                     chartRadius: 180,
//                     dataMap: {
//                       "Views": double.parse(snapshot
//                           .data!.data![0].dashboard!.websiteview
//                           .toString()),
//                       "Clicks": double.parse(snapshot
//                           .data!.data![0].dashboard!.containerclick
//                           .toString()),
//                       "Product": double.parse(snapshot
//                           .data!.data![0].dashboard!.productclick
//                           .toString()),
//                     },
//                     animationDuration: const Duration(milliseconds: 1000),
//                     colorList: pieColor,
//                     chartLegendSpacing: 22,
//                     legendOptions: const LegendOptions(
//                       legendPosition: LegendPosition.right,
//                       legendTextStyle: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                           fontSize: 10),
//                     ),
//                   );
//                 } else {
//                   return const CircularProgressIndicator();
//                 }
//               },
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 FutureBuilder<Userdata>(
//                   future: productApi.getProductsApi(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return box(
//                         title: 'Link click',
//                         icon: Icons.remove_red_eye,
//                         data: snapshot.data!.data![0].dashboard!.containerclick
//                             .toString(),
//                         bgcolor: Color.fromARGB(255, 23, 170, 196),
//                         backgroundColor: Color.fromARGB(45, 28, 190, 219),
//                       );
//                     } else {
//                       return const CircularProgressIndicator();
//                     }
//                   },
//                 ),
//                 FutureBuilder<Userdata>(
//                   future: productApi.getProductsApi(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return box(
//                         title: 'Website view',
//                         icon: Icons.ads_click,
//                         data: snapshot.data!.data![0].dashboard!.websiteview
//                             .toString(),
//                         bgcolor: Colors.blue,
//                         backgroundColor: Color.fromARGB(43, 33, 149, 243),
//                       );
//                     } else {
//                       return const CircularProgressIndicator();
//                     }
//                   },
//                 ),
//                 FutureBuilder<Userdata>(
//                   future: productApi.getProductsApi(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return box(
//                         title: 'Product click',
//                         icon: Icons.remove_red_eye,
//                         data: snapshot.data!.data![0].dashboard!.productclick
//                             .toString(),
//                         bgcolor: Colors.purple,
//                         backgroundColor: Color.fromARGB(31, 155, 39, 176),
//                       );
//                     } else {
//                       return const CircularProgressIndicator();
//                     }
//                   },
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class box extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String data;
//   final Color bgcolor;
//   final Color backgroundColor;

//   const box({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.data,
//     required this.bgcolor,
//     required this.backgroundColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 90,
//       width: 90,
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(
//           color: bgcolor,
//           style: BorderStyle.solid,
//           width: 1.0,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Icon(
//             icon,
//             size: 20,
//             color: Colors.black,
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           SmallText(
//             text: data,
//             color: bgcolor,
//             size: 15,
//             fontweights: FontWeight.w500,
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: 10, color: Colors.black, fontWeight: FontWeight.w600),
//           ),
//         ]),
//       ),
//     );
//   }
// }
