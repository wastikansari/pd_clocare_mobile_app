import 'package:flutter/material.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class CustomBox extends StatelessWidget {
  final String orderId;
  final String name;
  final String mobileNo;
  final String services;
  final String servicesType;
  final String totalGarment;
  final String address;
  final String time;
  final String attempted;
  final Function starTOnPressed;
  final Function callButton;
  final Function detailsOnPressed;
  const CustomBox({
    super.key,
    required this.orderId,
    required this.name,
    required this.mobileNo,
    required this.services,
    required this.servicesType,
    required this.address,
    required this.time,
    required this.starTOnPressed,
    required this.detailsOnPressed,
    required this.totalGarment,
    required this.attempted,
    required this.callButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          border: Border.all(color: const Color.fromARGB(255, 221, 221, 221)),
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BigText(
                    text: 'Order id : ',
                    fontweights: FontWeight.bold,
                  ),
                  BigText(
                    text: orderId,
                    fontweights: FontWeight.bold,
                    color: AppColor.primaryColor1,
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: name,
                        size: 15,
                        fontweights: FontWeight.w500,
                      ),
                      const Height(5),
                      BigText(
                        text: mobileNo,
                        size: 14,
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        callButton();
                      },
                      icon: Icon(
                        Icons.call,
                        color: AppColor.primaryColor1,
                      ))
                ],
              ),
              const Divider(),
              Row(
                children: [
                  BigText(
                    text: 'Services : ',
                    size: 14,
                    fontweights: FontWeight.w500,
                  ),
                  BigText(
                    text: services,
                    size: 14,
                  ),
                ],
              ),
              const Height(5),
              Row(
                children: [
                  BigText(
                    text: 'Types : ',
                    size: 14,
                    fontweights: FontWeight.w500,
                  ),
                  BigText(
                    text: servicesType,
                    size: 14,
                  ),
                ],
              ),
              const Height(5),
              Row(
                children: [
                  BigText(
                    text: 'Order Garments : ',
                    size: 14,
                    fontweights: FontWeight.w500,
                  ),
                  BigText(
                    text: totalGarment,
                    size: 14,
                  ),
                ],
              ),
              const Height(5),
              const Divider(),
              SizedBox(
                  height: 50,
                  child: Text(
                    address,
                    maxLines: 3,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  )),
              const Height(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        size: 20,
                      ),
                      const Widths(8),
                      BigText(
                        text: time,
                        size: 14,
                      ),
                    ],
                  ),
                  SmallText(
                    text: attempted,
                    color: Colors.red,
                  )
                ],
              ),
              const Height(10),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        starTOnPressed();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(229, 51, 106, 188),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Center(
                          child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SmallText(
                                text: 'Start',
                                color: Colors.white,
                                fontweights: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        detailsOnPressed();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(203, 70, 178, 236),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Center(
                          child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SmallText(
                                text: 'Details',
                                color: Colors.white,
                                fontweights: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
