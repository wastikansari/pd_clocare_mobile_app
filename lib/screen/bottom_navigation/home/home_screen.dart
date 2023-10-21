import 'dart:async';
import 'dart:io';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/delivery_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/pickup_api.dart';
import 'package:new_clocare_delivery_boy/backend/controller/profile_controller.dart';
import 'package:new_clocare_delivery_boy/backend/logic/current_location.dart';
import 'package:new_clocare_delivery_boy/backend/logic/upload_recording_file.dart';
import 'package:new_clocare_delivery_boy/backend/models/delivery_order_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/pickup_model.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/home/canceld_order_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/home/complet_order_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/home/return_order_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/home/total_earing_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/home/widgets/graphs/pie_chart_circle.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/profile/notification_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/pending_deliveries_screeen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/pending_pickup_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../widget/small_text.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ProfileController profileController = Get.put(ProfileController());
  GetCurrentLocation getCurrentLocation = GetCurrentLocation();
  bool isLoading = false;
  String address = 'Current address loading';
  String liveLocation = '';
  final String _address = 'Fetching address...';
  int pendingOrder = 0;
  int pendingOrder1 = 0;
  int pendingOrder2 = 0;

  getLocation() async{
    setState(() {
      isLoading = true;
    });
  await  getCurrentLocation.getCurrentLocation().then((value) {
      setState(() {address ='${value.street}, ${value.subLocality}, ${value.thoroughfare}, ${value.locality}, ${value.administrativeArea}, ${value.country}, ${value.postalCode}';});
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColor.primaryColor1,
          automaticallyImplyLeading: false,
          elevation: 1,
          title: Row(
            children: [
              Obx(
                () {
                  if (profileController.profile.value.success == null) {
                    return const CircularProgressIndicator();
                  } else if (profileController.profile.value.success == false) {
                    return const Text('Data retrieval failed.');
                  } else {
                    var userName = "${profileController.profile.value.data!.list!.first} ${profileController.profile.value.data!.list!.last}";
                    var phone = profileController.profile.value.data!.list!.username;
                    return Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(2),
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.blue,
                              ),
                            ),               
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: theme.textTheme.subtitle1?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '$phone',
                              style: theme.textTheme.subtitle1?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
              // Container(
              //   height: 20,
              //   width: 10,
              //   child: Center(child: Text('data')),
              // )
              // FutureBuilder<StaffProfileModel>(
              //     future: staffProfileApi.getUser(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         print( 'was ${snapshot.data!.data!.list!.first} ${snapshot.data!.data!.list!.last}');
              //         return Row(
              //           children: [
              //             Container(
              //               height: 45,
              //               width: 45,
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(8),
              //               ),
              //               child: const Padding(
              //                 padding: EdgeInsets.all(2),
              //                 child: CircleAvatar(
              //                   radius: 8,
              //                   backgroundColor: Colors.white,
              //                   child: Icon(
              //                     Icons.person,
              //                     size: 40,
              //                     color: Colors.blue,
              //                   ),
              //                 ),
              //                 // ClipRRect(
              //                 //     borderRadius: BorderRadius.circular(8),
              //                 //     child: Image.network(
              //                 //       imageUrl,
              //                 //       fit: BoxFit.cover,
              //                 //     )),
              //               ),
              //             ),
              //             const SizedBox(
              //               width: 8,
              //             ),
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   '${snapshot.data!.data!.list!.first} ${snapshot.data!.data!.list!.last}',
              //                   style: theme.textTheme.subtitle1?.copyWith(
              //                       fontWeight: FontWeight.w600,
              //                       fontSize: 15,
              //                       color: Colors.white),
              //                 ),
              //                 const SizedBox(
              //                   height: 4,
              //                 ),
              //                 Text(
              //                   '${snapshot.data!.data!.list!.username}',
              //                   style: theme.textTheme.subtitle1?.copyWith(
              //                       fontWeight: FontWeight.w400,
              //                       fontSize: 12,
              //                       color: Colors.white70),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         );
              //       } else {
              //         return const CircularProgressIndicator();
              //       }
              //     }),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(QRCodeScannerWidget());
                },
                icon: const Icon(Icons.qr_code_scanner_rounded,
                    size: 28, color: Colors.white)),
            IconButton(
                onPressed: () {
                  Get.to(const NotificationsScreen());
                },
                icon: const Icon(Icons.notifications_none_outlined,
                    size: 28, color: Colors.white)),
          ]),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Height(15),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: Container(
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
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: Colors.red.shade800,
                        ),
                        Container(
                          width: 280,
                          // height: 40,
                          // color: Colors.amber,
                          padding: const EdgeInsets.all(1),
                          child: SmallText(
                            text: isLoading ? 'Loading...' : address,
                            color: Colors.black,
                            fontweights: FontWeight.w500,
                            // overFlow: TextOverflow.ellipsis,
                            overFlow: TextOverflow.visible,
                            size: 12,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              getLocation();
                            },
                            child: Icon(
                              Icons.refresh,
                              size: 21,
                              color: AppColor.primaryColor1,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              const Height(10),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: const PieChartCircle(),
              ),
              const Height(25),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SmallText(
                  text: 'Assign work',
                  size: 20,
                  color: Colors.black,
                  fontweights: FontWeight.w600,
                ),
              ),
              const Height(15),
              WorkBox(),
              const Height(25),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SmallText(
                  text: 'Analytics',
                  size: 20,
                  color: Colors.black,
                  fontweights: FontWeight.w600,
                ),
              ),
              const Height(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  box(
                    title: 'Complet Order',
                    icon: 'asset/image/cd.png',
                    data: '0',
                    bgcolor: AppColor.primaryColor1,
                    backgroundColor: const Color.fromARGB(31, 155, 39, 176),
                    onTap: () {
                      Get.to(const CompletOrderScreen());
                    },
                  ),
                  box(
                    title: 'Total Earning',
                    icon: 'asset/image/earning.png',
                    data: '₹${pendingOrder.toString()}',
                    bgcolor: AppColor.primaryColor1,
                    backgroundColor: Colors.white,
                    onTap: () {
                      Get.to(const TotalEarningScreen());
                    },
                  ),
                ],
              ),
              const Height(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  box(
                    title: 'Canceld Order',
                    icon: 'asset/image/canceld.png',
                    data: '0',
                    bgcolor: AppColor.primaryColor1,
                    backgroundColor: const Color.fromARGB(31, 155, 39, 176),
                    onTap: () {
                      Get.to(const CanceldOrderScreen());
                    },
                  ),
                  box(
                    title: 'Return Order',
                    icon: 'asset/image/rd.png',
                    data: '0',
                    bgcolor: AppColor.primaryColor1,
                    backgroundColor: const Color.fromARGB(31, 155, 39, 176),
                    onTap: () {
                      Get.to(const ReturnOrderScreen());
                    },
                  ),
                ],
              ),
              const Height(25),
            ],
          ),
        ),
      ),
    );
  }
}

