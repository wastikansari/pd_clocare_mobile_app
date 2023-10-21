import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/delivery_api.dart';
import 'package:new_clocare_delivery_boy/backend/controller/staff_earing_data_controller.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/pending_deliveries_screeen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/complete_pickup_order_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:signature/signature.dart';

import '../../../../backend/api/staff_api.dart';

class DeliverDoneScreen extends StatefulWidget {
  var orderDetail;
  DeliverDoneScreen({super.key, required this.orderDetail});

  @override
  State<DeliverDoneScreen> createState() => _DeliverDoneScreenState();
}

class _DeliverDoneScreenState extends State<DeliverDoneScreen> {
  DeliveryApi deliveryApi = DeliveryApi();
  StaffApi staffApi = StaffApi();
  final staffEaringData = Get.find<DataController>();
  bool isLoading = false;
  File? _pickedFile;
  final List _prodctImageList = [];
  final picker = ImagePicker();
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.blue,
  );

  deliveredDone() async {
    final data = staffEaringData.data;
    print(
        'staff earing data ${data.distance}, ${data.timeTaken}, ${data.earning}, ${data.type}');
    String distance = data.distance.toString();
    String timeTaken = data.timeTaken.toString();
    String earning = data.earning.toString();
    String type = 'Delivery';

    int orderId = int.parse(widget.orderDetail.orderInfo.orderId.toString());
    var orderItems = '';
    var orderstageId =
        widget.orderDetail.orderInfo.orderWiseStages[2].orderstageId;
    var customerSign = '';
    var stageComments = '';
    var Orders = jsonEncode(widget.orderDetail.orderInfo.toJson());
    var feedback = '';
    if (_prodctImageList.isEmpty) {
      errorDialogBox('Order Images', 'Please upload at least one image.');
    } else if (_controller.isEmpty) {
      errorDialogBox('Customer Signature',
          "Delivery Confirmation Required: Please collect customer's signature before completing the delivery. Thank you for your assistance!");
    } else {
      setState(() {
        isLoading = true;
      });
      await deliveryApi
          .deliveryDone(orderId, orderItems, orderstageId, customerSign,
              stageComments, Orders, feedback)
          .then((value) async {
        print('deliveredDone ${value.success}');
        if (value.success == true) {
          // if (value.data!.status == 'ok') {
            doneDialogBox();
            await staffApi.staffPerOrderEarning(distance, timeTaken, earning, type).then((value) {
              print('staffPerOrderEarning ${value.data!.status.toString()}');

              setState(() {
                isLoading = false;
              });
            });
          // } else {
          //   errorDialogBox(value.data!.status, value.data!.msg);
          // }
        } else {
          errorDialogBox('Network',
              'There seems to be a network issue causing the order to not be delivered.');
          setState(() {
            isLoading = false;
          });
        }

        setState(() {
          isLoading = false;
        });
      });
    }
  }

  errorDialogBox(tittle, msg) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(tittle),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          // TextButton(
          //   onPressed: () {
          //     Navigator.pop(context, 'OK');
          //   },
          //   child: const Text('OK'),
          // ),
        ],
      ),
    );
  }

  doneDialogBox() {
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Thank You'),
        content: const Text(
            "Successfully Delivered. Thank you for your assistance!"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PendingDeliveriesScreen()),
                  ((route) => false));
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _uploadImgCamera() async {
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    final img = File(image.path);

    setState(() {
      _prodctImageList.add(img);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('dddddddddddddddddd ${widget.orderDetail.orderInfo}');
    var isLoadingPay = false;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Delivered'),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Height(5),
              const DisplayText(text: 'Order Images'),
              const Height(3),
              SmallText(
                text: 'Max 5 images upload',
                size: 10,
              ),
              const Height(8),
              Container(
                  alignment: Alignment.center,
                  height: 110,
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
                    padding: const EdgeInsets.all(8.0),
                    child: addProductImages(),
                  )),

              const Height(20),
              SmallText(
                text: 'Customer signature :',
                size: 20,
                color: Colors.black,
                fontweights: FontWeight.w500,
              ),
              //  Height(5),
              // Container(width: 120, height: 2, decoration: BoxDecoration(color: AppColor.primaryButtonColor),),
              const Height(10),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 177, 177, 177),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 177, 177, 177), //New
                        blurRadius: 0.5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(2)),
                child: Signature(
                  controller: _controller,
                  width: double.infinity,
                  height: 300,
                  backgroundColor: Colors.white,
                ),
              ),
              const Height(5),
              GestureDetector(
                onTap: () {
                  _controller.clear();
                },
                child: Container(
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(203, 70, 178, 236),
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                  ),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 15, bottom: 15),
                        child: SmallText(
                          text: 'Clear',
                          color: Colors.white,
                          fontweights: FontWeight.w500,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: 70,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 8),
          child: InkWell(
            onTap: () {
              deliveredDone();
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
                  child: isLoading
                      ? LoadingAnimationWidget.fourRotatingDots(
                          color: Colors.white,
                          size: 20,
                        )
                      : SmallText(
                          text: 'Save & Delivered',
                          color: Colors.white,
                          size: 16,
                          fontweights: FontWeight.w500,
                        )),
            ),
          ),
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
                        radius: const Radius.circular(10),
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
                            color: const Color.fromARGB(57, 243, 243, 243),
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
