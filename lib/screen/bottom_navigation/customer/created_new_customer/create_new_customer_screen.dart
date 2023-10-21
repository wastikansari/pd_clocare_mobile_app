import 'package:new_clocare_delivery_boy/backend/api/customer_api.dart';
import 'package:new_clocare_delivery_boy/backend/controller/pincode_controller.dart';
import 'package:new_clocare_delivery_boy/backend/controller/vendor_controller.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/buttom_navigation.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/dropdown_button.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/text_field.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CreateNewCustomer extends StatefulWidget {
  final String mobileNumber;
  const CreateNewCustomer({super.key, required this.mobileNumber});

  @override
  State<CreateNewCustomer> createState() => _CreateNewCustomerState();
}

class _CreateNewCustomerState extends State<CreateNewCustomer> {
  CustomerApi customerApi = CustomerApi();

  TextEditingController nameController = TextEditingController();
  TextEditingController fmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController flatController = TextEditingController();
  TextEditingController societyController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();

  bool isLoaded = false;
  var _selectedPincode = '';
  var pickupType = '';
  var pincode_id = '12';
  var state_id = '';

  var location_id = '';
  var corporate_id = '';

  String selectedCityId = "7";
  String selectedCityName = "Vadodara";
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
  String selectedVendorId = "";
  String selectedVendorName = "";
  List<Map<String, String>> existVenor = [];
  String selectedPincodeId = "";
  String selectedPincodeName = "";

  PincodeController pincodeController = Get.put(PincodeController());

  void getData() {
    customerApi.custmerInfo(widget.mobileNumber).then((value) {
      var customerInfo = value.data!.customerInfo!;
      var addressInfo = value.data!.addressInfo!;
      setState(() {
        nameController.text = customerInfo.firstname.toString() +
            customerInfo.lastname.toString();
        // fmController.text = customerInfo.firstname.toString();
        flatController.text = addressInfo[0].flatNo.toString();
        societyController.text = addressInfo[0].street.toString();
        landmarkController.text = addressInfo[0].landmark.toString();
        selectedCityId = addressInfo[0].cityId.toString();
        var pincode = addressInfo[0].pincodeId.toString();
        selectedPincodeId = pincode;
        print('pincode get $selectedPincodeId and $pincode and $selectedCityId');

        // selectedCityName =
        cities.forEach((element) {
          if (element['city_id'] == selectedCityId) {
            selectedCityName = element['city_name']!;
            Get.find<PincodeController>().getPincodeList(selectedCityId);
          }
          ;
        });
      });
    });
  }