class box extends StatelessWidget {
  final String icon;
  final String title;
  final String data;
  final Color bgcolor;
  final Color backgroundColor;
  final Function onTap;

  const box({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
    required this.bgcolor,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 135,
        width: 160,
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

          // color: backgroundColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: const Color.fromARGB(255, 221, 221, 221),
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              icon,
              height: 36,
            ),

            // Icon(
            //   icon,
            //   size: 20,
            //   color: Colors.black,
            // ),
            const Height(8),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400),
            ),
            const Height(8),
            SmallText(
              text: data,
              color: bgcolor,
              size: 15,
              fontweights: FontWeight.w500,
            ),
            const SizedBox(
              height: 8,
            ),
          ]),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String address;
  final Function notificationTap;
  final Function addressTap;
  const CustomAppBar(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.address,
      required this.notificationTap,
      required this.addressTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.primaryColor1,
          automaticallyImplyLeading: false,
          elevation: 2,
          title: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(2),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),

                      // ClipRRect(
                      //     borderRadius: BorderRadius.circular(8),
                      //     child: Image.network(
                      //       imageUrl,
                      //       fit: BoxFit.cover,
                      //     )),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      addressTap();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          address,
                          style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(QRCodeScannerWidget());
                },
                icon: const Icon(Icons.qr_code_scanner_rounded,
                    size: 28, color: Colors.white)),
            IconButton(
                onPressed: () {
                  notificationTap();
                },
                icon: const Icon(Icons.notifications_none_outlined,
                    size: 28, color: Colors.white)),
          ]),
    );
  }
}

