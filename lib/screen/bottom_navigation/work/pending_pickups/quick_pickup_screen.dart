import 'dart:convert';
import 'dart:developer';
import 'dart:io';
// import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/order_detail_api.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/complete_pickup_order_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import '../../../../backend/api/pickup_api.dart';

class QuickPickupScreen extends StatefulWidget {
  final String orderId;
  QuickPickupScreen({super.key, required this.orderId});

  @override
  State<QuickPickupScreen> createState() => _QuickPickupScreenState();
}

class _QuickPickupScreenState extends State<QuickPickupScreen> {
  PickupApi pickupApi = PickupApi();
  OrderDetailApi orderDetailApi = OrderDetailApi();
  var noOfClothes = TextEditingController();
  var comment = TextEditingController();
  String totalClothes = '0';
  File? _pickedFile;
  final List _prodctImageList = [];
  final picker = ImagePicker();

  // bool isApply = false;
  bool isLoading = false;
  // bool isBalanceLoading = false;
  bool isProceed = false;
  // bool isTrue = false;
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

  int _counter = 0;
  TextEditingController _textEditingController = TextEditingController();

  List<Map<String, dynamic>> clothePics = [];

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _textEditingController.text = _counter.toString();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _textEditingController.text = _counter.toString();
      }
    });
  }

  void _manualInput(String value) {
    setState(() {
      if (value.isNotEmpty) {
        _counter = int.parse(value);
      } else {
        _counter = 0;
      }
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
          customerOrderDisplayId = orderData!.orderInfo!.orderDisplayId.toString();
          customerName = orderData.orderInfo!.orderBookedBys!.name.toString();
          customerMobileNo = orderData.orderInfo!.orderBookedBys!.mobile.toString();
          customerServices = orderData.orderInfo!.service!.name.toString();
          customerServicesType = orderData.orderInfo!.orderType!.typeName.toString();
          customerPickupData = orderData.orderInfo!.pickupDate.toString();
          customerDeliveryData = orderData.orderInfo!.deliveryDate.toString();
          status = orderData.orderInfo!.status.toString();
          customerPickupData = orderData.orderInfo!.pickupDate.toString();
          serviceCharge = orderData.orderInfo!.rateMultiplier.toString();
          customerId = orderData.orderInfo!.customerId.toString();
          orderInfoData = orderData.orderInfo;
          orderStageId = orderData.orderInfo!.orderWiseStages![0].orderstageId;
          orderInfoData.payLater = 1;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  Future<void> _uploadImgCamera() async {
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    final img = File(image.path);
    print("imgggggggggg $img");
    // converting image file to base64
    List<int> imageBytes = img.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    setState(() {
      _prodctImageList.add(img);

      var data = {
        "picComment": '',
        "picSrc": "data:image/jpg;base64,${base64Image.toString()}"
      };
      clothePics.add(data);
    });

    // List<int> imageBytes = img.readAsBytesSync();
    // String base64Image = base64Encode(imageBytes);
    // print('imaggggggggggg $base64Image');

    // log(base64Image);
    // debugPrint('Debug output: $base64Image');
  }

  Future<void> proceed() async {
    var totalPickedItems = _counter;
    if (totalPickedItems <= 0) {
      messageDialogBox('No Of Clothes', 'Please enter number of clothes.');
      // showCustomSnackBar(
      //     title: 'No Of Clothes', 'Please enter number of clothes');
    } else if (_prodctImageList.isEmpty) {
      messageDialogBox('Clothes Images', 'Please upload images of clothes. A minimum of one image is required');
      // showCustomSnackBar(
      //     title: 'Clothes Images', 'Please upload clothes images');
    } else {
      setState(() {
        isProceed = true;
      });
      print('orderInfo ${orderInfoData.payLater}');
      var orderId = widget.orderId;
      var orderstageId = orderStageId;
      List orderItems = [];
      var Orders = orderInfoData;
      List bagInfo = [
        {"bagno": '1'}
      ];
      var totalItems = _counter;
      var stageComments = '';
      var modeOfPayment = '';
      List clothPics = clothePics;
      // print('KKKKKKKK $totalPickedItems and $_counter');
      await pickupApi
          .quickPickup(
              orderId,
              orderstageId,
              orderItems,
              Orders,
              bagInfo,
              totalPickedItems,
              totalItems,
              stageComments,
              modeOfPayment,
              clothPics)
          .then((value) {
        if (value.success == false) {
          messageDialogBox(value.data!.name, value.data!.message);
        }

        setState(() {
          isProceed = false;
        });
        print('ressssssss $value');
      });
      setState(() {
        isProceed = false;
      });
    }
  }

  messageDialogBox(title, msg) {
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) =>
              //             PendingDeliveriesScreen()),
              //     ((route) => false));

              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderDetail();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Quick order pickup'),
        elevation: 1,
      ),
      body: isLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: AppColor.primaryColor2,
                size: 60,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Order Detail',
                      fontweights: FontWeight.bold,
                    ),
                    const Height(4),
                    CustomerOrderDetailWidget(
                      orderDisplayId: "#$customerOrderDisplayId",
                      // orderStatus: status,
                      services: customerServices,
                      servicesType: customerServicesType,
                      pickupData: customerPickupData,
                      deliveryData: customerDeliveryData,
                    ),
                    const Height(15),
                    BigText(
                      text: 'No of Clothes',
                      fontweights: FontWeight.bold,
                    ),
                    const Height(4),
                    SmallText(
                      text:
                          "Please count clothes properly & enter in the box below",
                      color: Colors.red[300],
                      size: 10,
                    ),
                    const Height(8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
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
                            child: IconButton(
                                onPressed: _incrementCounter,
                                icon: const Icon(Icons.add_circle)),
                          ),
                        ),
                        const Widths(15),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            height: size.height * 0.07,
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
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: _textEditingController,
                                    onChanged: _manualInput,
                                    style: TextStyle(
                                        color: AppColor.primaryColor1,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffADA4A5),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Number of Clothes',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Widths(15),
                        Expanded(
                          child: Container(
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
                            child: IconButton(
                                onPressed: _decrementCounter,
                                icon: Icon(Icons.remove_circle)),
                          ),
                        ),
                      ],
                    ),
                    const Height(20),
                    BigText(
                      text: 'Clothes Image',
                      fontweights: FontWeight.bold,
                    ),
                    const Height(3),
                    SmallText(
                      text: "Max 5 images upload",
                      color: Colors.grey,
                      size: 10,
                    ),
                    const Height(8),
                    Container(
                        alignment: Alignment.center,
                        height: 260,
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
                    BigText(
                      text: 'Comment',
                      fontweights: FontWeight.bold,
                    ),
                    const Height(8),
                    Container(
                      width: double.infinity,
                      height: 80,
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                controller: comment,
                                style: const TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.next,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xffADA4A5),
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'comment',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
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
              Row(
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 25,
                  ),
                  const Widths(5),
                  SmallText(
                    text: _counter.toString(),
                    size: 20,
                    color: Colors.black,
                    // color: AppColor.primaryColor1,
                    fontweights: FontWeight.bold,
                  ),
                ],
              ),
              const Widths(85),
              Expanded(
                child: ButtonWidget(
                    backgroundColor: AppColor.primaryColor1,
                    isLoding: isProceed,
                    text: 'Proceed',
                    onPressed: () {
                      proceed();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addProductImages() {
    return GridView.builder(
        shrinkWrap: false,
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 15),
        itemCount: _prodctImageList.length + 1,
        itemBuilder: (BuildContext context, index) {
          return index == _prodctImageList.length
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (_prodctImageList.length <= 5) {
                        _uploadImgCamera();
                      } else {
                        messageDialogBox('Clothes Image',
                            'You can upload a maximum of 5 images.');
                      }
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
                                    clothePics.removeAt(index);
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




// import 'package:flutter/material.dart';


// class QuickPickupScreen extends StatefulWidget {
//   final String orderId;
//   QuickPickupScreen({super.key, required this.orderId});
  
//   @override
//   _QuickPickupScreenState createState() => _QuickPickupScreenState();
// }

// class _QuickPickupScreenState extends State<QuickPickupScreen> {
//   int _counter = 0;
//   TextEditingController _textEditingController = TextEditingController();

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//       _textEditingController.text = _counter.toString();
//     });
//   }

//   void _decrementCounter() {
//     setState(() {
//       if (_counter > 0) {
//         _counter--;
//         _textEditingController.text = _counter.toString();
//       }
//     });
//   }

//   void _manualInput(String value) {
//     setState(() {
//       if (value.isNotEmpty) {
//         _counter = int.parse(value);
//       } else {
//         _counter = 0;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Counter App')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.remove),
//                   onPressed: _decrementCounter,
//                 ),
//                 SizedBox(width: 20),
//                 Container(
//                   width: 100,
//                   child: TextField(
//                     controller: _textEditingController,
//                     onChanged: _manualInput,
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: _incrementCounter,
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Text('Counter: $_counter'),
//           ],
//         ),
//       ),
//     );
//   }
// }
