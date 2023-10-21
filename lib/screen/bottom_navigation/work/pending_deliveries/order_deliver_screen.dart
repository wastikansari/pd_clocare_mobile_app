import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/customer_wallet_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/delivery_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/order_detail_api.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/not_able_to_deliver_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/collected_money_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/delivery_done_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/online_payment.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class OrderDeliverScreen extends StatefulWidget {
  final String orderId;
  // final String earnings;
  // final String duration;
  // final String distance;

  const OrderDeliverScreen({
    super.key,
    required this.orderId,
  });

  @override
  State<OrderDeliverScreen> createState() => _OrderDeliverScreenState();
}

class _OrderDeliverScreenState extends State<OrderDeliverScreen> {
  OrderDetailApi orderDetailApi = OrderDetailApi();
  CustomerWalletApi customerWalletApi = CustomerWalletApi();
  DeliveryApi deliveryApi = DeliveryApi();

  bool isLoadingPay = false;

  String totalOrder = '0';
  String totalPickup = '0';
  bool isLoading = false;
  bool isBalanceLoading = false;
  String orderDisplayId = '';
  String customerName = '';
  int? customerId;
  String customerMobile = '';
  String services = '';
  String servicesTypes = '';
  String status = '';
  String totalGarments = '';
  String address = '';
  String date = '';
  String totalOrderAmount = '';
  String customerWalletBalance = '';
  String amountStatus = '';
  var orderDetails;