class QRCodeScannerWidget extends StatefulWidget {
  @override
  _QRCodeScannerWidgetState createState() => _QRCodeScannerWidgetState();
}

class _QRCodeScannerWidgetState extends State<QRCodeScannerWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  Barcode? result;
  final picker = ImagePicker();

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: Stack(
        children: [
          _buildQrView(context),
          _buildScannerOverlay(context),
          _buildGalleryButton(context),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  Widget _buildScannerOverlay(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 240,
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 240,
                height: 20,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 240,
                height: 20,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 20,
                height: 240,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 20,
                height: 240,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryButton(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      child: FloatingActionButton(
        onPressed: _pickImageFromGallery,
        child: const Icon(Icons.photo_library),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      // Process the image file (e.g., decode QR code from the image)
      // Add your implementation here
    }
  }
}

class WorkBox extends StatelessWidget {
  WorkBox({super.key});
  DeliveryApi deliveryApi = DeliveryApi();
  PickupApi pickupApi = PickupApi();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(PendingPickupScreen());
          },
          child: Stack(
            children: [
              Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(185, 243, 199, 103),
                          blurRadius: 1.0,
                        ),
                      ],
                      color: Colors.white),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/image/delivery.png',
                          height: 70,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Pending Pickups',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                          softWrap: false,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(184, 255, 196, 69),
                    ),
                    child: FutureBuilder<PickupModel>(
                        future: pickupApi.getOrderData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var itemsData = snapshot
                                .data!.data!.mMeta!.totalCount
                                .toString();
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: SmallText(
                                    text: itemsData,
                                    fontweights: FontWeight.w500,
                                    size: 80,
                                    color: Color.fromARGB(123, 245, 245, 245),
                                  ),
                                ),
                                SmallText(
                                  text: itemsData,
                                  fontweights: FontWeight.w500,
                                  size: 45,
                                  color: Colors.white,
                                ),
                              ],
                            );
                          } else {
                            return LoadingAnimationWidget.fourRotatingDots(
                              color: Colors.white,
                              size: 20,
                            );
                          }
                        })),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(PendingDeliveriesScreen());
          },
          child: Stack(
            children: [
              Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      // boxShadow: const [
                      //   BoxShadow(
                      //     color: Colors.black45,
                      //     blurRadius: 1.0,
                      //   ),
                      // ],
                      color: Colors.white),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/image/pd.png',
                          height: 70,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Pending Deliveries',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                          softWrap: false,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        // const Divider(
                        //   thickness: 1,
                        //   // color: AppColor.primaryColor2,
                        // ),
                      ],
                    ),
                  )),
              Positioned(
                child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromARGB(207, 88, 141, 255),
                    ),
                    child: FutureBuilder<DeliverOrderModel>(
                        future: deliveryApi.pendingDeliverOrderList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var totalItems =
                                snapshot.data!.data!.length.toString();

                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: SmallText(
                                    text: totalItems,
                                    fontweights: FontWeight.w500,
                                    size: 80,
                                    color: Color.fromARGB(43, 223, 223, 223),
                                  ),
                                ),
                                SmallText(
                                    text: totalItems,
                                    fontweights: FontWeight.w500,
                                    size: 45,
                                    color: Colors.white
                                    //AppColor.primaryColor1,
                                    ),
                              ],
                            );
                          } else {
                            return LoadingAnimationWidget.fourRotatingDots(
                              color: Colors.white,
                              size: 20,
                            );
                          }
                        })),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
