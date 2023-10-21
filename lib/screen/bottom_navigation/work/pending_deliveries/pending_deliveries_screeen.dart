import 'package:new_clocare_delivery_boy/backend/api/delivery_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/order_detail_api.dart';
import 'package:new_clocare_delivery_boy/backend/models/delivery_order_model.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/buttom_navigation.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/pending_deliveries_detail_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/deliverie_start_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/box/custom_card_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PendingDeliveriesScreen extends StatefulWidget {
  PendingDeliveriesScreen({super.key});

  @override
  State<PendingDeliveriesScreen> createState() =>
      _PendingDeliveriesScreenState();
}

class _PendingDeliveriesScreenState extends State<PendingDeliveriesScreen> {
  DeliveryApi deliveryApi = DeliveryApi();

  OrderDetailApi orderDetailApi = OrderDetailApi();

  Future<void> _makePhoneCall(String phoneNumber) async {
    final phoneUrl = 'tel:${phoneNumber.trim()}';
    final Uri _url = Uri.parse(phoneUrl);
    print('phone callssssss $_url fffffffffff  $phoneUrl and $phoneNumber');

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }

    // if (await canLaunch(phoneUrl)) {
    //   await launch(phoneUrl);
    // } else {
    //   throw 'Could not launch $phoneUrl';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Pending Deliveries'),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Get.to(const BottomNavigation()),
        ),
      ),
      body: Center(
        child: FutureBuilder<DeliverOrderModel>(
            future: deliveryApi.pendingDeliverOrderList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var itemsData = snapshot.data!.data!;
                if (itemsData.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asset/image/pd.png',
                        height: 120,
                      ),
                      const Height(60),
                      SmallText(
                        text: 'No pending deliveries at the moment.',
                        size: 14,
                      ),
                      const Height(6),
                      SmallText(
                        text: 'Stay prepared for upcoming orders!',
                        color: AppColor.primaryColor1,
                        fontweights: FontWeight.w500,
                        size: 13,
                      ),
                      const Height(60),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: itemsData.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = itemsData[index];
                        String orderId = data.orderId.toString();
                        String orderDisplayId = data.orderDisplayId.toString();
                        String name = data.customer!.firstname.toString() + data.customer!.lastname.toString();
                        String mobileNo = data.customer!.mobile.toString();
                        String service = data.service!.name.toString();
                        String servicesType =data.orderType!.typeName.toString();
                        String address =
                            data.formattedDeliveryAddress.toString();
                        String time = data.deliveryDate.toString();
                        String attempted = data.deliveryAttempts.toString() ==
                                '0'
                            ? ''
                            : '${data.deliveryAttempts.toString()} times attempted';
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            children: [
                              CustomBox(
                                orderId: orderDisplayId,
                                name: name,
                                mobileNo: mobileNo,
                                services: service,
                                servicesType: servicesType,
                                totalGarment: '12',
                                address: address,
                                time: time,
                                attempted: attempted,
                                starTOnPressed: () {
                                  {
                                    Get.to(DeliveriesStartScreen(
                                        address: address, orderId: orderId));
                                  }
                                },
                                detailsOnPressed: () {
                                  print('orderId $orderId');

                                  Get.to(PendingDeliveriesDetailScreen(
                                      orderId: orderId));
                                },
                                callButton: () {
                                  _makePhoneCall(mobileNo);
                                },
                              ),
                              const Height(10),
                            ],
                          ),
                        );

                        //  FutureBuilder<OrderModel>(
                        //     future: orderDetailApi.getOrderDetail(orderId),
                        //     builder: (context, snapshot) {
                        //       if (snapshot.hasData) {
                        //         var orderDetail = snapshot.data!.data;
                        //         var bookedBy =
                        //             orderDetail!.orderInfo!.orderBookedBy;
                        //         var service = orderDetail.orderInfo!.service;
                        //         var orderType = orderDetail.orderInfo!.orderType;
                        //         return Padding(
                        //           padding: const EdgeInsets.all(12),
                        //           child: Column(
                        //             children: [
                        //               CustomBox(
                        //                 orderId:
                        //                     '#${itemsData[index].orderDisplayId.toString()}',
                        //                 name: bookedBy!.name.toString(),
                        //                 mobileNo: bookedBy.mobile.toString(),
                        //                 services: service!.name.toString(),
                        //                 servicesType:
                        //                     orderType!.typeName.toString(),
                        //                 totalGarment: orderDetail
                        //                     .orderInfo!.totalItems
                        //                     .toString(),
                        //                 address: itemsData[index]
                        //                     .formattedDeliveryAddress
                        //                     .toString(),
                        //                 time: itemsData[index]
                        //                     .deliveryDate
                        //                     .toString(),
                        //                 starTOnPressed: () {
                        //                   {
                        //                     Get.to(PendingDeliveriesStartScreen(
                        //                       address: address,
                        //                     ));
                        //                   }
                        //                 },
                        //                 detailsOnPressed: () {
                        //                   {
                        //                     Get.to(PendingDeliveriesDetailScreen(
                        //                         orderId: orderId));
                        //                   }
                        //                 },
                        //               ),
                        //               const Height(10),
                        //             ],
                        //           ),
                        //         );
                        //       } else {
                        //         return LoadingAnimationWidget.fourRotatingDots(
                        //           color: AppColor.primaryColor2,
                        //           size: 60,
                        //         );
                        //       }
                        //     });
                      });
                }
              } else {
                return LoadingAnimationWidget.fourRotatingDots(
                  color: AppColor.primaryColor2,
                  size: 60,
                );
              }
            }),
      ),

      // body: Center(
      //   child: FutureBuilder<DeliveryModel>(
      //       future: deliveryApi.getDeliveryData(),
      //       builder: (context, snapshot) {
      //         if (snapshot.hasData) {
      //           var itemsData = snapshot.data!.data!.items;
      //           return ListView.builder(
      //               itemCount: itemsData!.length,
      //               itemBuilder: (BuildContext context, int index) {
      //                 String orderId = itemsData[index].orderId.toString();
      //                 String address = itemsData[index].formattedDeliveryAddress.toString();
      //                 return

      //                 Padding(
      //                   padding: const EdgeInsets.all(12),
      //                   child: Column(
      //                     children: [

      //                       // CustomBox(
      //                       //   orderId: '#${itemsData[index].orderDisplayId.toString()}',
      //                       //   name: 'Wastik Ansari',
      //                       //   mobileNo: '8327712456',
      //                       //   services: 'WASH & DRY',
      //                       //   address: '',
      //                       //   servicesType:'Daily service (Total Garments: 17)',
      //                       //   address: itemsData[index].formattedDeliveryAddress.toString(),
      //                       //   time: itemsData[index].deliveryDate.toString(),
      //                       //   starTOnPressed: () {Get.to( PendingDeliveriesStartScreen(address: address,));},
      //                       //   detailsOnPressed: () { Get.to(PendingDeliveriesDetailScreen(orderId: orderId));},
      //                       // ),
      //                       const Height(10),
      //                     ],
      //                   ),
      //                 );
      //               });
      //         } else {
      //           return LoadingAnimationWidget.fourRotatingDots(
      //             color: AppColor.primaryColor2,
      //             size: 60,
      //           );
      //         }
      //       }),
      // ),
    );
  }
}

