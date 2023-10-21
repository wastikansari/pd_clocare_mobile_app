import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';

class ServicesBox extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Function onPressed;
  const ServicesBox(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 1.0,
                ),
              ],
              color: Colors
                  .white // Get.isDarkMode ? ColorConstants.gray600 : Colors.grey.shade200,
              ),

          // height: 120,
          // width: 120,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Image.asset(
                  imageUrl,
                  height: 70,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  name,
                  style: theme.textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )

          // GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          //   scrollDirection: Axis.vertical,
          //   itemCount: 5,
          //   itemBuilder: (context, index) {
          //     return AspectRatio(
          //       aspectRatio: 1,
          //       child: GestureDetector(
          //         onTap: () {
          //           // Get.toNamed('/product/${controller.discountedProducts[index].id}');
          //         },
          //         child: Container(
          //             clipBehavior: Clip.hardEdge,
          //             margin: const EdgeInsets.only(right: 16),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8),
          //               color: Get.isDarkMode
          //                   ? ColorConstants.gray700
          //                   : Colors.grey.shade200,
          //               border: Border.all(
          //                   color: Get.isDarkMode
          //                       ? Colors.transparent
          //                       : Colors.grey.shade200,
          //                   width: 1),
          //             ),
          //             child: const Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 // Container(
          //                 //   height: 100,
          //                 //   width: 100,
          //                 //   child: CachedNetworkImage(
          //                 //     imageUrl:
          //                 //         'https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg',
          //                 //     fit: BoxFit.cover,
          //                 //   ),
          //                 // ),
          //                 // Padding(
          //                 //   padding: EdgeInsets.all(10),
          //                 //   child: Column(
          //                 //     crossAxisAlignment: CrossAxisAlignment.start,
          //                 //     children: [
          //                 //       Text('Chart gpt',
          //                 //           style: theme.textTheme.subtitle1),
          //                 //     ],
          //                 //   ),
          //                 // )
          //               ],
          //             )),
          //       ),
          //     );
          //   },
          // ),
          ),
    );
  }
}

class ServicesBoxCustom extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Function onPressed;
  final String quandety;
  const ServicesBoxCustom(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.onPressed, required this.quandety});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Stack(
        children: [
          Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 1.0,
                    ),
                  ],
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  children: [
                    Image.asset(
                      imageUrl,
                      height: 70,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      softWrap: false,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    // const Divider(
                    //   thickness: 1,
                    //   // color: AppColor.primaryColor2,
                    // ),
                  ],
                ),
              )),
          Positioned(
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: .5,
                    ),
                  ],
                  color: const Color.fromARGB(255, 228, 241, 252),
                ),
                child: Center(
                  child: SmallText(
                    text: quandety,
                    fontweights: FontWeight.bold,
                    size: 16,
                    color: const Color.fromARGB(255, 192, 13, 0),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

// import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
// import 'package:flutter/material.dart';

// class ServicesBox extends StatelessWidget {
//   final String imageUrl;
//   final String name;
//   final Function onPressed;
//   const ServicesBox(
//       {super.key,
//       required this.imageUrl,
//       required this.name,
//       required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return GestureDetector(
//       onTap: () {
//         onPressed();
//       },
//       child: Stack(children: [
//         Container(
//             height: 150,
//             width: 150,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(6),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.black45,
//                     blurRadius: 1.0,
//                   ),
//                 ],
//                 color: Colors.white),
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 children: [
//                   Image.asset(
//                     imageUrl,
//                     height: 70,
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Text(
//                     name,
//                     style: theme.textTheme.subtitle1?.copyWith(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 13,
//                     ),
//                     softWrap: false,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             )),
//         Container(
//           height: 150,
//           width: 150,
//              decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(6),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Color.fromARGB(67, 0, 0, 0),
//                     blurRadius: 1.0,
//                   ),
//                 ],
//                     color: Color.fromARGB(131, 87, 178, 227),),

//           child: Center(child: BigText(text: '5',size: 35,  fontweights: FontWeight.bold, color: Color.fromARGB(255, 29, 49, 178),),),
//         )
//       ]),
//     );
//   }
// }
