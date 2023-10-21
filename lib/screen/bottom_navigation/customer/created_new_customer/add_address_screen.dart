import 'package:new_clocare_delivery_boy/backend/api/customer_api.dart';
import 'package:new_clocare_delivery_boy/backend/controller/pincode_controller.dart';
import 'package:new_clocare_delivery_boy/backend/logic/current_location.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/dropdown_button.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/text_field.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CreateAddressScreen extends StatefulWidget {
  final String customorToken;
  const CreateAddressScreen({super.key, required this.customorToken});

  @override
  State<CreateAddressScreen> createState() => _CreateAddressScreenState();
}

class _CreateAddressScreenState extends State<CreateAddressScreen> {
  PincodeController pincodeController = Get.put(PincodeController());
  GetCurrentLocation getCurrentLocation = GetCurrentLocation();
  CustomerApi customerApi = CustomerApi();
  TextEditingController flatController = TextEditingController();
  TextEditingController societyController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  bool isLoaded = false;
  bool isLoading = false;
  bool isVisibel = false;
  var _selectedCity = 'Vadodara';
  var _selectedCityId = '7';
  var selectedPincodeName = '';
  var selectedPincodeId = '';
  String address = '';
  List<Map<String, String>> cities = [
    {
      "city_id": "7",
      "city_name": "Vadodara",
    },
    {
      "city_id": "10",
      "city_name": "Ahmedabad",
    },
    {
      "city_id": "8",
      "city_name": "Surat",
    },
  ];

  _submit() async {
    final String customerToken = widget.customorToken;
    final String flatNo = flatController.text;
    final String society = societyController.text;
    final String landMark = landmarkController.text;
    const int stateId = 9;
    final String cityId = _selectedCityId;
    final String pincodeId = selectedPincodeId;

    if (flatNo.isEmpty) {
      showCustomSnackBar(title: 'Address', 'Please enter Flat/House number');
    } else if (society.isEmpty) {
      showCustomSnackBar(title: 'Society', 'Please enter Street/Cociety');
    } else if (landMark.isEmpty) {
      showCustomSnackBar(title: 'Landmark', 'Please enter Landmark/Area');
    } else if (_selectedCity.isEmpty) {
      showCustomSnackBar(title: 'City', 'Please selected city');
    } else if (selectedPincodeName.isEmpty) {
      showCustomSnackBar(title: 'Pincode', 'Please selected pincode');
    } else {
      setState(() {
        isLoaded = true;
      });
      await customerApi
          .custmerAddressCreate(customerToken, flatNo, society, landMark,
              stateId, cityId, pincodeId)
          .then((value) {
        print('fffff ${value.data!.status}');
        if (value.data!.status == 'ok') {
          setState(() {
            isLoaded = false;
          });
          showCustomSnackBar(
              title: 'Successfully',
              'Customer new address created successfully');


          Navigator.pop(context);
        } else {
          showCustomSnackBar(title: 'Error', 'Please enter valid credentials');
          setState(() {
            isLoaded = false;
          });
        }
      });
    }
  }

