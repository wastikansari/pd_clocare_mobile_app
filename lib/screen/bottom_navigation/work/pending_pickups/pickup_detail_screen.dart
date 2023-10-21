import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/order_detail_api.dart';
import 'package:new_clocare_delivery_boy/backend/models/order_detail_model.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/deliverie_start_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/pickup_start_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/box/customer_detail_car_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';

class PickupDetailScreen extends StatefulWidget {
  final String orderId;
  const PickupDetailScreen({super.key, required this.orderId});

  @override
  State<PickupDetailScreen> createState() => _PickupDetailScreenState();
}

class _PickupDetailScreenState extends State<PickupDetailScreen> {
  OrderDetailApi orderDetailApi = OrderDetailApi();

  // OrderModel orderModel = OrderModel();

  String totalOrder = '0';
  String totalPickup = '0';
  bool isLoading = false;
  String orderDisplayId = '';
  String serviceId = '';
  String customerName = '';
  String customerMobile = '';
  String services = '';
  String servicesTypes = '';
  String status = '';
  String address = '';
  String date = '';
  String miniOrderValue = '';

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
          serviceId = orderData.orderInfo!.serviceId.toString();
          date = orderData.orderInfo!.deliveryDate.toString();
           miniOrderValue = orderData.orderInfo!.orderType!.minOrdVal.toString();
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
                      servicesType: servicesTypes,
                      status: status,
                    ),
                    const Height(20),
                    BigText(
                      text: 'Pickup address',
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
                                  color:
                                      const Color.fromARGB(255, 221, 221, 221)),
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
                                          var datas = snapshot.data!.data;
                                          return SmallText(
                                            text: datas!.orderInfo!.totalItems
                                                .toString(),
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
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
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
                                  color:
                                      const Color.fromARGB(255, 221, 221, 221)),
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
                                      future: orderDetailApi.getOrderDetail(widget.orderId),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          var allData = snapshot.data!.data;
                                          return SmallText(
                                            text: allData!.orderInfo!.totalItems!.toString(),
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
                      ],
                    ),
                    const Height(50),
                    ButtonWidget(
                        backgroundColor: AppColor.primaryColor1,
                        text: 'Start Pickup',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PickupStartScreen(
                                    address: address, orderId: widget.orderId, miniOrderValue: miniOrderValue, serviceId: serviceId, )),
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