  getOrderDetail() async {
    setState(() {
      isLoading = true;
    });
    await orderDetailApi.getOrderDetail(widget.orderId).then((value) {
      if (value.success == true) {
        var orderData = value.data;
        setState(() {
          orderDisplayId = orderData!.orderInfo!.orderDisplayId.toString();
          customerName = orderData.orderInfo!.orderBookedBys!.name.toString();
          customerId = orderData.orderInfo!.customerId;
          customerMobile = orderData.orderInfo!.orderBookedBys!.mobile.toString();
          services = orderData.orderInfo!.service!.name.toString();
          servicesTypes = orderData.orderInfo!.orderType!.typeName.toString();
          totalGarments = orderData.orderInfo!.orderItems!.length.toString();
          status = orderData.orderInfo!.status.toString();
          amountStatus = orderData.orderInfo!.status.toString();
          address = orderData.orderInfo!.formattedDeliveryAddress.toString();
          date = orderData.orderInfo!.deliveryDate.toString();
          totalOrderAmount = orderData.orderInfo!.orderTotal.toString();
          orderDetails = orderData;
          customerWallet(customerId);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  customerWallet(customerId) async {
    setState(() {
      isBalanceLoading = true;
    });
    print('customer wallet function is call $customerId');
    await customerWalletApi.getCustomerBalance(customerId).then((value) {
      setState(() {
        isBalanceLoading = false;
      });
      print(
          'customer wallet function is call inside $value and ${value.success} and ${value.data!.balance}');
      setState(() {
        customerWalletBalance = value.data!.balance.toString();
      });
    });
  }

  deliveryProceed() async {
    String orderId = widget.orderId;
    var amount = collectMoney();
    print('amounttt $amount');
    if (status == 'Unpaid' && amount <= 0) {
      await amountPay(orderId);
    } else if (status == 'Unpaid' && amount > 0) {
      await unpaidDialogBox(amount);
    } else if (status == 'Paid' || status == 'Pay Later') {
      Get.to(DeliverDoneScreen(
        orderDetail: orderDetails,
      ));
    }
  }

  unpaidDialogBox(amount) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Attention'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
                'Unpaid Amount ₹$amount, Please settle the outstanding payment before proceeding with the delivery.'),
            const Height(10),
            SmallText(
              text:
                  '(There is a payment mode option where you can collect money from the customer.)',
              overFlow: TextOverflow.visible,
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  paidDialogBox() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Thank You'),
        content: const Text(
            "Your pending order amount has been successfully paid. Thank you!"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  amountPay(id) async {
    setState(() {
      isLoadingPay = true;
    });
    var orderId = id;
    var modeOfPayment = 'wallet';
    print('amount pay $id');

    await customerWalletApi
        .orderProcessingPayment(orderId, modeOfPayment)
        .then((value) {
      print('ddddddddddddd ${value.data!.status}');
      if (value.data!.status == 'ok') {
        setState(() {
          isLoadingPay = false;
        });
        paidDialogBox();
        getOrderDetail();
      }
      setState(() {
        isLoadingPay = false;
      });
      getOrderDetail();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderDetail();
  }

  collectMoney() {
    double uAmount = double.parse(totalOrderAmount.trim());
    double cBalance = double.parse(customerWalletBalance.trim());
    int unpaidAmount = uAmount.toInt();
    int customerBalance = cBalance.toInt();

    int total = unpaidAmount - customerBalance;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: AppColor.primaryColor1,
                size: 60,
              ),
            ),
          )
        : WillPopScope(
            onWillPop: () async {
              Navigator.pop(context);
              return false;
            },
            child: Scaffold(
              backgroundColor: AppColor.primaryColor1,
              // Color(0xFFF7F8FA),
              // appBar: AppBar(
              //   title: const Text('Order Deliver'),
              //   elevation: 1,
              // ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor1,
                      // boxShadow: [BoxShadow(blurRadius: 1.0)],
                      // borderRadius: BorderRadius.vertical(
                      //     bottom: Radius.elliptical(
                      //         MediaQuery.of(context).size.width, 80.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Height(35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BigText(
                                text: amountStatus,
                                size: 23,
                                fontweights: FontWeight.bold,
                                color: Colors.white),
                            BigText(
                                text: ' Amount',
                                size: 23,
                                fontweights: FontWeight.bold,
                                color: Colors.white),
                          ],
                        ),
                        const Height(15),
                        BigText(
                            text: '₹$totalOrderAmount',
                            size: 21,
                            fontweights: FontWeight.bold,
                            color: const Color.fromARGB(255, 229, 229, 229)),
                        const Height(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BigText(
                              text: 'Customer Wallet Balance :  ',
                              size: 13,
                              fontweights: FontWeight.w500,
                              color: const Color.fromARGB(174, 243, 243, 243),
                            ),
                            isBalanceLoading
                                ? Center(
                                    child:
                                        LoadingAnimationWidget.fourRotatingDots(
                                    color: AppColor.primaryColor2,
                                    size: 20,
                                  ))
                                : BigText(
                                    text: '₹$customerWalletBalance',
                                    size: 13,
                                    fontweights: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        174, 243, 243, 243),
                                  )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      //  EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                      // width: double.infinity,
                      // height: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.backgroundColor,
                        boxShadow: [const BoxShadow(blurRadius: 1.0)],
                        borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(
                                MediaQuery.of(context).size.width, 50.0)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Height(10),
                            BigText(
                              text: 'Order Details',
                              fontweights: FontWeight.w500,
                              size: 18,
                            ),
                            const Height(6),
                            OrderDetailBox(
                              orderId: orderDisplayId,
                              name: customerName,
                              mobileNo: customerMobile,
                              services: services,
                              servicesType: servicesTypes,
                              totalGarment: totalGarments,
                              status: status,
                            ),
                            const Height(15),
                            status == 'Paid'
                                ? Container()
                                : Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              BigText(
                                                text: 'Payment mode',
                                                fontweights: FontWeight.w500,
                                                size: 18,
                                              ),
                                              const Height(5),
                                              SmallText(
                                                text:
                                                    'Collect cash from the customer',
                                                size: 10,
                                              )
                                            ],
                                          ),
                                        ),
                                        const Height(5),
                                        CustumListTile(
                                          title: "Collect Cash",
                                          icon: const Icon(Icons.currency_rupee_rounded),
                                          onTap: () {
                                            print('tap');
                                            int unpaidAmount = collectMoney();
                                            print(unpaidAmount);
                                            Get.to(CollectMoneyScreen(
                                              unpaidAmount: unpaidAmount,
                                              customerIds:
                                                  customerId.toString(),
                                              orderId: widget.orderId,
                                            ));
                                          },
                                        ),
                                        CustumListTile(
                                          title: "Online Payment",
                                          icon: const Icon(Icons.wallet),
                                          onTap: () {
                                            print('tap');
                                            Get.to(const OnlinePaymentScreen());
                                          },
                                        ),
                                        const Height(15),
                                      ],
                                    ),
                                  ),

                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: BigText(
                                text: 'Deliver issuse',
                                fontweights: FontWeight.w500,
                                size: 18,
                              ),
                            ),
                            const Height(5),
                            CustumListTile(
                              title: "Not able to deliver",
                              icon: const Icon(Icons.wallet),
                              onTap: () {
                                print('tap');
                                Get.to(NotAbleToDeliver(
                                  orderId: widget.orderId,
                                ));
                              },
                            ),
                            // buttomWidget(
                            //   text: 'Collect Cash',
                            //   onTaps: () {
                            //     Get.to(CollectMoneyScreen());
                            //   },
                            // ),
                            const Height(35),

                            // const Height(150),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(color: Colors.white),
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10, top: 8),
                  child: InkWell(
                    onTap: () {
                      deliveryProceed();
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor1,
                        //const Color.fromARGB(8, 23, 79, 162),
                        border: Border.all(color: AppColor.primaryColorDark),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: isLoadingPay
                              ? LoadingAnimationWidget.fourRotatingDots(
                                  color: Colors.white,
                                  size: 20,
                                )
                              : SmallText(
                                  text: 'Proceed',
                                  color: Colors.white,
                                  size: 16,
                                  fontweights: FontWeight.w500,
                                )),
                    ),
                  ),

                  // buttomWidget(
                  //   text:  'Proceed',
                  //   onTaps: () {
                  //     // Get.to(const OnlinePaymentScreen());
                  //     deliveryProceed();
                  //   },
                  // ),
                ),
              ),
            ),
          );
  }
}

