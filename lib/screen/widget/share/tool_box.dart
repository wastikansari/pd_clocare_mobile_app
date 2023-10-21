import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ToolBox extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String decoration;
  final String status;
  const ToolBox(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.decoration,
      required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        // height: 300,
        clipBehavior: Clip.hardEdge,
        // margin: const EdgeInsets.only(right: 14, left: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Get.isDarkMode ? ColorConstants.gray700 : Colors.grey.shade200,
          border: Border.all(
              color: Get.isDarkMode ? Colors.transparent : Colors.grey.shade200,
              width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.subtitle1),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(decoration,
                      style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(190, 133, 133, 133))),
                  const SizedBox(
                    height: 5,
                  ),

                  Container(
                    // color: Colors.blue,
                    child: Row(
                      children: [
                        Icon(
                          IconlyLight.lock,
                          size: 18,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Free",
                          style: theme.textTheme.subtitle2?.copyWith(),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   children: [
                  //     ElevatedButton(onPressed: (){}, child: Text('Open')),
                  //       const SizedBox(
                  //   height: 5,
                  // ),
                  //      ElevatedButton(onPressed: (){}, child: Text('Open'))
                  //   ],
                  // )
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 35,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.blue,
                            style: BorderStyle.solid,
                            width: 0.8,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            IconlyLight.shield_done,
                            size: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    
                      IconButton(
                        onPressed: () {
                          print('tap');
                        },
                        icon: 
                        const Icon(Icons.bookmark_add_outlined,
                          // IconlyLight.bookmark,
                          size: 28,
                          color: Color.fromARGB(199, 80, 176, 254),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
