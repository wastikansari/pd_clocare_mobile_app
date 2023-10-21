import 'package:new_clocare_delivery_boy/backend/api/customer_api.dart';
import 'package:new_clocare_delivery_boy/backend/models/customer_info_model.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/created_new_customer/add_address_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/created_new_customer/update_address_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/take_order/customer_info_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UpdateCustomerInfoScreen extends StatefulWidget {
  final String mobileNumber;
  const UpdateCustomerInfoScreen({super.key, required this.mobileNumber});

  @override
  State<UpdateCustomerInfoScreen> createState() =>
      _UpdateCustomerInfoScreenState();
}

class _UpdateCustomerInfoScreenState extends State<UpdateCustomerInfoScreen> {
  CustomerApi customerApi = CustomerApi();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  bool isLoaded = false;
  String name = '';
  String phoneNo = '';
  String emailId = '';
  String createOn = '';
  String customToken = '';

  void getCustomInfo() {
    setState(() {
      isLoaded = true;
    });

    customerApi.custmerInfo(widget.mobileNumber).then((value) {
      print('data to get ${value.success}');

      var getData = value.data;
      print('ddddddddd $getData and ${getData!.customerInfo}');

      setState(() {
        isLoaded = false;
        name =
            '${getData!.customerInfo!.firstname} ${getData.customerInfo!.lastname}';
        phoneNo = getData.customerInfo!.mobile.toString();
        emailId = getData.customerInfo!.email.toString();
        createOn = getData.customerInfo!.createdOn.toString();
        customToken = getData.loginInfo!.accessToken.toString();
      });
    });
  }

  void customerAddressDelete(addreesId, customerToken) {
    setState(() {
      isLoaded = true;
    });
    customerApi.custmerAddressDelete(addreesId, customerToken).then((value) {
      getCustomInfo();
      setState(() {
        isLoaded = false;
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
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          title: const Text('Update Customer Info'),
          elevation: 2,
        ),
        body: isLoaded
            ? Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: AppColor.primaryColor1,
                  size: 60,
                ),
              )
            : RefreshIndicator(
                // key: _refreshIndicatorKey,
                color: Colors.white,
                backgroundColor: AppColor.primaryColor1Greey,
                strokeWidth: 2.0,
                onRefresh: () async {
                  customerApi.custmerInfo(widget.mobileNumber);
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Height(15),
                            BigText(
                              text: 'About Customer',
                              fontweights: FontWeight.bold,
                            ),
                            const Height(7),
                            Container(
                              height: 130,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.primaryColor1,
                                    // width: 5.0,
                                    style: BorderStyle.solid),
                                color: const Color.fromARGB(255, 228, 241, 252),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
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
                            const Height(15),
                            BigText(
                              text: 'Address Detail',
                              fontweights: FontWeight.bold,
                            ),
                            const Height(15),
                            AddressButton(
                              title: 'Add new address',
                              onPressed: () {
                                Get.to(CreateAddressScreen(
                                  customorToken: customToken,
                                ));
                              },
                            ),
                            const Height(15),
                            // AddressButton(
                            //   title: '',
                            //   onPressed: () {},
                            // ),
                            const Height(25),
                            FutureBuilder<CustomerInfoModel>(
                              future:
                                  customerApi.custmerInfo(widget.mobileNumber),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var getData = snapshot.data!.data!;

                                  return RefreshIndicator(
                                    color: AppColor.primaryColor1,
                                    backgroundColor: Colors.white,
                                    onRefresh: () async {
                                      await customerApi
                                          .custmerInfo(widget.mobileNumber);
                                    },
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: getData.addressInfo!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var data =
                                              getData.addressInfo![index];
                                          int addreesId = getData
                                              .addressInfo![index].addressId!;
                                          String customerToken =
                                              getData.loginInfo!.accessToken!;

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //     blurRadius: 4.0,
                                                //     color: const Color.fromARGB(255, 235, 235, 235),
                                                //     spreadRadius: 01.0,
                                                //   ),
                                                // ],
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 235, 235, 235),
                                                    style: BorderStyle.solid),
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Column(
                                                  children: [
                                                    SmallText(
                                                      overFlow:
                                                          TextOverflow.visible,
                                                      text: data
                                                          .formattedAddress
                                                          .toString(),
                                                      color: Colors.black,
                                                      fontweights:
                                                          FontWeight.w500,
                                                      size: 15,
                                                    ),
                                                    const Height(20),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            print('Edit');

                                                            Get.to(
                                                                UpdateAddressScreen(
                                                              mobleNumber: widget
                                                                  .mobileNumber,
                                                              index: index,
                                                            ));
                                                          },
                                                          child: Container(
                                                            width: 60,
                                                            height: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: const Color
                                                                          .fromARGB(
                                                                      190,
                                                                      230,
                                                                      230,
                                                                      230),
                                                                  style:
                                                                      BorderStyle
                                                                          .solid),
                                                              // color: const Color.fromARGB(145,228,241,252),
                                                              color: AppColor
                                                                  .backgroundColor,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    8),
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: SmallText(
                                                                text: 'Edit',
                                                                color: AppColor
                                                                    .primaryColor1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 15,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            print('DELETE');
                                                            showDialog<String>(
                                                              context: context,
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  AlertDialog(
                                                                title: const Text(
                                                                    'Delete'),
                                                                content: const Text(
                                                                    'Are you sure want to delete this address'),
                                                                actions: <Widget>[
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context,
                                                                            'Cancel'),
                                                                    child: const Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      customerAddressDelete(
                                                                          addreesId,
                                                                          customerToken);
                                                                      Navigator.pop(
                                                                          context,
                                                                          'OK');
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                            'OK'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 60,
                                                            height: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          190,
                                                                          230,
                                                                          230,
                                                                          230),
                                                                  style:
                                                                      BorderStyle
                                                                          .solid),
                                                              // color: const Color
                                                              //         .fromARGB(
                                                              //     145,
                                                              //     228,
                                                              //     241,
                                                              //     252),
                                                              color: AppColor
                                                                  .backgroundColor,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    8),
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: SmallText(
                                                                text: 'Delete',
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    209,
                                                                    20,
                                                                    6),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  );
                                } else {
                                  return Center(
                                      child: LoadingAnimationWidget
                                          .fourRotatingDots(
                                    color: AppColor.primaryColor2,
                                    size: 60,
                                  ));
                                }
                              },
                            ),
                          ],
                        ),
                        // ButtonWidget(
                        //     isLoding: isLoaded,
                        //     backgroundColor: AppColor.primaryColor1,
                        //     text: 'Take Order',
                        //     onPressed: () {

                        //     }),
                      ],
                    ),
                  ),
                ),
              ));
  }
}

class AddressButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  const AddressButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, style: BorderStyle.solid),
          // color: const Color.fromARGB(255, 83, 160, 254),
          color: AppColor.primaryColor1,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Center(
            child: SmallText(
          text: title,
          color: Colors.white,
          fontweights: FontWeight.w400,
          size: 16,
        )),
      ),
    );
  }
}
