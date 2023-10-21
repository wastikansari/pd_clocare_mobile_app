import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class OldChooseGarmentsScreen extends StatefulWidget {
  @override
  _OldChooseGarmentsScreenState createState() => _OldChooseGarmentsScreenState();
}

class _OldChooseGarmentsScreenState extends State<OldChooseGarmentsScreen> {
  // List<List>

  List<List<String>> garments = [
    // Men's Wear garments
    [
      "Shirt",
      "T-shirt",
      "Trouser",
      "Suit(2 Pcs)",
      "Suit(3 Pcs)",
      "Jacket",
      "Kameez / Kurta",
      "Pajama",
      "Denims / Jeans",
      "Dhoti"
    ],
    // Women's Wear garments
    [
      "Top (Medium)",
      "Top (Long)",
      "Skirt (Medium)",
      "Skirt (Long)",
      "Saree (plain)",
      "Saree (zari)",
      "Salwar",
      "Dupatta",
      "Kurti",
      "Jeans",
      "Blouse",
      "Long Gown Kurti",
      "Chaniya (Normal)",
      "Chaniya (Heavy)"
    ],
    // Kidswear garments
    [
      "T-shirt",
      "Dungarees",
      "Frock",
      "Shorts",
      "Trousers / Jeans",
      "Baba suit",
      "Onesies",
      "Shirt"
    ],
    // Household garments
    [
      "Single Bedsheet",
      "Double Bedsheet",
      "Pillow cover",
      "Curtain - Small",
      "Curtain - Big",
      "Curtain - Extra large",
      "Sofa Cover - Single",
      "Sofa Cover - Double",
      "P&D Charges"
    ],
    // School Uniform garments
    [
      "School uniform - Shirt",
      "School uniform - Shorts",
      "School uniform full (Girls)",
      "School uniform - Trouser",
    ],
  ];

  List<List<int>> garmentPrices = [
    // Men's Wear garment prices
    [6, 6, 6, 40, 40, 50, 30, 6, 6, 8, 10],
    // Women's Wear garment prices
    [6, 8, 6, 8, 10, 20, 6, 6, 6, 8, 6, 15, 10, 18],
    // Kidswear garment prices
    [6, 6, 6, 6, 8, 6, 6, 6],
    // Household garment prices
    [12, 20, 6, 15, 30, 40, 20, 30, 30],
    // School Uniform garment prices
    [5, 5, 10, 5],
  ];

  List<List<int>> quantities = [];

  int totalPrice = 0;
  int totalQuantities = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < garments.length; i++) {
      quantities.add(List<int>.filled(garments[i].length, 0));
      print('total quantities $quantities');
    }
  }

  void updateTotalPrice(int price) {
    setState(() {
      totalPrice += price;
      totalQuantities = totalQuantities + 1;
    });
    print('updateTotalPrice $totalPrice and $price and $totalQuantities');
  }


  void decrementTotalPrice(int price) {
    setState(() {
      totalPrice -= price;
      totalQuantities = totalQuantities - 1;
    });
    print('updateTotalPrice $totalPrice and $price and $totalQuantities');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose garments'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              resetQuantities();
            },
          ),
        ],


      ),
      body: DefaultTabController(
        length: garments.length,
        child: Column(
          children: [
            TabBar(
              unselectedLabelColor: Colors.black45,
              labelColor: AppColor.primaryColor1,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              isScrollable: true,
              tabs: [
                for (int i = 0; i < garments.length; i++)
                  Tab(text: getTabName(i)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  for (int i = 0; i < garments.length; i++)
                    _buildGarmentsList(i),
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    badges.Badge(
                        badgeContent: Text(
                          '$totalQuantities',
                          style: const TextStyle(color: Colors.white),
                        ),
                        badgeStyle: const badges.BadgeStyle(
                          padding: EdgeInsets.all(7),
                          badgeColor: Colors.redAccent,
                        ),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 28,
                        )),
                    BigText(
                      text: '\₹$totalPrice.00',
                      size: 18,
                      color: Colors.green[700],
                      fontweights: FontWeight.w500,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor1,
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      onPressed: () {
                        // Continue button tapped
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Continue'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGarmentsList(int categoryIndex) {
    return ListView.builder(
      itemCount: garments[categoryIndex].length,
      itemBuilder: (context, index) {
        String garmentName = garments[categoryIndex][index];
        int price = garmentPrices[categoryIndex][index];
        int quantity = quantities[categoryIndex][index];

        return Card(
          color: quantity > 0 ? Colors.grey[300] : Colors.white,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            leading: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                // color: Colors.amber,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://www.freepnglogos.com/uploads/garments-png/sardar-garments-fast-shipping-trendy-apparel-39.png'), // Replace with your image URL
                ),
              ),
            ),
            title: Text(
              garmentName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            //  BigText(
            //   text: garmentName,
            //   fontweights: FontWeight.bold,
            //   size: 16,
            // ),
            //Text(garmentName),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Height(5),
                SmallText(text: 'Per price:'),
                Height(5),
                SmallText(
                  text: '\₹$price.00',
                  size: 16,
                  color: Colors.green[700],
                  fontweights: FontWeight.w500,
                )
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.grey[400],
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (quantity > 0) {
                      setState(() {
                        quantities[categoryIndex][index]--;
                        decrementTotalPrice(price);
                      });
                    }
                  },
                ),
                // const Widths(5),
                BigText(
                  text: '$quantity',
                  fontweights: FontWeight.w400,
                ),
                // const Widths(5),
                IconButton(
                  icon: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.grey[400],
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  // icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantities[categoryIndex][index]++;
                      updateTotalPrice(price);
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getTabName(int index) {
    switch (index) {
      case 0:
        return "Men's Wear";
      case 1:
        return "Women's Wear";
      case 2:
        return "Kidswear";
      case 3:
        return "Household";
      case 4:
        return "School Uniform";
      default:
        return "";
    }
  }

  void resetQuantities() {
    setState(() {
      quantities = [];
      totalPrice = 0;
      totalQuantities = 0;
      for (int i = 0; i < garments.length; i++) {
        quantities.add(List<int>.filled(garments[i].length, 0));
      }
    });
  }
}