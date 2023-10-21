import 'package:flutter/material.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class CustomerDataBox extends StatelessWidget {
  final String orderId;
  final String name;
  final String mobileNo;
  final String services;
  final String servicesType;
  final String status;

  const CustomerDataBox({
    super.key,
    required this.orderId,
    required this.name,
    required this.mobileNo,
    required this.services,
    required this.servicesType,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          // color: const Color.fromARGB(8, 23, 79, 162),
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
        // decoration: BoxDecoration(
        //   color: const Color.fromARGB(8, 23, 79, 162),
        //   border: Border.all(color: AppColor.primaryColorDark),
        //   borderRadius: BorderRadius.circular(6),
        // ),
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.call))
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
                    // fontweights: FontWeight.w500,
                  ),
                ],
              ),
              const Height(5),
              Row(
                children: [
                  BigText(
                    text: 'Services types : ',
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
                    text: 'Status : ',
                    size: 14,
                    fontweights: FontWeight.w500,
                  ),
                  BigText(
                    text: status,
                    size: 14,
                    color: AppColor.primaryColor2,
                    // fontweights: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
