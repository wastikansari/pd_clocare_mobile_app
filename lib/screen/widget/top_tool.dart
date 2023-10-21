import 'package:new_clocare_delivery_boy/screen/widget/services/services_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:flutter/material.dart';

class TopTools extends StatelessWidget {
  const TopTools({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ServicesBox(
                imageUrl:
                    'https://clocare.in/wp-content/uploads/2022/12/ironing.png',
                name: 'Ironing',
                onPressed: () {},
              ),
              ServicesBox(
                imageUrl:
                    'https://clocare.in/wp-content/uploads/2022/12/steam-Ironing.png',
                name: 'Steam Ironing',
                onPressed: () {},
              ),
            ],
          ),
          Height(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ServicesBox(
                imageUrl:
                    'https://clocare.in/wp-content/uploads/2022/12/dry-cleaning.png',
                name: 'Dry Cleaning',
                onPressed: () {},
              ),
              ServicesBox(
                imageUrl:
                    'https://clocare.in/wp-content/uploads/2022/12/wash-fold.png',
                name: 'Wash & Fold',
                onPressed: () {},
              ),
            ],
          ),
          Height(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ServicesBox(
                imageUrl:
                    'https://clocare.in/wp-content/uploads/2022/12/premium-rental-services.png',
                name: 'Premium Rental Services',
                onPressed: () {},
              ),
              ServicesBox(
                imageUrl:
                    'https://clocare.in/wp-content/uploads/2022/12/tailoring.png',
                name: 'Tailoring',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
