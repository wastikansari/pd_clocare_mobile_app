import 'dart:io';
import 'package:get/get.dart';
import 'package:new_clocare_delivery_boy/backend/api/reason_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/staff_api.dart';
import 'package:new_clocare_delivery_boy/backend/controller/staff_earing_data_controller.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/pending_pickup_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NotAbleToPickup extends StatefulWidget {
  final String orderId;
  const NotAbleToPickup({super.key, required this.orderId});

  @override
  State<NotAbleToPickup> createState() => _NotAbleToPickupState();
}

class _NotAbleToPickupState extends State<NotAbleToPickup> {
  final staffEaringData = Get.find<DataController>();
  ReasonApi reasonApi = ReasonApi();
  StaffApi staffApi = StaffApi();
  bool isLoading = false;
  bool isSubmit = false;
  List<Map<String, String>> options = [];
  String selectReason = '';
  String selectReasonId = '';
  String distance = '';
  String timeTakens = '';
  String earning = '';
  String type = 'Not able to pickup';
  File? _selectedImage;

  Future<void> _getImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 30);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  getReasonData() async {
    setState(() {
      isLoading = true;
    });
    await reasonApi
        .getdeliveryAttemptsReasonslist(widget.orderId)
        .then((value) {
      if (value.success == true) {
        var pickupAttemptReasonsList = value.data!.pickupAttemptReasons;
        for (int i = 0; i < pickupAttemptReasonsList!.length; i++) {
          setState(() {
            options.add({
              "id": pickupAttemptReasonsList[i].code.toString(),
              "data": pickupAttemptReasonsList[i].value.toString()
            });
            isLoading = false;
          });
        }
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getReasonData();
    final data = staffEaringData.data;
    setState(() {
      distance = data.distance.toString();
      timeTakens = data.timeTaken.toString();
      earning = data.earning.toString();
    });
  }

  submitData() async {
    var orderId = widget.orderId;
    String reasonCode = selectReasonId;
    String reason = selectReason;
    if (reason.isEmpty) {
      showCustomSnackBar(title: 'Reason', 'Please select reason then submit');
    } else if (reasonCode == 'dc' ||
        reasonCode == 'cna' ||
        reasonCode == 'ndp') {
      if (_selectedImage == null) {
        showCustomSnackBar(
            title: 'Upload Image', 'Please upload image for prove');
      } else {
        conformationDialogBox(orderId, reasonCode, reason);
      }
    } else {
      conformationDialogBox(orderId, reasonCode, reason);
    }
  }

  conformationDialogBox(orderId, reasonCode, reason) {
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Reason'),
        content: const Text(
            'Are you sure you are choosing the right reason for not being able to deliver the order because this action sends a message to the customer'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              submit(orderId, reasonCode, reason);
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  submit(orderId, reasonCode, reason) async {
    setState(() {
      isSubmit = true;
    });

    await reasonApi
        .pickupAttempts(orderId, reasonCode, reason)
        .then((value) async {
      if (value.data!.status == 'done') {
        await staffApi
            .staffPerOrderEarning(distance, timeTakens, earning, type)
            .then((datas) {
          print('staffPerOrderEarning ${datas.data!.status.toString()}');
          setState(() {
            isSubmit = false;
          });
        });
        setState(() {
          isSubmit = false;
        });

        // ignore: use_build_context_synchronously
        await showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Reason'),
            content: const Text('Your deliver reason successfully save'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PendingPickupScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Not able to pickup'),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Height(15),
              Row(
                children: [
                  BigText(
                    text: 'Reason',
                    fontweights: FontWeight.w500,
                    size: 18,
                  ),
                  BigText(
                    text: '*',
                    fontweights: FontWeight.w500,
                    color: Colors.red,
                    size: 18,
                  ),
                ],
              ),
              SmallText(text: 'Please choose reason from below list'),
              const Height(15),
              const Height(15),
              Container(
                height: size.height * 0.07,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(53, 132, 161, 242),
                  // color: AppColor.backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: DropdownButton(
                  padding: const EdgeInsets.all(20),
                  isExpanded: true,
                  hint: SmallText(
                    text: selectReason.isEmpty ? 'Select reason' : selectReason,
                    size: 14,
                    color: selectReason.isEmpty ? Colors.black45 : Colors.black,
                    fontweights: FontWeight.w400,
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 19,
                  elevation: 4,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectReason = newValue!;
                      selectReasonId = options
                          .firstWhere(
                              (element) => element['data'] == newValue)['id']
                          .toString();
                      print(
                          'select reason $selectReason and id $selectReasonId');
                    });
                  },
                  items: options.map<DropdownMenuItem<String>>((data) {
                    print('bbbbbbbbbbbbbbbbbbbbbbbbb $data');
                    return DropdownMenuItem<String>(
                      value: data['data'].toString(),
                      child: Text(data['data'].toString()),
                    );
                  }).toList(),

                  // options.map<DropdownMenuItem<String>>((e) {
                  //   return DropdownMenuItem<String>(
                  //       value: e.toString(), child: Text(e));
                  // }).toList(),
                ),

                // Row(
                //   children: [
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 12, right: 15),
                //         child: TextField(
                //           keyboardType: keyboardType,
                //           readOnly: widget == null ? false : true,
                //           autofocus: false,
                //           controller: controller,
                //           style: const TextStyle(color: Colors.black),
                //           textInputAction: TextInputAction.next,
                //           decoration: InputDecoration(
                //               // errorStyle: const TextStyle(height: 0),
                //               hintStyle: const TextStyle(
                //                 fontSize: 14,
                //                 color: Color(0xffADA4A5),
                //               ),
                //               border: InputBorder.none,
                //               // contentPadding: EdgeInsets.only(
                //               //   top: size.height * 0.028,
                //               // ),
                //               hintText: hintText,
                //               suffixIcon: suffixIcon),
                //         ),
                //       ),
                //     ),
                //     widget == null
                //         ? Container()
                //         : Container(
                //             child: widget,
                //           )
                //   ],
                // ),
              ),
              const Height(30),
              Row(
                children: [
                  BigText(
                    text: 'Upload Image',
                    fontweights: FontWeight.w500,
                    size: 18,
                  ),
                  BigText(
                    text: '*',
                    fontweights: FontWeight.w500,
                    color: Colors.red,
                    size: 18,
                  ),
                ],
              ),
              SmallText(text: 'Please upload image for varification'),
              const Height(15),
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    _getImageFromCamera();
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(15),
                    padding: const EdgeInsets.all(6),
                    dashPattern: const [4, 2],
                    color: AppColor.primaryColor1,
                    strokeWidth: 1,
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(53, 132, 161, 242),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: _selectedImage != null
                            ? GestureDetector(
                                onTap: _getImageFromCamera,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.file(
                                      _selectedImage!,
                                      // height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                        height: 30,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              142, 243, 243, 243),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SmallText(
                                              text: 'Replace',
                                              size: 12,
                                              fontweights: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                            const Icon(Icons.edit,
                                                size: 10, color: Colors.black),
                                          ],
                                        )),
                                  ],
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: AppColor.primaryColor1,
                                  ),
                                  const Height(5),
                                  SmallText(
                                    text: 'Upload Image',
                                    fontweights: FontWeight.w500,
                                    color: AppColor.primaryColor1,
                                  )
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              const Height(60),
              ButtonWidget(
                  backgroundColor: AppColor.primaryColor1,
                  isLoding: isSubmit,
                  text: 'Submit',
                  onPressed: () {
                    submitData();
                  }),
              const Height(15),
            ],
          ),
        ),
      ),
    );
  }
}
