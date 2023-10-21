import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/order_deliver_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class CompleteOrderScreen extends StatefulWidget {
  CompleteOrderScreen({super.key});

  @override
  State<CompleteOrderScreen> createState() => _CompleteOrderScreenState();
}

class _CompleteOrderScreenState extends State<CompleteOrderScreen> {
  TextEditingController couponCode = TextEditingController();

  bool isApply = false;

  applyCouponCode() async {
    String couponCodes = couponCode.text;
    if (couponCodes.isEmpty) {
      showCustomSnackBar(
          title: 'Coupon Code', 'Please enter valid coupon code');
    } else {
      setState(() {
        isApply = true;
      });
    }

    Timer(const Duration(seconds: 4), () {
      setState(() {
        isApply = false;
      });
    });
  }

  proceedtoPay(){
    
  }
  
    errorDialogBox(status, msg) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(status),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Complete Order'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Height(10),
              BigText(
                text: 'Customer Detail',
                fontweights: FontWeight.w500,
                size: 16,
              ),
              const Height(8),
              const CustomerDetailWidget(
                name: 'Wastik Ansari',
                mobileNumber: '8327724967',
                createData: '2023-07-21',
              ),
              const Height(10),
              BigText(
                text: 'Order Detail',
                fontweights: FontWeight.w500,
                size: 16,
              ),
              const Height(8),
              const CustomerOrderDetailWidget(
                services: 'Regular Ironing',
                servicesType: 'Quick service',
                pickupData: '21-07-2023',
                deliveryData: '22-07-2023',
              ),
              const Height(20),
              BigText(
                text: 'Bill Details',
                fontweights: FontWeight.w500,
                size: 16,
              ),
              const Height(8),
              const BillingWidget(
                garments: '₹120.00',
                servicesCharge: '₹2.50',
                deliverCharge: '₹30.00',
                totalBill: '₹152.50',
              ),
              const Height(20),
              BigText(
                text: 'Offers & Benefits',
                fontweights: FontWeight.w500,
                size: 16,
              ),
              const Height(8),
              // const CouponWidget(),