// class CustomBox extends StatelessWidget {
//   final String orderId;
//   final String name;
//   final String mobileNo;
//   final String services;
//   final String servicesType;
//   final String address;
//   final String time;
//   final Function starTOnPressed;
//   // final Function deliveryOnPressed;
//   final Function detailsOnPressed;
//   const CustomBox({
//     super.key,
//     required this.orderId,
//     required this.name,
//     required this.mobileNo,
//     required this.services,
//     required this.servicesType,
//     required this.address,
//     required this.time,
//     required this.starTOnPressed,
//     // required this.deliveryOnPressed,
//     required this.detailsOnPressed,
//     // required this.startTap,
//     // required this.deliverTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // height: 200,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 228, 241, 252),
//           // Color.fromARGB(255, 243, 243, 243),
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
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // BigText(
//                   //   text: 'Address : ',
//                   //   size: 14,
//                   //   fontweights: FontWeight.w500,
//                   // ),
//                   SizedBox(
//                       // color: Colors.white,
//                       height: 60,
//                       width: 250,
//                       child: Text(
//                         address,
//                         maxLines: 3,
//                         style: const TextStyle(
//                             // fontWeight: FontWeight.w500,
//                             fontSize: 13,
//                             color: Colors.black45),
//                       )),
//                 ],
//               ),
//               const Height(10),
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.watch_later_outlined,
//                     size: 20,
//                   ),
//                   const Widths(8),
//                   BigText(
//                     text: time,
//                     size: 14,
//                   ),
//                 ],
//               ),
//               const Height(10),
//               const Divider(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         starTOnPressed();
//                       },
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           color: Color.fromARGB(229, 51, 106, 188),
//                           borderRadius: BorderRadius.all(Radius.circular(
//                                   5.0) //                 <--- border radius here
//                               ),
//                         ),
//                         child: Center(
//                           child: Padding(
//                               padding: const EdgeInsets.all(12),
//                               child: SmallText(
//                                 text: 'Start',
//                                 color: Colors.white,
//                                 fontweights: FontWeight.w500,
//                               )),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         detailsOnPressed();
//                       },
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           color: Color.fromARGB(203, 70, 178, 236),
//                           borderRadius: BorderRadius.all(Radius.circular(
//                                   5.0) //                 <--- border radius here
//                               ),
//                         ),
//                         child: Center(
//                           child: Padding(
//                               padding: const EdgeInsets.all(12),
//                               child: SmallText(
//                                 text: 'Details',
//                                 color: Colors.white,
//                                 fontweights: FontWeight.w500,
//                               )),
//                         ),
//                       ),
//                     ),
//                   ),

//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     starTOnPressed();
//                   //   },
//                   //   style: ButtonStyle(
//                   //     elevation: const MaterialStatePropertyAll(1),
//                   //     backgroundColor:
//                   //         MaterialStateProperty.all(AppColor.primaryColor1),
//                   //   ),
//                   //   child: const Text('Start'),
//                   // ),
//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     detailsOnPressed();
//                   //   },
//                   //   style: ButtonStyle(
//                   //     elevation: const MaterialStatePropertyAll(1),
//                   //     backgroundColor:
//                   //         MaterialStateProperty.all(AppColor.primaryColor2),
//                   //   ),
//                   //   child: const Text('Details'),
//                   // ),
//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     deliveryOnPressed();
//                   //   },
//                   //   style: ButtonStyle(
//                   //     elevation: MaterialStatePropertyAll(1),
//                   //     backgroundColor:
//                   //         MaterialStateProperty.all(Colors.green.shade500),
//                   //   ),
//                   //   child: Text('Deliver'),
//                   // ),
//                 ],
//               )
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
