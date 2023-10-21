import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AddressWidget extends StatelessWidget {
  final String address;
  final Function onPressed;
  const AddressWidget(
      {super.key, required this.address, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? ColorConstants.gray600
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 17,
                    color: Colors.blue,
                  ),
                  const Text(
                    'Address : ',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    address,
                    style: const TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 22,
                    color: Colors.black45,
                  ),
                ],
              ),
            )

            // TextField(
            //   decoration: InputDecoration(
            //       contentPadding: const EdgeInsets.symmetric(
            //           vertical: 0, horizontal: 20),
            //       hintText: "Search E.g Ironing X",
            //       suffixIcon: Padding(
            //         padding: const EdgeInsets.all(5.0),
            //         child: Container(
            //           width: 40,
            //           decoration: BoxDecoration(
            //               color: Get.isDarkMode
            //                   ? ColorConstants.gray900
            //                   : Colors.grey.shade300,
            //               borderRadius: BorderRadius.circular(10)),
            //           child: Center(
            //             child: Icon(
            //               IconlyLight.filter,
            //               color: Colors.grey,
            //             ),
            //           ),
            //         ),
            //       )),
            // ),
            ),
      ),
    );
  }
}
