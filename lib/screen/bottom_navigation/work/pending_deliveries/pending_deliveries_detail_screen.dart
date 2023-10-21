import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/order_detail_api.dart';
import 'package:new_clocare_delivery_boy/backend/models/order_detail_model.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/deliverie_start_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/box/customer_detail_car_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';

class PendingDeliveriesDetailScreen extends StatefulWidget {
  final String orderId;
  const PendingDeliveriesDetailScreen({super.key, required this.orderId});

  @override
  State<PendingDeliveriesDetailScreen> createState() =>
      _PendingDeliveriesDetailScreenState();
}

class _PendingDeliveriesDetailScreenState
    extends State<PendingDeliveriesDetailScreen> {
  OrderDetailApi orderDetailApi = OrderDetailApi();

  // OrderModel orderModel = OrderModel();

  String totalOrder = '0';
  String totalPickup = '0';
  bool isLoading = false;
  String orderDisplayId = '';
  String customerName = '';
  String customerMobile = '';
  String services = '';
  String servicesTypes = '';
  String status = '';
  String address = '';
  String date = '';

  bool viewVisible = false;
  void hideWidegt() {
    setState(() {
      viewVisible = !viewVisible;
    });
  }

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
          customerMobile = orderData.orderInfo!.orderBookedBys!.mobile.toString();
          services = orderData.orderInfo!.service!.name.toString();
          servicesTypes = orderData.orderInfo!.orderType!.typeName.toString();
          status = orderData.orderInfo!.status.toString();
          address = orderData.orderInfo!.formattedDeliveryAddress.toString();
          date = orderData.orderInfo!.deliveryDate.toString();
          isLoading = false;
        });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Order Details'),
        elevation: 1,
      ),
      body: isLoading == true
          ? Center(
            child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: AppColor.primaryColor2,
                    size: 60,
                  ),
                ),
              ),
          )
          : Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Height(15),
                    CustomerDataBox(
                      orderId: '#$orderDisplayId',
                      name: customerName,
                      mobileNo: customerMobile,
                      services: services,
                      servicesType: servicesTypes, status: status,
                    ),
                    const Height(20),
                    BigText(
                      text: 'Delivery address',
                      fontweights: FontWeight.w500,
                      size: 18,
                    ),
                    const Height(10),
                    Container(
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        // color: const Color.fromARGB(255, 228, 241, 252),
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
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(6),
                      //   color: const Color.fromARGB(8, 23, 79, 162),
                      //   border: Border.all(color: AppColor.primaryColorDark),
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              address,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            const Height(20),
                            Divider(),
                            Row(
                              children: [
                                const Icon(
                                  Icons.watch_later_outlined,
                                  size: 19,
                                ),
                                const Widths(8),
                                BigText(
                                  text: date,
                                  // text: '${allData!.orderInfo!.deliveryDate.toString()}   7AM to 10 PM',
                                  size: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Height(20),
                    BigText(
                      text: 'Garments detail',
                      fontweights: FontWeight.w500,
                      size: 18,
                    ),
                    const Height(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              hideWidegt();
                            },
                            child: Container(
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // color: const Color.fromARGB(255, 228, 241, 252),
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
                                    color: const Color.fromARGB(
                                        255, 221, 221, 221)),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text: 'Garments Order',
                                      color: Colors.black,
                                      fontweights: FontWeight.w500,
                                    ),
                                    const Height(5),
                                    FutureBuilder<OrderModel>(
                                        future: orderDetailApi
                                            .getOrderDetail(widget.orderId),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            var allData = snapshot.data!.data;
                                       
                                            int totalPickup = 0;

                                            for (int i = 0;
                                                i <
                                                    allData!.orderInfo!
                                                        .orderItems!.length;
                                                i++) {
                                              totalPickup = allData.orderInfo!
                                                      .orderItems![i].qty! +
                                                  totalPickup;
                                            }

                                            return SmallText(
                                              text: totalPickup.toString(),
                                              size: 16,
                                              color: AppColor.primaryColor1,
                                              fontweights: FontWeight.w500,
                                            );
                                          } else {
                                            return LoadingAnimationWidget
                                                .fourRotatingDots(
                                              color: AppColor.primaryColor2,
                                              size: 20,
                                            );
                                          }
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              hideWidegt();
                            },
                            child: Container(
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // color: const Color.fromARGB(255, 228, 241, 252),
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
                                    color: const Color.fromARGB(
                                        255, 221, 221, 221)),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text: 'Garments Pickup',
                                      color: Colors.black,
                                      fontweights: FontWeight.w500,
                                    ),
                                    const Height(5),
                                    FutureBuilder<OrderModel>(
                                        future: orderDetailApi
                                            .getOrderDetail(widget.orderId),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            var allData = snapshot.data!.data;
                                            print(
                                                'qqqqqqqqqq ${snapshot.data!.success}');
                                            int totalPickup = 0;

                                            for (int i = 0;
                                                i <
                                                    allData!.orderInfo!
                                                        .orderItems!.length;
                                                i++) {
                                              totalPickup = allData.orderInfo!
                                                      .orderItems![i].qty! +
                                                  totalPickup;
                                            }

                                            return SmallText(
                                              text: totalPickup.toString(),
                                              size: 16,
                                              color: AppColor.primaryColor1,
                                              fontweights: FontWeight.w500,
                                            );
                                          } else {
                                            return LoadingAnimationWidget
                                                .fourRotatingDots(
                                              color: AppColor.primaryColor2,
                                              size: 20,
                                            );
                                          }
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Height(20),
                    Visibility(
                      visible: viewVisible,
                      child: BigText(
                        text: 'Items in order',
                        fontweights: FontWeight.w500,
                        size: 18,
                      ),
                    ),
                    const Height(10),
                    Visibility(
                      visible: viewVisible,
                      child: FutureBuilder<OrderModel>(
                          future: orderDetailApi.getOrderDetail(widget.orderId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var allData = snapshot.data!.data;
                          

                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  // color:
                                  // Color.fromARGB(255, 228, 241, 252),
                                  // const Color.fromARGB(255, 243, 243, 243),
                                  borderRadius: BorderRadius.circular(6),
                                  color: const Color.fromARGB(10, 77, 172, 223),
                                  // color: const Color.fromARGB(8, 23, 79, 162),
                                  // border: Border.all(color: AppColor.primaryColor1),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: allData!
                                          .orderInfo!.orderItems!.length,
                                      itemBuilder: (BuildContext, index) {
                                        var data = allData
                                            .orderInfo!.orderItems![index];
                                        
                                        int a = int.parse(data.qty.toString());
                                        double b =
                                            double.parse('${data.basePrice}');

                                        var d = a * b;

                                        totalOrder = '5';
                                        totalPickup = '44';

                                        return ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 15.0,
                                                  horizontal: 10),
                                          leading: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.white70,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.black),
                                              // boxShadow: [
                                              //   BoxShadow(
                                              //     blurRadius: 25.0,
                                              //   ),
                                              // ],
                                              // image: DecorationImage(
                                              //   fit: BoxFit.fill,
                                              //   image: NetworkImage("https://cc.vcantech.biz/uploads/${data.icon.toString()}"),
                                              //       // 'https://www.freepnglogos.com/uploads/garments-png/sardar-garments-fast-shipping-trendy-apparel-39.png'
                                              //       // Replace with your image URL
                                              // ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Image.network(
                                                'https://cc.vcantech.biz/uploads/${data.icon.toString()}',
                                                height: 80,
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            "${data.mainType} >> ${data.subType}",
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
                                              const Height(6),
                                              SmallText(
                                                text:
                                                    '${data.qty} X ${data.basePrice} = ₹$d',
                                                size: 12,
                                              ),
                                              const Height(6),
                                              SmallText(
                                                text:
                                                    'Ordered/Picked: ${data.qty}/${data.qty}',
                                                size: 12,
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              );
                            } else {
                              return SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Center(
                                  child:
                                      LoadingAnimationWidget.fourRotatingDots(
                                    color: AppColor.primaryColor2,
                                    size: 60,
                                  ),
                                ),
                              );
                            }
                          }),
                    ),
                    const Height(20),
                    ButtonWidget(
                        backgroundColor: AppColor.primaryColor1,
                        text: 'Start Delivery',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DeliveriesStartScreen(
                                        address: address,
                                        orderId: widget.orderId)),
                          );
                        }),
                    const Height(25),
                  ],
                ),
              ),
            ),
    );
  }
}
