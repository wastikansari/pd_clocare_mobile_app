import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/customer_wallet_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/order_detail_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/pickup_api.dart';
import 'package:new_clocare_delivery_boy/backend/models/order_detail_model.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/online_payment.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/order_deliver_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/collected_money_pickup_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/pending_pickup_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class CompletePickupOrderScreen extends StatefulWidget {
  final String orderId;
  final double totalPrice;
  final int totalPickupItems;
  final List garmentCollection;
  const CompletePickupOrderScreen(
      {super.key,
      required this.orderId,
      required this.totalPrice,
      required this.garmentCollection,
      required this.totalPickupItems});

  @override
  State<CompletePickupOrderScreen> createState() =>
      _CompletePickupOrderScreenState();
}

class _CompletePickupOrderScreenState extends State<CompletePickupOrderScreen> {
  TextEditingController couponCode = TextEditingController();
  OrderDetailApi orderDetailApi = OrderDetailApi();
  PickupApi pickupApi = PickupApi();
  CustomerWalletApi customerWalletApi = CustomerWalletApi();

  bool isApply = false;
  bool isLoading = false;
  bool isBalanceLoading = false;
  bool isProceed = false;
  bool isTrue = false;
  String customerId = '';
  String customerName = '';
  String customerMobileNo = '';
  String customerOrderDisplayId = '';
  String status = '';
  String customerServices = '';
  String customerServicesType = '';
  String customerPickupData = '';
  String customerDeliveryData = '';
  String serviceCharge = '';
  double totalBill = 0.0;
  double deliverCharge = 0.0;
  String customerWalletBalance = '';
  var orderInfoData;
  int? orderStageId;
  int unpaidAmount = 0;

  File? _pickedFile;
  // CroppedFile? _croppedFile;
  final List _prodctImageList = [];
  final picker = ImagePicker();

  customerWallet(customerId) async {
    setState(() {
      isBalanceLoading = true;
    });
    print('customer wallet function is call $customerId');
    await customerWalletApi.getCustomerBalance(customerId).then((value) {
      setState(() {
        isBalanceLoading = false;
        customerWalletBalance = value.data!.balance.toString();
      });
      collectMoney();
    });
  }

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

