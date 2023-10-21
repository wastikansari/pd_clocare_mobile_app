import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/order_detail_api.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:record/record.dart';

import 'complete_pickup_order_screen.dart';

class RecordeingScreen extends StatefulWidget {
  final String orderId;
  const RecordeingScreen({super.key, required this.orderId});

  @override
  State<RecordeingScreen> createState() => _RecordeingScreenState();
}

class _RecordeingScreenState extends State<RecordeingScreen> {
  OrderDetailApi orderDetailApi = OrderDetailApi();
  Record? audioRecord;
  AudioPlayer? audioPlayer;
  bool isRecording = false;
  bool isPlaying = false;

  String audioPathe = '';
  int _seconds = 0;
  bool _isActive = false;
  bool isVisibal = false;
  Timer? _timer;
  int totalTime = 0;
  String totalClothes = '0';
  final picker = ImagePicker();
  bool isLoading = false;
  bool isProceed = false;
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

  @override
  void initState() {
    // TODO: implement initState
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    getOrderDetail();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer!.dispose();
    audioRecord!.dispose();
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

  Future<void> startRecording() async {
    try {
      if (await audioRecord!.hasPermission()) {
        await audioRecord!.start();
        _startTimer();
        setState(() {
          isRecording = true;
          _seconds = 0;
        });
      }
    } catch (e) {
      print('Error start recording : $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord!.stop();
      setState(() {
        totalTime = _seconds;
        isVisibal = true;
        isRecording = false;
        audioPathe = path!;
      });

      _stopTimer(_seconds);
    } catch (e) {
      print('Error stop recording : $e');
    }
  }

  Future<void> startPlaying() async {
    try {
      Source urlSource = UrlSource(audioPathe);
      await audioPlayer!.play(urlSource);
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      print('Error playing recording : $e');
    }
  }

  Future<void> stopPlaying() async {
    try {
      Source urlSource = UrlSource(audioPathe);
      await audioPlayer!.stop();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      print('Error playing recording : $e');
    }
  }

  void _startTimer() {
    if (_isActive) return;

    _isActive = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds < 60) {
          _seconds++;
        } else {
          _isActive = false;
          _timer!.cancel();
        }
      });
    });
  }

  void _stopTimer(_seconds) {
    _isActive = false;
    _timer!.cancel();
    _seconds = 0;
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
          customerId = orderData.orderInfo!.customerId.toString();
          orderInfoData = orderData.orderInfo;
          orderStageId = orderData.orderInfo!.orderWiseStages![0].orderstageId;
          print('ORDERS $orderInfoData');
          // status = orderData.orderInfo!.status.toString();
          // address = orderData.orderInfo!.formattedDeliveryAddress.toString();
          // date = orderData.orderInfo!.deliveryDate.toString();
          isLoading = false;
        });
        print('vvvvvvvvvvvvvvvvvvvvvv $customerId');
        // customerWallet(customerId);
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  Future<void> proceed() async {
    String recordingFile = audioPathe;
    String noOfClothes = _counter.toString();
    if (recordingFile.isEmpty) {
      conformationDialogBox('Voice Recording',
          'Please record the number of garments to be collected using your voice.');
    } else if (_counter <= 0) {
      conformationDialogBox('No Of Clothes', 'Please enter number of clothes');
    } else {
      setState(() {
        isProceed = true;
      });

      Timer(const Duration(seconds: 3), () {
        conformationDialogBox(
            'Error', 'Network problem or Try again later. Something is wrong');
        setState(() {
          isProceed = false;
        });
      });
    }
  }

  conformationDialogBox(title, msg) {
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recorde order itemes'),
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
              child: Center(
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
                        text: 'Voice Recorder',
                        fontweights: FontWeight.bold,
                      ),
                      const Height(4),
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
                        child: Column(
                          children: [
                            const Height(20),
                            Image.asset(
                              'asset/image/voice.png',
                              height: 55,
                            ),
                            const Height(10),
                            SmallText(text: 'Recording in progress'),
                            const Height(10),
                            isRecording
                                ? SmallText(
                                    text: '$_seconds Sec',
                                    size: 18,
                                    color: Colors.black,
                                  )
                                : Container(),
                            const Height(20),
                            GestureDetector(
                              onTap: () {
                                isRecording
                                    ? stopRecording()
                                    : startRecording();
                              },
                              child: Container(
                                height: 40,
                                width: 185,
                                decoration: BoxDecoration(
                                    color: isRecording
                                        ? Colors.white
                                        : const Color.fromARGB(
                                            255, 255, 89, 77),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 255, 89, 77))),
                                child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            backgroundColor: isRecording
                                                ? const Color.fromARGB(
                                                    255, 255, 89, 77)
                                                : Color.fromARGB(
                                                    59, 97, 97, 97),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: isRecording
                                                  ? const Icon(
                                                      Icons.stop,
                                                      color: Colors.white,
                                                      size: 18,
                                                    )
                                                  : const Icon(
                                                      Icons.record_voice_over,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                            )),
                                        const Widths(10),
                                        SmallText(
                                          text: isRecording
                                              ? 'Stop Recording'
                                              : 'Start Recording',
                                          size: 15,
                                          color: isRecording
                                              ? const Color.fromARGB(
                                                  255, 255, 89, 77)
                                              : Colors.white,
                                          fontweights: FontWeight.w500,
                                        ),
                                        const Widths(13)
                                      ],
                                    )),
                              ),
                            ),
                            const Height(20),
                            if (!isRecording)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (isVisibal)
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                255, 244, 244, 244),
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
                                        child: SmallText(
                                          text: '$totalTime sec',
                                          color: AppColor.primaryColor1,
                                          fontweights: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  const Height(10),
                                  GestureDetector(
                                    onTap: () {
                                      isPlaying
                                          ? stopPlaying()
                                          : startPlaying();
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 185,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              56, 194, 204, 253),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          border: Border.all(
                                              color: AppColor.primaryColor1)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          isPlaying
                                              ? Icon(
                                                  Icons.stop_circle_outlined,
                                                  color: AppColor.primaryColor1,
                                                  size: 25,
                                                )
                                              : Icon(
                                                  Icons.play_circle,
                                                  color: AppColor.primaryColor1,
                                                  size: 25,
                                                ),
                                          const Widths(10),
                                          SmallText(
                                            text: isPlaying
                                                ? 'Stop Playing'
                                                : 'Play Recording',
                                            size: 15,
                                            color: AppColor.primaryColor1,
                                            fontweights: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            const Height(20),
                          ],
                        ),
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
                                    color: const Color.fromARGB(
                                        255, 221, 221, 221)),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              child: IconButton(
                                  onPressed: _incrementCounter,
                                  icon: Icon(Icons.add_circle)),
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
                                    color: const Color.fromARGB(
                                        255, 221, 221, 221)),
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
                                    color: const Color.fromARGB(
                                        255, 221, 221, 221)),
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
                      const Height(15),
                    ],
                  ),
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
}