  getLocation() {
    setState(() {
      isLoading = true;
    });
    getCurrentLocation.getCurrentLocation().then((value) {
      print('mmmmmmmmmmmmmmm ${value.name}');
      setState(() {
        address =
            '${value.street}, ${value.subLocality}, ${value.thoroughfare}, ${value.locality}, ${value.administrativeArea}, ${value.country}, ${value.postalCode}';
        // societyController.text = value.Street;
        // landmarkController.text = value.Sublocality;
        // _selectedCity = value.Locality;
      });
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<PincodeController>().getPincodeList(_selectedCityId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          'Add New Address',
        ),
      ),
      body: isLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: AppColor.primaryColor1,
                size: 60,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Height(16),
                    BigText(
                      text: 'Address Detail',
                      fontweights: FontWeight.bold,
                      color: Colors.black54,
                    ),
                    CustomTextFieldForm(
                      hintText: 'Flat / House No',
                      icon: Icons.home_outlined,
                      controller: flatController,
                    ),
                    CustomTextFieldForm(
                      hintText: 'Street / Society',
                      icon: Icons.holiday_village_outlined,
                      controller: societyController,
                    ),
                    CustomTextFieldForm(
                      hintText: 'Landmark / Area',
                      icon: Icons.area_chart_outlined,
                      controller: landmarkController,
                    ),
                    CustomDropDown(
                      hintText: _selectedCity.isEmpty ? 'City' : _selectedCity,
                      hintColor:
                          _selectedCity.isEmpty ? Colors.black38 : Colors.black,
                      icon: Icons.location_city,
                      onChanged: (newValue) {
                        print(_selectedCity);
                        setState(() {
                          _selectedCityId = newValue.toString();
                          _selectedCity = cities.firstWhere((city) =>
                              city['city_id'] ==
                              newValue.toString())['city_name']!;
                        });
                        Get.find<PincodeController>()
                            .getPincodeList(_selectedCityId);
                        print(_selectedCity);
                        print(_selectedCityId);
                        selectedPincodeName = '';
                      },
                      items: cities.map<DropdownMenuItem<String>>(
                          (Map<String, String> city) {
                        return DropdownMenuItem<String>(
                          value: city['city_id'],
                          child: Text(city['city_name']!),
                        );
                      }).toList(),
                    ),
                    Obx(
                      () {
                        final model = pincodeController.pincodeModel.value;

                        if (model.success == null) {
                          return Center(
                            child: LoadingAnimationWidget.prograssiveDots(
                              color: AppColor.primaryColor2,
                              size: 60,
                            ),
                          );
                        } else if (model.success == false) {
                          return const Text('Data retrieval failed.');
                        } else {
                          var pincodeList = model.data!.items;
                          print("DARTA FDF $pincodeList");

                          List<Map<String, dynamic>> pincodeMapList =
                              pincodeList!.map((pincode) {
                            return {
                              'pincode_id': pincode.pincodeId,
                              'area_pincodeName': pincode.areaName,
                              'area_pincode': pincode.pincode,
                            };
                          }).toList();
                          if (pincodeController.isLoading.value) {
                            return Center(
                              child: LoadingAnimationWidget.prograssiveDots(
                                color: AppColor.primaryColor2,
                                size: 60,
                              ),
                            );
                          } else {
                            return CustomDropDown(
                              hintText: selectedPincodeName.isEmpty
                                  ? 'Pincode'
                                  : selectedPincodeName,
                              hintColor: selectedPincodeName.isEmpty
                                  ? Colors.black38
                                  : Colors.black,
                              icon: Icons.pinch_outlined,
                              onChanged: (newValue) {
                                setState(() {
                                  String data = newValue.toString();
                                  var d = data.split(',');
                                  selectedPincodeId =
                                      d[0].split('{pincode_id: ')[1].toString();
                                  var selectedPN1 = d[1]
                                      .split('area_pincodeName: ')[1]
                                      .split('}')[0]
                                      .toString();
                                  var selectedPN2 = d[2]
                                      .split('area_pincode: ')[1]
                                      .split('}')[0]
                                      .toString();
                                  selectedPincodeName =
                                      '$selectedPN1+ ($selectedPN2)';
                                  print('was $newValue');
                                  print('was $selectedPincodeId');
                                  print('was ${selectedPincodeName}');
                                });
                              },
                              items: pincodeMapList
                                  .map<DropdownMenuItem<Map<String, dynamic>>>(
                                      (Map<String, dynamic> map) {
                                return DropdownMenuItem<Map<String, dynamic>>(
                                  value: map,
                                  child: Text(
                                      '${map['area_pincode']} (${map['area_pincodeName']})'),
                                );
                              }).toList(),
                            );
                          }
                        }
                      },
                    ),
                    const Height(20),
                    InkWell(
                      onTap: () {
                        getLocation();
                        setState(() {
                          isVisibel = !isVisibel;
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 170,
                        decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 206, 215, 228),
                          border: Border.all(
                              color: const Color.fromARGB(196, 223, 223, 223)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.red.shade800,
                              ),
                              const Widths(4),
                              SmallText(
                                text: 'Use Current Location',
                                color: AppColor.primaryColor1,
                                fontweights: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Height(20),
                    Visibility(
                      visible: isVisibel,
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 206, 215, 228),
                          border: Border.all(
                              color: const Color.fromARGB(255, 229, 229, 229)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SmallText(
                            text: address,
                            overFlow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    const Height(60),
                    ButtonWidget(
                        backgroundColor: AppColor.primaryColor1,
                        isLoding: isLoaded,
                        text: 'Save',
                        onPressed: () {
                          _submit();
                        }),
                    const Height(50),
                  ],
                ),
              ),
            ),
    );
  }
}
