// import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
// import 'package:easy_rich_text/easy_rich_text.dart';
// import 'package:flutter/material.dart';

// class PendingPickupScreen extends StatelessWidget {
//   const PendingPickupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Pending Pickups'),
//       ),
//       body: Center(
//         child: Column(children: [
//           const SizedBox(
//             height: 230,
//           ),
//           Image.asset(
//             'asset/image/delivery.png',
//             height: 100,
//           ),
//           // Lottie.asset('asset/image/historys.json', height: 300),
//           const Height(20),
//           SizedBox(
//             width: 200,
//             child: EasyRichText(
//               'Assigned a pickup orders you will see here!',
//               // 'Any Pending pick-up orders showing here!',
//               textAlign: TextAlign.center,
//               patternList: [
//                 EasyRichTextPattern(
//                   targetString: 'will see here!',
//                   style: TextStyle(
//                     color: Colors.blue[900],
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_clocare_delivery_boy/backend/api/order_detail_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/pickup_api.dart';
import 'package:new_clocare_delivery_boy/backend/models/order_detail_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/pickup_model.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/buttom_navigation.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/pickup_detail_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/pickup_start_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/box/custom_card_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PendingPickupScreen extends StatefulWidget {
  PendingPickupScreen({super.key});

  @override
  State<PendingPickupScreen> createState() => _PendingPickupScreenState();
}

class _PendingPickupScreenState extends State<PendingPickupScreen> {
  PickupApi pickupApi = PickupApi();

  OrderDetailApi orderDetailApi = OrderDetailApi();

  bool isPickupStatus = false;

//     void _makePhoneCall(String phoneNumber) async {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pending Pickups'),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Get.to(const BottomNavigation()),
        ),
      ),
      body: Center(
        child: FutureBuilder<PickupModel>(
            future: pickupApi.getOrderData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var itemsData = snapshot.data!.data!.items;

                print('data has ${itemsData!.length}');
                if (itemsData.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asset/image/delivery.png',
                        height: 120,
                      ),
                      const Height(60),
                      SmallText(
                        text: 'No pending pickups at the moment.',
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
                      itemCount: itemsData!.length,
                      itemBuilder: (BuildContext context, int index) {
                        String orderId = itemsData[index].orderId.toString();
                        var pickupStatus =
                            itemsData[index].ordCurrentStgStatus.toString();
                        print(
                            'order start staus $orderId and status is $pickupStatus');
                        // if (itemsData[index].ordCurrentStgStatus.toString() =="<span class=\"success-txt\"><strong>Pickup person is on the way</strong></span>") {
                        //   isPickupStatus = true;
                        // }

                        //  bool isPickupStatus = pickupStatus == "<span class=\"success-txt\"><strong>Scheduled for Pickup</strong></span>" ? true : false;
                        return FutureBuilder<OrderModel>(
                            future: orderDetailApi.getOrderDetail(orderId),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var orderDetail = snapshot.data!.data;
                                var bookedBy =
                                    orderDetail!.orderInfo!.orderBookedBys;
                                var service = orderDetail.orderInfo!.service;
                                var orderType =
                                    orderDetail.orderInfo!.orderType;
                                var miniOrderValue = orderDetail
                                    .orderInfo!.orderType!.minOrdVal
                                    .toString();
                                String attempted = orderDetail
                                            .orderInfo!.pickupAttempts
                                            .toString() ==
                                        '0'
                                    ? ''
                                    : "${orderDetail.orderInfo!.pickupAttempts.toString()} times attempted";
                                String serviceId =
                                    orderDetail.orderInfo!.serviceId.toString();
                                return Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      CustomBox(
                                        orderId:
                                            '#${itemsData[index].orderDisplayId.toString()}',
                                        name: bookedBy!.name.toString(),
                                        mobileNo: bookedBy.mobile.toString(),
                                        services: service!.name.toString(),
                                        servicesType:
                                            orderType!.typeName.toString(),
                                        totalGarment: orderDetail
                                            .orderInfo!.totalItems
                                            .toString(),
                                        address: itemsData[index]
                                            .formattedDeliveryAddress
                                            .toString(),
                                        time: itemsData[index]
                                            .deliveryDate
                                            .toString(),
                                        attempted: attempted,
                                        starTOnPressed: () {
                                          Get.to(PickupStartScreen(
                                            orderId: orderId,
                                            address: itemsData[index].formattedDeliveryAddress.toString(),
                                            miniOrderValue: miniOrderValue,
                                            serviceId: serviceId,
                                          ));
                                        },
                                        detailsOnPressed: () {
                                          Get.to(PickupDetailScreen(
                                            orderId: orderId,
                                          ));
                                        },
                                        callButton: () {
                                          _makePhoneCall(
                                              bookedBy.mobile.toString());
                                        },
                                      ),
                                      const Height(10),
                                    ],
                                  ),
                                );
                              } else {
                                return const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Column(children: [LoadingCard()]));
                              }
                            });
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
    );
  }
}

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255),
              blurRadius: 1.0,
              spreadRadius: 1.0,
              offset: Offset(
                1.0,
                1.0,
              ),
            ),
          ],
          border: Border.all(color: const Color.fromARGB(255, 221, 221, 221)),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 190,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                ),
              ),
              const Height(5),
              const Divider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 25,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(3.0)),
                    ),
                  ),
                  const Height(5),
                  Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(3.0)),
                    ),
                  ),
                ],
              ),
              const Height(5),
              const Divider(),
              const Height(10),
              Container(
                height: 60,
                // width:200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                ),
              ),
              const Height(5),
              const Divider(),
              const Height(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3.0)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Height(10),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
                            ),
                      ),
                      child: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SmallText(
                              text: '    ',
                              color: Colors.white,
                              fontweights: FontWeight.w500,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
                            ),
                      ),
                      child: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SmallText(
                              text: '     ',
                              color: Colors.white,
                              fontweights: FontWeight.w500,
                            )),
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //   onPressed: () {
                  //     starTOnPressed();
                  //   },
                  //   style: ButtonStyle(
                  //     elevation: const MaterialStatePropertyAll(1),
                  //     backgroundColor:
                  //         MaterialStateProperty.all(AppColor.primaryColor1),
                  //   ),
                  //   child: const Text('Start'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     detailsOnPressed();
                  //   },
                  //   style: ButtonStyle(
                  //     elevation: const MaterialStatePropertyAll(1),
                  //     backgroundColor:
                  //         MaterialStateProperty.all(AppColor.primaryColor2),
                  //   ),
                  //   child: const Text('Details'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     deliveryOnPressed();
                  //   },
                  //   style: ButtonStyle(
                  //     elevation: MaterialStatePropertyAll(1),
                  //     backgroundColor:
                  //         MaterialStateProperty.all(Colors.green.shade500),
                  //   ),
                  //   child: Text('Deliver'),
                  // ),
                ],
              )
            ],
          ),
        ));
  }
}