  _submit() {
    print('_submit');
    final String name = nameController.text;
    final String fm = fmController.text;
    final String phone = widget.mobileNumber;
    final String email = emailController.text;
    final String flat_no = flatController.text;
    final String street = societyController.text;
    final String landmark = landmarkController.text;
    var city_id = selectedCityId;
    var vendor = selectedVendorName;

    if (name.isEmpty) {
      showCustomSnackBar(title: 'Name', 'Please enter customer full name');
    } else if (fm.isEmpty) {
      showCustomSnackBar(title: 'Family member', 'Please enter family memeber');
    } else if (phone.isEmpty) {
      showCustomSnackBar(title: 'Number', 'Please enter customer mobile number');
    } else if (!GetUtils.isPhoneNumber(phone)) {
      showCustomSnackBar(title: 'Number', 'Please enter customer valid mobile number');
    } else if (flat_no.isEmpty) {
      showCustomSnackBar(title: 'Address', 'Please enter Flat/House number');
    } else if (street.isEmpty) {
      showCustomSnackBar(title: 'Society', 'Please enter Street/Cociety');
    } else if (landmark.isEmpty) {
      showCustomSnackBar(title: 'Landmark', 'Please enter Landmark/Area');
    } else if (selectedCityName.isEmpty) {
      showCustomSnackBar(title: 'City', 'Please selected city');
    } else if (selectedPincodeName.isEmpty) {
      showCustomSnackBar(title: 'Pincode', 'Please selected pincode');
    } else {
      setState(() {
        isLoaded = true;
      });
      CustomerApi createNewCustomerApi = CustomerApi();
      createNewCustomerApi
          .createCustmer(
              name,
              fm,
              phone,
              email,
              flat_no,
              street,
              landmark,
              city_id,
              pincode_id,
              state_id,
              vendor,
              pickupType,
              location_id,
              corporate_id)
          .then((value) {
        var val = value.data;
        print('val $val and ${val!.status} and ${val.list!}');
        if (val.status == 'ok') {
          showCustomSnackBar(title: 'Successfully', 'New customer account created successfully');
          Get.off(const BottomNavigation());
          setState(() {
            isLoaded = false;
          });
        } else if (value.data!.status == 'errors') {
          showCustomSnackBar(
              title: 'Error', 'This mobile number is already registered');
          setState(() {
            isLoaded = false;
          });
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Create New Customer'),
          elevation: 0,
        ),
        body: isLoaded
            ? Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: AppColor.primaryColor1,
                  size: 60,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: 'About Customer',
                            fontweights: FontWeight.bold,
                          ),
                          CustomTextFieldForm(
                            hintText: 'Name',
                            icon: Icons.person,
                            controller: nameController,
                          ),
                          CustomTextFieldForm(
                            keyboardType: TextInputType.number,
                            hintText: 'Family Memeber',
                            icon: Icons.people_alt_outlined,
                            controller: fmController,
                          ),
                          // CustomTextFieldForm(
                          //   hintText: 'Mobile no',
                          //   keyboardType: TextInputType.phone,
                          //   icon: Icons.phone,
                          //   controller: phoneController,
                          // ),
                          CustomTextFieldForm(
                            hintText: 'Email ID',
                            icon: Icons.email,
                            controller: emailController,
                          ),
                          const Height(15),
                          BigText(
                            text: 'Address Detail',
                            fontweights: FontWeight.bold,
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
                            hintText: selectedCityName.isEmpty
                                ? 'City'
                                : selectedCityName,
                            hintColor: selectedCityName.isEmpty
                                ? Colors.black38
                                : Colors.black,
                            icon: Icons.location_city,
                            onChanged: (newValue) {
                              print(selectedCityName);
                              setState(() {
                                selectedCityId = newValue.toString();
                                selectedCityName = cities.firstWhere((city) =>
                                    city['city_id'] ==
                                    newValue.toString())['city_name']!;
                              });
                              Get.find<PincodeController>()
                                  .getPincodeList(selectedCityId);
                              print(selectedCityName);
                              print(selectedCityId);
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
                              final model =
                                  pincodeController.pincodeModel.value;

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
                                    child:
                                        LoadingAnimationWidget.prograssiveDots(
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
                                      print(
                                          'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv $newValue');
                                      setState(() {
                                        String data = newValue.toString();
                                        var d = data.split(',');
                                        selectedPincodeId = d[0].split('{pincode_id: ')[1].toString();
                                        var selectedPN1 = d[1].split('area_pincodeName: ')[1].split('}')[0].toString();
                                        var selectedPN2 = d[2].split('area_pincode: ')[1].split('}')[0].toString();
                                        selectedPincodeName ='$selectedPN1+ ($selectedPN2)';
                                        print('was $newValue');
                                        print('was $selectedPincodeId');
                                        print('was ${selectedPincodeName}');
                                      });
                                    },
                                    items: pincodeMapList.map<
                                            DropdownMenuItem<
                                                Map<String, dynamic>>>(
                                        (Map<String, dynamic> map) {
                                      return DropdownMenuItem<
                                          Map<String, dynamic>>(
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
                        ],
                      ),
                      const Height(30),
                      ButtonWidget(
                          isLoding: isLoaded,
                          backgroundColor: AppColor.primaryColor1,
                          text: 'Save',
                          onPressed: () {
                            _submit();
                          }),
                      const Height(15),
                    ],
                  ),
                ),
              ));
  }
}