    await Timer(const Duration(seconds: 4), () {
      setState(() {
        isApply = false;
      });
    });
  }

  Future<void> getOrderDetail() async {
    setState(() {
      isLoading = true;
    });
    await orderDetailApi.getOrderDetail(widget.orderId).then((value) {
      if (value.success == true) {
        var orderData = value.data;

        setState(() {
          customerOrderDisplayId =
              orderData!.orderInfo!.orderDisplayId.toString();
          customerName = orderData.orderInfo!.orderBookedBys!.name.toString();
          customerMobileNo =
              orderData.orderInfo!.orderBookedBys!.mobile.toString();
          customerServices = orderData.orderInfo!.service!.name.toString();
          customerServicesType =
              orderData.orderInfo!.orderType!.typeName.toString();
          customerPickupData = orderData.orderInfo!.pickupDate.toString();
          customerDeliveryData = orderData.orderInfo!.deliveryDate.toString();
          status = orderData.orderInfo!.status.toString();
          customerPickupData = orderData.orderInfo!.pickupDate.toString();
          serviceCharge = orderData.orderInfo!.rateMultiplier.toString();
          billing(orderData.orderInfo!.rateMultiplier.toString());
          customerId = orderData.orderInfo!.customerId.toString();
          orderInfoData = orderData.orderInfo;
          orderStageId = orderData.orderInfo!.orderWiseStages![0].orderstageId;

          // status = orderData.orderInfo!.status.toString();
          // address = orderData.orderInfo!.formattedDeliveryAddress.toString();
          // date = orderData.orderInfo!.deliveryDate.toString();
          isLoading = false;
        });
        print('vvvvvvvvvvvvvvvvvvvvvv $customerId');
        customerWallet(customerId);
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderDetail();
  }

  billing(serviceCharges) {
    double garmentAmount = widget.totalPrice;
    double sCharge = double.parse(serviceCharges.toString());
    double total = garmentAmount * sCharge;
    print('billing $garmentAmount x $sCharge = $total');
    if (total < 90.0) {
      setState(() {
        deliverCharge = 30;
      });
    }
    total = total + deliverCharge;
    print('billing $total + $deliverCharge = $total');
    setState(() {
      totalBill = total;
    });
  }

  helpBox(double totalPrice, String serviceCharge, double deliverCharge,
      double totalBill) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Billing Details Help ?'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text: 'Garments :'),
                  const Height(4),
                  SmallText(text: '₹$totalPrice')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text: ''),
                  const Height(4),
                  SmallText(text: 'x')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text: 'Services charge :'),
                  const Height(4),
                  SmallText(text: '₹$serviceCharge')
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text: 'Sub total :'),
                  const Height(4),
                  SmallText(
                      text: '₹${totalPrice * double.parse(serviceCharge)}')
                ],
              ),
              const Height(8),
              SmallText(
                text: 'Your order less then ₹90 then deliverey charge + ₹30',
                overFlow: TextOverflow.visible,
              ),
              const Height(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text: 'Delivery charge :'),
                  const Height(4),
                  SmallText(text: '+ ₹$deliverCharge')
                ],
              ),
              const Divider(
                color: Colors.black54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                    text: 'Total bill :',
                    color: Colors.black87,
                    fontweights: FontWeight.w500,
                  ),
                  const Height(4),
                  SmallText(
                    text: '₹$totalBill',
                    color: Colors.black87,
                    fontweights: FontWeight.w500,
                  )
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    //     showDialog<String>(
    //   context: context,
    //   builder: (BuildContext context) => AlertDialog(
    //     title: const Text('Help ?'),
    //     content: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         const Text('Minimum order amount should be : ₹'),
    //         Text('Minimum order amount should be : ₹'),
    //       ],
    //     ),
    //     actions: <Widget>[
    //       TextButton(
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //         child: const Text('OK'),
    //       ),
    //     ],
    //   ),
    // );
  }

  Future<void> complitPickup() async {
    var orderId = widget.orderId;
    var orderstageId = orderStageId;
    List orderItems = widget.garmentCollection;
    var Orders = orderInfoData;
    var bagInfo = [
      {"bagno": "1"}
    ];
    var totalPickedItems = 5;
    var totalItems = 5;
    var stageComments = '';
    var modeOfPayment = '';
    var finalAddedMoney = '';
    var referral = '';

    if (_prodctImageList.isEmpty) {
      showCustomSnackBar(
          title: 'Clothes Images', 'Please upload clothes images');
    } else {
      setState(() {
        isProceed = true;
      });
      await pickupApi
          .pickupDone(
              orderId,
              orderstageId,
              orderItems,
              Orders,
              bagInfo,
              totalPickedItems,
              totalItems,
              stageComments,
              modeOfPayment,
              finalAddedMoney,
              referral)
          .then((value) {
        if (value.success == true) {
          if (value.data!.status == 'ok') {
            setState(() {
              isProceed = false;
            });
            conformDialogBox(value.data!.msg);
          } else {
            errorDialogBox(
                value.data!.status.toString(), value.data!.msg.toString());
          }
        } else {
          setState(() {
            isProceed = false;
          });

          showCustomSnackBar(title: 'Error', 'Network request to fail');
        }

        setState(() {
          isProceed = false;
        });
      });
    }
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

  conformDialogBox(msg) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Order Status'),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () =>  Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>  PendingPickupScreen()),
              ((route) => false)),

            // Get.to(PendingPickupScreen()),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  collectMoney() {
    double garmentBill = totalBill;
    double cBalance = double.parse(customerWalletBalance.trim());

    if (garmentBill.toInt() > cBalance.toInt()) {
      double total = garmentBill - cBalance;
      int amountAdd = total.toInt();
      setState(() {
        isTrue = true;
        unpaidAmount = amountAdd;
      });
    }
  }

  Future<void> _refreshMethod() {
    return getOrderDetail();
  }

  Future<void> _uploadImgCamera() async {
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    final img = File(image.path);

    setState(() {
      _prodctImageList.add(img);
    });
  }

  Future<void> payOnDelivery() async {
    setState(() {
      orderInfoData.payLater = 1;
    });
    getOrderDetail();
    var orderId = widget.orderId;
    var orderstageId = orderStageId;
    List orderItems = widget.garmentCollection;
    var Orders = orderInfoData;
    var bagInfo = [
      {"bagno": "1"}
    ];
    var totalPickedItems = widget.totalPickupItems;
    var totalItems = widget.totalPickupItems;
    var stageComments = '';
    var modeOfPayment = '';
    var finalAddedMoney = '';
    var payLater = 1;
    var referral = '';

    if (_prodctImageList.isEmpty) {
      showCustomSnackBar(
          title: 'Clothes Images', 'Please upload clothes images');
    } else {
      setState(() {
        isProceed = true;
      });
      await pickupApi
          .pickupDone(
              orderId,
              orderstageId,
              orderItems,
              Orders,
              bagInfo,
              totalPickedItems,
              totalItems,
              stageComments,
              modeOfPayment,
              finalAddedMoney,
              referral)
          .then((value) {
        if (value.success == true) {
          if (value.data!.status == 'ok') {
            setState(() {
              isProceed = false;
            });
            conformDialogBox(value.data!.msg);
          } else {
            errorDialogBox(
                value.data!.status.toString(), value.data!.msg.toString());
          }
        } else {
          setState(() {
            isProceed = false;
          });

          showCustomSnackBar(title: 'Error', 'Network request to fail');
        }

        setState(() {
          isProceed = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Complete Order'),
        elevation: 2,
      ),
      body: isLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: AppColor.primaryColor2,
                size: 60,
              ),
            )
          : SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: _refreshMethod,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Height(5),

                      const DisplayText(text: 'Customer Detail'),
                      const Height(8),
                      CustomerDetailWidget(
                        name: customerName,
                        mobileNumber: customerMobileNo,
                      ),
                      const Height(15),
                      CollectionWidget(
                        status: status,
                        subtotalBill: totalBill.toString(),
                        walletBalance: customerWalletBalance,
                      ),
                      const Height(15),
                      const DisplayText(text: 'Clothes Images'),
                      const Height(3),
                      SmallText(
                        text: 'Max 5 images upload',
                        size: 10,
                      ),

                      const Height(8),
                      Container(
                          alignment: Alignment.center,
                          height: 115,
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
                                color:
                                    const Color.fromARGB(255, 221, 221, 221)),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: addProductImages(),
                          )),

                      const Height(15),
                      const DisplayText(text: 'Order Detail'),
                      const Height(8),
                      CustomerOrderDetailWidget(
                        orderDisplayId: "#$customerOrderDisplayId",
                        // orderStatus: status,
                        services: customerServices,
                        servicesType: customerServicesType,
                        pickupData: customerPickupData,
                        deliveryData: customerDeliveryData,
                      ),
                      const Height(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const DisplayText(text: 'Bill Details'),
                          TextButton(
                            onPressed: () {
                              helpBox(widget.totalPrice, serviceCharge,
                                  deliverCharge, totalBill);
                            },
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SmallText(
                                text: 'Help?',
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Height(8),
                      BillingWidget(
                        garments: '₹${widget.totalPrice}',
                        servicesCharge: '₹$serviceCharge',
                        deliverCharge: '₹$deliverCharge',
                        totalBill: '₹$totalBill',
                        totalItems: widget.totalPickupItems.toString(),
                      ),
                      const Height(15),
                      const DisplayText(text: 'Offers & Benefits'),
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
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          child: LoadingAnimationWidget
                                              .fourRotatingDots(
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
                                text:
                                    'Please enter valid offers code get discount',
                                size: 10,
                                color: AppColor.primaryColor2,
                              ),
                              // const Height(8),
                            ],
                          ),
                        ),
                      ),

                      const Height(8),
                      const Height(15),
                      const DisplayText(text: 'Payment mode'),
                      const Height(3),
                      SmallText(
                        text: 'Collect cash from the customer',
                        size: 10,
                      ),

                      const Height(8),
                      CustumListTile(
                        title: "Collect Cash",
                        icon: const Icon(Icons.currency_rupee_rounded),
                        onTap: () {
                          // int unpaidAmount = collectMoney();

                          Get.to(CollectMoneyPickupScreen(
                            unpaidAmount: unpaidAmount,
                            customerIds: customerId.toString(),
                            orderId: widget.orderId,
                            garmentCollection: widget.garmentCollection,
                            totalPrice: widget.totalPrice,
                            totalPickupItems: widget.totalPickupItems,
                          ));
                        },
                      ),
                      CustumListTile(
                        title: "Pay using Online",
                        icon: const Icon(Icons.upcoming),
                        onTap: () {
                          print('tap');
                          // Get.to(const OnlinePaymentScreen());
                          errorDialogBox('Online pay', 'Payment using online features is not enabled');
                        },
                      ),
                      CustumListTile(
                        title: "Mark as Pay on Delivery",
                        icon: const Icon(Icons.note_alt_outlined),
                        onTap: () {
                          payOnDelivery();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: isTrue ? 100 : 80,
        child: Column(
          children: [
            Visibility(
              visible: isTrue,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SmallText(
                  text: 'Ask customer to add ₹$unpaidAmount to wallet.',
                  fontweights: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              child: Container(
                // width: double.infinity,
                // height: 75,
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
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      totalBill == 0.0
                          ? Center(
                              child: SizedBox(
                              height: 20,
                              width: 60,
                              child: LoadingAnimationWidget.fourRotatingDots(
                                color: AppColor.primaryColor1,
                                size: 20,
                              ),
                            ))
                          : SmallText(
                              text: '₹$totalBill',
                              size: 20,
                              color: Colors.black,
                              // color: AppColor.primaryColor1,
                              fontweights: FontWeight.bold,
                            ),
                      const Widths(85),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          complitPickup();
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor1,
                            //const Color.fromARGB(8, 23, 79, 162),
                            border:
                                Border.all(color: AppColor.primaryColorDark),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                              child: isProceed
                                  ? Center(
                                      child: LoadingAnimationWidget
                                          .fourRotatingDots(
                                      color: Colors.white,
                                      size: 25,
                                    ))
                                  : SmallText(
                                      text: 'Proceed',
                                      color: Colors.white,
                                      size: 16,
                                      fontweights: FontWeight.w500,
                                    )),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addProductImages() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: _prodctImageList.length + 1,
        itemBuilder: (BuildContext context, index) {
          return index == _prodctImageList.length
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print('images press');
                      //_selectedImages();
                      _uploadImgCamera();
                    },
                    child: DottedBorder(
                        radius: Radius.circular(10),
                        color: AppColor.primaryColor1,
                        child: ClipRRect(
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: AppColor.primaryColor1,
                            ),
                          ),
                        )),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      image: DecorationImage(
                          image: FileImage(_prodctImageList[index]),
                          fit: BoxFit.cover),
                    ),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromARGB(57, 243, 243, 243),
                            //border: BoxBorder()
                          ),
                          child: Center(
                            child: IconButton(
                                color: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    _prodctImageList.removeAt(index);
                                  });

                                  print('Buttion is press');
                                },
                                icon: const Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 14,
                                  ),
                                )),
                          ),
                        )),
                  ),
                );
        });
  }
}

