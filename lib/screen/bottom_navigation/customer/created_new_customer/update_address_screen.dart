import 'package:new_clocare_delivery_boy/backend/api/customer_api.dart';
import 'package:new_clocare_delivery_boy/backend/controller/pincode_controller.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/dropdown_button.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/text_field.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UpdateAddressScreen extends StatefulWidget {
  final String mobleNumber;
  final int index;
  const UpdateAddressScreen(
      {super.key, required this.mobleNumber, required this.index});

  @override
  State<UpdateAddressScreen> createState() => _UpdateAddressScreenState();
}

class _UpdateAddressScreenState extends State<UpdateAddressScreen> {
  PincodeController pincodeController = Get.put(PincodeController());
  CustomerApi customerApi = CustomerApi();

  TextEditingController flatController = TextEditingController();
  TextEditingController societyController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();

  bool isLoaded = false;
  bool dataIsLoaded = false;
  var _selectedCity = '';
  var _selectedCityId = '';
  var selectedPincodeName = 'ba';
  var selectedPincodeId = '';

  int? addressId;
 String customerToken = '';
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
          .custmerAddressUpdate(addressId, customerToken, flatNo, society,
              landMark, stateId, cityId, pincodeId)
          .then((value) {
        print('fffff ${value.data!.status}');
        if (value.data!.status == 'ok') {
          setState(() {
            isLoaded = false;
          });
          showCustomSnackBar(
              title: 'Successfully',
              'Customer address update successfully');

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

  void getData() async {
    setState(() {
      dataIsLoaded = true;
    });
    await customerApi.custmerInfo(widget.mobleNumber).then((value) async {
      var getData = value.data;
      var addressInfo = getData!.addressInfo![widget.index];

      flatController.text = addressInfo.flatNo.toString();
      societyController.text = addressInfo.street.toString();
      landmarkController.text = addressInfo.landmark.toString();
      _selectedCityId = addressInfo.cityId.toString();
      selectedPincodeId = addressInfo.pincodeId.toString();
      addressId = addressInfo.addressId;
      customerToken = getData.loginInfo!.accessToken.toString();
      for (var element in cities) {
        if (element['city_id'] == _selectedCityId) {
          _selectedCity = element['city_name'].toString();
        }
      }
      await Get.find<PincodeController>().getPincodeList(_selectedCityId);
      var data = Get.find<PincodeController>();
      var pincodeList = data.pincodeModel.value.data!.items;

      for (int i = 0; i < pincodeList!.length; i++) {
        if (pincodeList[i].pincodeId.toString() ==
            selectedPincodeId.toString()) {
          setState(() {
            selectedPincodeName =
                "${pincodeList[i].areaName} (${pincodeList[i].pincode.toString()})";
          });
        } else {}
      }

      setState(() {
        dataIsLoaded = false;
      });

      print('data ${value.data}');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Update Address',
        ),
      ),
      body: dataIsLoaded
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: AppColor.primaryColor2,
                size: 60,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
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
                                      '$selectedPN1 ($selectedPN2)';
                                });
                              },
                              items: pincodeMapList.map<DropdownMenuItem<Map<String, dynamic>>>(
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