              Container(
                width: double.infinity,
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
                  border: Border.all(
                      color: const Color.fromARGB(255, 221, 221, 221)),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 200,
                            child: TextField(
                              controller: couponCode,
                              decoration: const InputDecoration(
                                // border: OutlineInputBorder(),
                                hintText: 'Coupon code',
                                hintStyle: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                          isApply == true
                              ? Center(
                                  child:
                                      LoadingAnimationWidget.fourRotatingDots(
                                  color: AppColor.primaryColor1,
                                  size: 20,
                                ))
                              : TextButton(
                                  onPressed: () {
                                    applyCouponCode();
                                  },
                                  child: SmallText(
                                    text: 'Apply',
                                    color: AppColor.primaryColor1,
                                    fontweights: FontWeight.w500,
                                  ))
                          // SmallText(text: garments),
                        ],
                      ),
                      const Divider(),
                      const Height(4),
                      SmallText(
                          text: 'please enter valid offers code get discount'),
                      // const Height(8),
                    ],
                  ),
                ),
              ),

              const Height(8),
              const Height(20),
              BigText(
                text: 'Payment mode',
                fontweights: FontWeight.w500,
                size: 16,
              ),
              const Height(8),
              CustumListTile(
                title: "Pay using Wallet",
                icon: const Icon(Icons.wallet),
                onTap: () {
                  print('tap');
                  // Get.to( ChangePasswordScreen());
                },
              ),
              // const Height(4),
              CustumListTile(
                title: "Pay using Online",
                icon: const Icon(Icons.upcoming),
                onTap: () {
                  print('tap');
                   errorDialogBox('Online pay', 'Payment using online features is not enabled');
                },
              ),
              // const Height(8),
              CustumListTile(
                title: "Send me bill at end of month",
                icon: const Icon(Icons.note_alt_outlined),
                onTap: () {
                  // print('tap');
                  // Get.to( ChangePasswordScreen());
                },
              ),
              // const Height(20),
              // Row(
              //   children: [
              //     Expanded(
              //       child: buttomWidget(
              //         text: 'Collect Cash',
              //         onTaps: () {
              //           // Get.to(CollectMoneyScreen());
              //         },
              //       ),
              //     ),
              //     const Widths(8),
              //     Expanded(
              //       child: buttomWidget(
              //         text: 'Cancel',
              //         backgroundColor: const Color.fromARGB(255, 199, 50, 39),
              //         onTaps: () {
              //           // Get.to(const OnlinePaymentScreen());
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // const Height(25),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 90,
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
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmallText(
                text: '₹152.50',
                size: 20,
                color: Colors.black,
                // color: AppColor.primaryColor1,
                fontweights: FontWeight.bold,
              ),
              const Widths(85),
              Expanded(
                child: buttomWidget(
                  text: 'Proceed to Pay',
                  onTaps: () {
                    // Get.to(CollectMoneyScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BillingWidget extends StatelessWidget {
  final String garments;
  final String servicesCharge;
  final String deliverCharge;
  final String totalBill;
  const BillingWidget({
    super.key,
    required this.garments,
    required this.servicesCharge,
    required this.deliverCharge,
    required this.totalBill,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Garments :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(text: garments),
              ],
            ),
            const Height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Services charge :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(text: servicesCharge),
              ],
            ),
            const Height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Deliver charge :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(text: deliverCharge),
              ],
            ),
            const Height(8),
            const Divider(),
            const Height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Total Bill :',
                  fontweights: FontWeight.w500,
                  color: Colors.black,
                ),
                SmallText(
                  text: totalBill,
                  fontweights: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class CouponWidget extends StatelessWidget {
//   // final String garments;
//   // final String servicesCharge;
//   // final String deliverCharge;
//   // final String totalBill;
//   const CouponWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: const [
//           BoxShadow(
//             color: Color.fromARGB(255, 244, 244, 244),
//             blurRadius: 1.0,
//             spreadRadius: 1.0,
//             offset: Offset(
//               1.0,
//               1.0,
//             ),
//           ),
//         ],
//         border: Border.all(color: const Color.fromARGB(255, 221, 221, 221)),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(7),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // SmallText(
//                 //   text: 'Coupon code',
//                 //   fontweights: FontWeight.w500,
//                 //   color: Colors.black87,
//                 // ),
//                 const SizedBox(
//                   height: 40,
//                   width: 100,
//                   child: TextField(
//                     controller: ,
//                     decoration: InputDecoration(
//                       // border: OutlineInputBorder(),
//                       hintText: 'Coupon code',
//                     ),
//                   ),
//                 ),
//                 TextButton(onPressed: () {}, child: const Text('Apply'))
//                 // SmallText(text: garments),
//               ],
//             ),
//             const Divider(),
//             const Height(4),
//             SmallText(text: 'please enter valid offers code get discount'),
//             // const Height(8),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CustomerDetailWidget extends StatelessWidget {
  final String name;
  final String mobileNumber;
  final String createData;
  const CustomerDetailWidget({
    super.key,
    required this.name,
    required this.mobileNumber,
    required this.createData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Name :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(text: name),
              ],
            ),
            const Height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Mobile No :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(text: mobileNumber),
              ],
            ),
            const Height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Create Data :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(text: createData),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerOrderDetailWidget extends StatelessWidget {
  final String services;
  final String servicesType;
  final String pickupData;
  final String deliveryData;
  const CustomerOrderDetailWidget({
    super.key,
    required this.services,
    required this.servicesType,
    required this.pickupData,
    required this.deliveryData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Services :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(
                  text: services,
                ),
              ],
            ),
            const Height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Services type :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(text: servicesType),
              ],
            ),
            const Height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Pickup Date :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(text: pickupData),
              ],
            ),
            const Height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: 'Delivery Date :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(text: deliveryData),
              ],
            ),
            const Height(8),
          ],
        ),
      ),
    );
  }
}


// class CustomerWidget extends StatelessWidget {
//   const CustomerWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: const [
//           BoxShadow(
//             color: Color.fromARGB(255, 244, 244, 244),
//             blurRadius: 1.0,
//             spreadRadius: 1.0,
//             offset: Offset(
//               1.0,
//               1.0,
//             ),
//           ),
//         ],
//         border: Border.all(color: const Color.fromARGB(255, 221, 221, 221)),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(7),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SmallText(
//                   text: 'Services :',
//                   fontweights: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//                 SmallText(text: 'Regular'),
//               ],
//             ),
//             const Height(8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SmallText(
//                   text: 'Services type :',
//                   fontweights: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//                 SmallText(text: 'Daily services'),
//               ],
//             ),
//             const Height(8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SmallText(
//                   text: 'Pickup Date :',
//                   fontweights: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//                 SmallText(text: '12-Jul-2023'),
//               ],
//             ),
//             const Height(8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SmallText(
//                   text: 'Delivery Date :',
//                   fontweights: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//                 SmallText(text: '12-Jul-2023'),
//               ],
//             ),
//             const Height(8),
//           ],
//         ),
//       ),
//     );
//   }
// }