class DisplayText extends StatelessWidget {
  final String text;
  const DisplayText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return BigText(
      text: text,
      fontweights: FontWeight.w500,
      size: 16,
    );
  }
}

class BillingWidget extends StatelessWidget {
  final String garments;
  final String servicesCharge;
  final String deliverCharge;
  final String totalBill;
  final String totalItems;
  const BillingWidget({
    super.key,
    required this.garments,
    required this.servicesCharge,
    required this.deliverCharge,
    required this.totalBill,
    required this.totalItems,
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
                  text: 'Pickup items :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(text: totalItems),
              ],
            ),
            const Height(8),
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
                  text: 'Delivery charge :',
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
  final String? createData;
  const CustomerDetailWidget({
    super.key,
    required this.name,
    required this.mobileNumber,
    this.createData,
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
          ],
        ),
      ),
    );
  }
}

class CustomerOrderDetailWidget extends StatelessWidget {
  final String orderDisplayId;
  final String services;
  final String servicesType;
  final String pickupData;
  final String deliveryData;
  // final String orderStatus;
  const CustomerOrderDetailWidget({
    super.key,
    required this.services,
    required this.servicesType,
    required this.pickupData,
    required this.deliveryData,
    required this.orderDisplayId,
    // required this.orderStatus,
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
                  text: 'Order Id :',
                  fontweights: FontWeight.w500,
                  color: Colors.black87,
                ),
                SmallText(
                  text: orderDisplayId,
                  color: AppColor.primaryColor1,
                  fontweights: FontWeight.bold,
                ),
              ],
            ),
            // const Height(8),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     SmallText(
            //       text: 'Status :',
            //       fontweights: FontWeight.w500,
            //       color: Colors.black87,
            //     ),
            //     SmallText(
            //       text: orderStatus,
            //       color: orderStatus == 'Unpaid'
            //           ? Colors.red
            //           : AppColor.primaryColor1,
            //       fontweights: FontWeight.w500,
            //     ),
            //   ],
            // ),
            const Height(8),
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
                  size: 12,
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
                SmallText(
                  text: servicesType,
                  size: 12,
                ),
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
                SmallText(
                  text: pickupData,
                  size: 12,
                ),
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
                SmallText(
                  text: deliveryData,
                  size: 12,
                ),
              ],
            ),
            // const Height(8),
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