class buttomWidget extends StatelessWidget {
  final String text;
  final Function onTaps;
  Color? backgroundColor;
  buttomWidget({
    super.key,
    required this.text,
    required this.onTaps,
    this.backgroundColor = const Color(0xFF174FA2),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTaps();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          //const Color.fromARGB(8, 23, 79, 162),
          border: Border.all(color: AppColor.primaryColorDark),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: SmallText(
          text: text,
          color: Colors.white,
          size: 16,
          fontweights: FontWeight.w500,
        )),
      ),
    );
  }
}

class OrderDetailBox extends StatelessWidget {
  final String orderId;
  final String name;
  final String mobileNo;
  final String services;
  final String servicesType;
  final String totalGarment;
  final String status;

  const OrderDetailBox({
    super.key,
    required this.orderId,
    required this.name,
    required this.mobileNo,
    required this.services,
    required this.servicesType,
    required this.totalGarment,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          // color: const Color.fromARGB(8, 23, 79, 162),
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

        // decoration: BoxDecoration(
        //   color: const Color.fromARGB(6, 79, 111, 159),
        //   border: Border.all(color: AppColor.primaryColorDark),
        //   borderRadius: BorderRadius.circular(6),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BigText(
                    text: 'Order id : ',
                    fontweights: FontWeight.bold,
                  ),
                  BigText(
                    text: orderId,
                    fontweights: FontWeight.bold,
                    color: AppColor.primaryColor1,
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: name,
                        size: 15,
                        fontweights: FontWeight.w500,
                      ),
                      const Height(5),
                      BigText(
                        text: mobileNo,
                        size: 14,
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  BigText(
                    text: 'Services : ',
                    size: 14,
                    fontweights: FontWeight.w500,
                  ),
                  BigText(
                    text: services,
                    size: 14,
                  ),
                ],
              ),
              const Height(5),
              Row(
                children: [
                  BigText(
                    text: 'Types : ',
                    size: 14,
                    fontweights: FontWeight.w500,
                  ),
                  BigText(
                    text: servicesType,
                    size: 14,
                  ),
                ],
              ),
              const Height(5),
              Row(
                children: [
                  BigText(
                    text: 'Total Garments : ',
                    size: 14,
                    fontweights: FontWeight.w500,
                  ),
                  BigText(
                    text: totalGarment,
                    size: 14,
                  ),
                ],
              ),
              const Height(5),
              Row(
                children: [
                  BigText(
                    text: 'Status : ',
                    size: 14,
                    fontweights: FontWeight.w500,
                  ),
                  BigText(
                    text: status,
                    size: 14,
                    color: AppColor.primaryColor2,
                    // fontweights: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class CustumListTile extends StatelessWidget {
  final String title;
  final Function onTap;
  final Widget icon;
  const CustumListTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(
          color: Color.fromARGB(255, 238, 238, 238),
        ),
      ),
      elevation: 0,
      shadowColor: Colors.grey,
      child: ListTile(
        leading: icon,
        title: Text(title),
        tileColor: Colors.white,
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
