import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/customer_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/service_api.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/created_new_customer/add_address_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/take_order/choose_garments_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/dropdown_button.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerInfoScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final userNumber;

  const CustomerInfoScreen({super.key, this.userNumber});

  @override
  State<CustomerInfoScreen> createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen> {
  CustomerApi customerApi = CustomerApi();
  ServiceApi serviceApi = ServiceApi();
  var se = TextEditingController();
  bool isLoaded = false;
  bool isLoadedInside = false;
  int? customersId;
  String name = '';
  String phoneNo = '';
  String emailId = '';
  String createOn = '';
  String customToken = '';
  String pickupDate = '';
  String pickupTime = '';
  String deliveryDate = '';
  String deliverTime = '';
  String selectedService = 'Regular Ironing';
  int selectedServiceId = 6;
  String selectedServiceType = '';
  int selectedServiceTypeId = 0;
  String selectedAddress = '';
  int? selectedAddressId;
  List<Map<String, dynamic>>? addressList;
  List<Map<String, dynamic>>? serviceList;
  List<Map<String, dynamic>>? serviceTypeList;

  // List serviceList = [
  //   // 'Regular Ironing',
  //   // 'Premium Ironging',
  //   // 'Wash',
  //   // 'Wash + Ironging',
  //   // 'Dry Cleaning',
  //   // 'Tailoring',
  //   // 'Sofa Cleaning',
  //   // 'Home Cleaning',
  //   // 'Car Cleaning',
  // ];

  List<String> serviceType = [
    'Quick Service (Delivers in 4 hrs)',
    'Express Service (Delivers in 12 hrs)',
    'Daily Service (Delivers in 24 hrs)',
    'Regular Service (Delivers in 48 hrs)',
  ];

  List<String> pickupTimeSlot = [
    '7 AM to 9 AM',
    '9 AM to 1 PM',
    '1 PM to 5 PM',
    '5 PM to 9 PM',
  ];

  DateTime now = DateTime.now();

  void generateDeliveryDate(currentDates) {
    // deliveryDate = [];
    // selectDeliveryDate = '';

    // DateTime currentDate = DateTime.parse(currentDates);

    // for (int i = 0; i < 7; i++) {
    //   deliveryDate.add(currentDate.add(Duration(days: i)).toString());
    // }
  }

  void getPickupSlot(selectedServiceType) {
    String type = selectedServiceType.toString();
    var t = type.split('Delivers in ')[1];
    var tt = t.split(' hrs')[0];
    print('eeeeeeeeeeee $t and $tt');
    String currentDate = DateFormat('dd-MMM-yyyy').format(now);
    pickupDate = currentDate;
    print('currentDate $currentDate');
    if (now.hour >= 7 && now.hour < 9) {
      pickupTime = pickupTimeSlot[0];
    } else if (now.hour >= 9 && now.hour < 13) {
      // 1 PM
      pickupTime = pickupTimeSlot[1];
    } else if (now.hour >= 13 && now.hour < 17) {
      // 1 PM TO
      pickupTime = pickupTimeSlot[2];
    } else if (now.hour >= 17 && now.hour < 21) {
      pickupTime = pickupTimeSlot[3];
    } else if (now.hour >= 21 && now.hour < 22) {
      pickupTime = pickupTimeSlot[4];
    } else {
      pickupTime = '';
    }
  }

  void getDeliverySlot(selectedServiceType) {
    print('wastik $selectedServiceType');
    if (selectedServiceType == serviceType[0]) {
      deliveryDate = pickupDate;

      if (now.hour >= 7 && now.hour < 9) {
        deliverTime = pickupTimeSlot[0];
      } else if (now.hour >= 9 && now.hour < 13) {
        deliverTime = pickupTimeSlot[1];
      } else if (now.hour >= 13 && now.hour < 17) {
        deliverTime = pickupTimeSlot[2];
      } else if (now.hour >= 17 && now.hour < 21) {
        deliverTime = pickupTimeSlot[3];
      } else if (now.hour >= 21 && now.hour < 22) {
        deliverTime = pickupTimeSlot[4];
      } else {
        deliverTime = '';
      }
      print('t 4 hrs');
    } else if (selectedServiceType == serviceType[1]) {
      deliverTime = '';
      deliveryDate = '';
      final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
      deliveryDate = DateFormat('dd-MMM-yyyy').format(tomorrow);
      if (now.hour >= 7 && now.hour < 9) {
        deliverTime = pickupTimeSlot[0];
      } else if (now.hour >= 9 && now.hour < 13) {
        deliverTime = pickupTimeSlot[1];
      } else if (now.hour >= 13 && now.hour < 17) {
        deliverTime = pickupTimeSlot[2];
      } else if (now.hour >= 17 && now.hour < 21) {
        deliverTime = pickupTimeSlot[3];
      } else if (now.hour >= 21 && now.hour < 22) {
        deliverTime = pickupTimeSlot[4];
      } else {
        deliverTime = '';
      }
      print(' t 12 hrs');
    } else if (selectedServiceType == serviceType[2]) {
      deliverTime = '';
      deliveryDate = '';
      final DateTime tomorrow = DateTime.now().add(const Duration(days: 2));
      deliveryDate = DateFormat('dd-MMM-yyyy').format(tomorrow);

      if (now.hour >= 7 && now.hour < 9) {
        deliverTime = pickupTimeSlot[0];
      } else if (now.hour >= 9 && now.hour < 13) {
        deliverTime = pickupTimeSlot[1];
      } else if (now.hour >= 13 && now.hour < 17) {
        deliverTime = pickupTimeSlot[2];
      } else if (now.hour >= 17 && now.hour < 21) {
        deliverTime = pickupTimeSlot[3];
      } else if (now.hour >= 21 && now.hour < 22) {
        deliverTime = pickupTimeSlot[4];
      } else {
        deliverTime = '';
      }
      // print('t 24 hrs');
    } else if (selectedServiceType == serviceType[3]) {
      deliverTime = '';
      deliveryDate = '';
      final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
      deliveryDate = DateFormat('dd-MMM-yyyy').format(tomorrow);

      if (now.hour >= 7 && now.hour < 9) {
        deliverTime = pickupTimeSlot[0];
      } else if (now.hour >= 9 && now.hour < 13) {
        deliverTime = pickupTimeSlot[1];
      } else if (now.hour >= 13 && now.hour < 17) {
        deliverTime = pickupTimeSlot[2];
      } else if (now.hour >= 17 && now.hour < 21) {
        deliverTime = pickupTimeSlot[3];
      } else if (now.hour >= 21 && now.hour < 22) {
        deliverTime = pickupTimeSlot[4];
      } else {
        deliverTime = '';
      }
      print('t 48 hrs');
    } else {
      deliverTime = '';
      deliveryDate = '';
      print('sorry');
    }
  }

  Future<void> getCustomInfo() async {
    setState(() {
      isLoaded = true;
    });
    await customerApi.custmerInfo(widget.userNumber).then((value) {
      setState(() {
        isLoaded = true;
      });
      if (value.success == true) {
        var getData = value.data;
        setState(() {
          customersId = getData!.customerInfo!.customerId;
          name =
              '${getData.customerInfo!.firstname} ${getData.customerInfo!.lastname}';
          phoneNo = getData.customerInfo!.mobile.toString();
          emailId = getData.customerInfo!.email.toString();
          createOn = getData.customerInfo!.createdOn.toString();
          customToken = getData.loginInfo!.accessToken.toString();
          // for (int i = 0; i < getData.addressInfo!.length; i++) {
          //   addressList.add(getData.addressInfo![i].formattedAddress);
          // }
          addressList = getData.addressInfo!.map((data) {
            return {
              'address_id': data.addressId,
              'formattedAddress': data.formattedAddress,
            };
          }).toList();
          serviceList = getData.serviceList!.map((data) {
            return {
              'service_id': data.serviceId,
              'service_name': data.name,
            };
          }).toList();
          getServiceTypeList(selectedServiceId);
        });
      }
    });
  }

  Future getServiceTypeList(selectedServiceId) async {
    setState(() {
      isLoadedInside = true;
    });
    int serviceId = selectedServiceId;
    int customerId = customersId!;

    await serviceApi.getServiceTypeList(serviceId, customerId).then((value) {
      print('get service type ${value.success}');
      if (value.success == true) {
        var getData = value.data;
        // for (int i = 0; i < getData!.list!.length; i++) {
        serviceTypeList = getData!.list!.map((data) {
          return {
            'ordertype_id': data.ordertypeId,
            'type_name': data.typeName,
            'deliver_in_hrs': data.deliverInHrs,
            'charges': data.charges,
            'min_ord_val': data.minOrdVal,
            'fix_charge': data.fixCharge,
            'apply_fix_charge_for_less_than_qty':
                data.applyFixChargeForLessThanQty
          };
        }).toList();

        selectedServiceType = getData.list![0].typeName!;
        selectedServiceTypeId = getData.list![0].ordertypeId!;
        setState(() {
          isLoaded = false;
          isLoadedInside = false;
        });
      }
      setState(() {
        isLoaded = false;
        isLoadedInside = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomInfo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Customer Info'),
        elevation: 2,
      ),
      body: isLoaded
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
              color: AppColor.primaryColor1,
              size: 60,
            ))
          : Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Stack(children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Height(15),
                      BigText(
                        text: 'About Customer',
                        fontweights: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      const Height(7),
                      Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 228, 241, 252),
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
                              color: const Color.fromARGB(255, 232, 232, 232)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        // decoration: const BoxDecoration(
                        //   color: Color.fromARGB(255, 228, 241, 252),
                        //   borderRadius: BorderRadius.all(Radius.circular(8)),
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextForm(title: 'Name', value: name),
                              const Height(7),
                              TextForm(
                                title: 'Phone no',
                                value: phoneNo,
                              ),
                              const Height(7),
                              TextForm(
                                title: 'Email id',
                                value: emailId,
                              ),
                              const Height(7),
                              TextForm(
                                title: 'created on',
                                value: createOn,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const Divider(),
                      const Height(15),

                      CustomFormDropDown(
                        title: 'Services',
                        hintText: selectedService.isEmpty
                            ? 'Choose Services'
                            : selectedService,
                        hintColor: selectedService.isEmpty
                            ? Colors.black38
                            : Colors.black,
                        onChanged: (newValue) {
                          setState(() {
                            selectedService =
                                newValue!['service_name'].toString();
                            selectedServiceId = newValue['service_id'];
                            getServiceTypeList(selectedServiceId);
                            print(
                                'select services is $selectedService and $selectedServiceId');
                          });
                        },
                        items: serviceList!
                            .map<DropdownMenuItem<Map<String, dynamic>>>(
                                (Map<String, dynamic> map) {
                          return DropdownMenuItem<Map<String, dynamic>>(
                            value: map,
                            child: Text('${map['service_name']}'),
                          );
                        }).toList(),
                      ),
                      const Height(12),
                      CustomFormDropDown(
                        title: 'Type',
                        hintText: selectedServiceType.isEmpty
                            ? 'Select type of services'
                            : selectedServiceType,
                        hintColor: selectedServiceType.isEmpty
                            ? Colors.black38
                            : Colors.black,
                        onChanged: (newValue) {
                          setState(() {
                            selectedServiceType =
                                newValue!['type_name'].toString();
                            selectedServiceTypeId = newValue['ordertype_id'];
                            print(
                                'service type $selectedServiceType and $selectedServiceTypeId');

                            // getDeliverySlot(selectedServiceType);
                            // getPickupSlot(selectedServiceType);
                          });
                        },
                        items: serviceTypeList!
                            .map<DropdownMenuItem<Map<String, dynamic>>>(
                                (Map<String, dynamic> map) {
                          return DropdownMenuItem<Map<String, dynamic>>(
                            value: map,
                            child: Text('${map['type_name']}'),
                          );
                        }).toList(),
                      ),
                      const Height(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                              child: CustomFormDropDown(
                            title: 'Address',
                            hintText: selectedAddress.isEmpty
                                ? 'Select address'
                                : selectedAddress,
                            hintColor: selectedAddress.isEmpty
                                ? Colors.black38
                                : Colors.black,
                            onChanged: (newValue) {
                              setState(() {
                                selectedAddress =
                                    newValue!['formattedAddress'].toString();
                                selectedAddressId = newValue['address_id'];

                                print(
                                    'address $selectedAddress and $selectedAddressId');

                                // getDeliverySlot(selectedServiceType);
                                // getPickupSlot(selectedServiceType);
                              });
                            },
                            items: addressList!
                                .map<DropdownMenuItem<Map<String, dynamic>>>(
                                    (Map<String, dynamic> map) {
                              return DropdownMenuItem<Map<String, dynamic>>(
                                  value: map,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SmallText(
                                      text: '${map['formattedAddress']}',
                                      color: Colors.black,
                                      size: 14,
                                      overFlow: TextOverflow.visible,
                                    ),
                                  ));
                            }).toList(),
                          )),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.to(CreateAddressScreen());
                              Get.to(CreateAddressScreen(
                                customorToken: customToken,
                              ));
                            },
                            child: Container(
                              height: size.height * 0.07,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColor.primaryColor1,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 28,
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Height(14),
                      Row(
                        children: [
                          Expanded(
                            child: SlotWidget(
                              title: 'Pickup Date',
                              output: pickupDate.isEmpty
                                  ? 'dd-mm-yyyy'
                                  : pickupDate,
                              outputColor: pickupDate.isEmpty
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          // SizedBox(width: 12,),
                          Expanded(
                            child: SlotWidget(
                              title: 'Pickup Time',
                              output:
                                  pickupTime.isEmpty ? 'hh-min' : pickupTime,
                              outputColor: pickupTime.isEmpty
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Height(14),
                      Row(
                        children: [
                          Expanded(
                            child: SlotWidget(
                              title: 'Delivery Date',
                              output: deliveryDate.isEmpty
                                  ? 'dd-mm-yyyy'
                                  : deliveryDate,
                              outputColor: deliveryDate.isEmpty
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: SlotWidget(
                              title: 'Delivery Time',
                              output:
                                  deliverTime.isEmpty ? 'hh-min' : deliverTime,
                              outputColor: deliverTime.isEmpty
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Height(30),
                      ButtonWidget(
                          text: 'Next',
                          backgroundColor: AppColor.primaryColor1,
                          onPressed: () {
                            // CustomerApi customerApi = CustomerApi();
                            // customerApi.custmerInfo('8511558481');
                            Get.to(ChooseGarmentsScreen(
                              serviceId: selectedServiceId.toString(),
                              miniOrderValue: '',
                            ));
                          }),
                      const Height(15),
                    ],
                  ),
                ),
                isLoadedInside
                    ? Positioned(
                        child: Center(
                            child: LoadingAnimationWidget.fourRotatingDots(
                        color: AppColor.primaryColor1,
                        size: 60,
                      )))
                    : Container()
              ])
              // } else {
              //   return Center(
              //       child: LoadingAnimationWidget.fourRotatingDots(
              //     color: AppColor.primaryColor2,
              //     size: 60,
              //   ));
              // }
              // },
              // ),
              ),
    );
  }
}

class SlotWidget extends StatelessWidget {
  final String title;
  final String output;
  final Color outputColor;
  const SlotWidget({
    super.key,
    required this.title,
    required this.output,
    required this.outputColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.015),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BigText(
                text: title,
                fontweights: FontWeight.w500,
                size: 14,
              ),
              BigText(
                text: '*',
                fontweights: FontWeight.w500,
                color: Colors.red,
                size: 14,
              ),
            ],
          ),
          const Height(8),
          Container(
            width: double.infinity,
            height: size.height * 0.07,
            decoration: BoxDecoration(
              color: AppColor.textFromColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 9),
                child: Text(
                  output,
                  style: TextStyle(color: outputColor),
                )),
          ),
        ],
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final String title;
  final String value;
  const TextForm({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BigText(
          text: '$title : ',
          fontweights: FontWeight.w500,
          size: 15,
        ),
        BigText(
          text: value,
          size: 14,
        ),
      ],
    );
  }
}