// class CollectionWidget extends StatelessWidget {
//   final String status;
//   final String walletBalance;
//   final String subtotalBill;

//   const CollectionWidget({
//     super.key,
//     required this.status,
//     required this.walletBalance,
//     required this.subtotalBill,
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
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: AppColor.backgroundColor,
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           blurRadius: 1.0,
//                           spreadRadius: 1.0,
//                           offset: Offset(
//                             1.0,
//                             1.0,
//                           ),
//                         ),
//                       ],
//                       border: Border.all(
//                           color: const Color.fromARGB(255, 221, 221, 221)),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(7),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SmallText(
//                             text: 'Wallet Balance',
//                             fontweights: FontWeight.w500,
//                             color: Colors.black,
//                           ),
//                           const Height(10),
//                           SmallText(
//                             text: '₹$walletBalance',
//                             color: AppColor.primaryButtonColor,
//                             fontweights: FontWeight.bold,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Widths(20),
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: AppColor.backgroundColor,
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           blurRadius: 1.0,
//                           spreadRadius: 1.0,
//                           offset: Offset(
//                             1.0,
//                             1.0,
//                           ),
//                         ),
//                       ],
//                       border: Border.all(
//                           color: const Color.fromARGB(255, 221, 221, 221)),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(7),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SmallText(
//                             text: 'Sub-Total Bill',
//                             fontweights: FontWeight.w500,
//                             color: Colors.black,
//                           ),
//                           const Height(10),
//                           SmallText(
//                             text: '₹$subtotalBill',
//                             color: AppColor.primaryButtonColor,
//                             fontweights: FontWeight.bold,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const Height(6),
//             const Divider(),
//             const Height(6),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SmallText(
//                   text: 'Status:',
//                   color: Colors.black,
//                   fontweights: FontWeight.w500,
//                 ),
//                 SmallText(
//                     text: status,
//                     color: status == 'Unpaid'
//                         ? Colors.red
//                         : AppColor.primaryColor1)
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class CollectionWidget extends StatelessWidget {
  final String status;
  final String walletBalance;
  final String subtotalBill;

  const CollectionWidget({
    super.key,
    required this.status,
    required this.walletBalance,
    required this.subtotalBill,
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
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SmallText(
                        text: 'Wallet Balance',
                        fontweights: FontWeight.w500,
                        color: Colors.black,
                      ),
                      const Height(5),
                      SmallText(
                        text: '₹$walletBalance',
                        color: AppColor.primaryButtonColor,
                        fontweights: FontWeight.bold,
                        size: 15,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  width: 1,
                  // color: const Color.fromARGB(255, 210, 210, 210),
                  color: Colors.black38,
                ),
                // const Widths(20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SmallText(
                        text: 'Sub-Total Bill',
                        fontweights: FontWeight.w500,
                        color: Colors.black,
                      ),
                      const Height(5),
                      SmallText(
                        text: '₹$subtotalBill',
                        color: AppColor.primaryButtonColor,
                        fontweights: FontWeight.bold,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Height(4),
            const Divider(),
            const Height(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmallText(
                  text: 'Status:',
                  color: Colors.black,
                  fontweights: FontWeight.w500,
                ),
                SmallText(
                    text: status,
                    fontweights: FontWeight.w500,
                    color: status == 'Unpaid'
                        ? Colors.red
                        : AppColor.primaryColor1)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ClothesImage extends StatelessWidget {
  final String status;
  final String walletBalance;
  final String subtotalBill;

  const ClothesImage({
    super.key,
    required this.status,
    required this.walletBalance,
    required this.subtotalBill,
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
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SmallText(
                        text: 'Wallet Balance',
                        fontweights: FontWeight.w500,
                        color: Colors.black,
                      ),
                      const Height(5),
                      SmallText(
                        text: '₹$walletBalance',
                        color: AppColor.primaryButtonColor,
                        fontweights: FontWeight.bold,
                        size: 15,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 1,
                  // color: const Color.fromARGB(255, 210, 210, 210),
                  color: Colors.black38,
                ),
                // const Widths(20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SmallText(
                        text: 'Sub-Total Bill',
                        fontweights: FontWeight.w500,
                        color: Colors.black,
                      ),
                      const Height(5),
                      SmallText(
                        text: '₹$subtotalBill',
                        color: AppColor.primaryButtonColor,
                        fontweights: FontWeight.bold,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Height(4),
            const Divider(),
            const Height(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmallText(
                  text: 'Status:',
                  color: Colors.black,
                  fontweights: FontWeight.w500,
                ),
                SmallText(
                    text: status,
                    fontweights: FontWeight.w500,
                    color: status == 'Unpaid'
                        ? Colors.red
                        : AppColor.primaryColor1)
              ],
            )
          ],
        ),
      ),
    );
  }
}
