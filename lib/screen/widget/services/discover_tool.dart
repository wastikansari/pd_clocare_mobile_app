import 'package:new_clocare_delivery_boy/screen/widget/share/tool_box.dart';
import 'package:flutter/material.dart';

class DiscoverTools extends StatelessWidget {
  const DiscoverTools({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 13,
        crossAxisSpacing: 13,
        childAspectRatio: (1 / 1.7),
        // mainAxisExtent: MediaQuery.of(context).size.height/4,
        //  childAspectRatio: MediaQuery.of(context).size.width /
        //       (MediaQuery.of(context).size.height / 1),
      ),
      padding: const EdgeInsets.only(left: 13, right: 13, bottom: 13),
      itemCount: 9,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              print('tap');
              // Get.toNamed('/product/${controller.discountedProducts[index].id}');
            },
            child: const ToolBox(
              imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPCIoBKaREUv6IJPXlCM39d_iy9BTqN8Zt5g&usqp=CAU',
              title: 'Chartgpt',
              decoration: 'A RenderFlex overflowed by 18 pixels on the bottom.',
              status: '',
            ));
      },
    );
  }
}
