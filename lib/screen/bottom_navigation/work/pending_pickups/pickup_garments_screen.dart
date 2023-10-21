import 'package:get/get.dart';
import 'package:new_clocare_delivery_boy/backend/controller/garment_controller.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/complete_pickup_order_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/recording_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class PickupGarmentsScreen extends StatefulWidget {
  final String orderId;
  final String serviceId;
  final String miniOrderValue;

  const PickupGarmentsScreen(
      {super.key,
      required this.orderId,
      required this.miniOrderValue,
      required this.serviceId});

  @override
  // ignore: library_private_types_in_public_api
  _PickupGarmentsScreenState createState() => _PickupGarmentsScreenState();
}

class _PickupGarmentsScreenState extends State<PickupGarmentsScreen> {
  GarmentController garmentController = Get.put(GarmentController());
  List<List<int>> quantities = [];
  double miniOrderValue = 0.0;
  double totalPrice = 0.0;
  int totalQuantities = 0;

  var addGarment = [];

  @override
  void initState() {
    super.initState();
    miniOrderValue = double.parse(widget.miniOrderValue.toString());
  }

  void updateTotalPrice(price) {
    double p = double.parse(price);
    setState(() {
      totalPrice += p;
      totalQuantities = totalQuantities + 1;
    });
    print('updateTotalPrice $totalPrice and $price and $totalQuantities');
  }

  void decrementTotalPrice(price) {
    double p = double.parse(price);
    setState(() {
      totalPrice -= p;
      totalQuantities = totalQuantities - 1;
    });
    print('updateTotalPrice $totalPrice and $price and $totalQuantities');
  }

  // addItems() {
  //   AddOrderItemModel addOrderItemModel = AddOrderItemModel(
  //       item_id: '12',
  //       gtype_id: 'fd',
  //       main_type: 'hfg',
  //       gsubtype_id: 'gfh',
  //       sub_type: 'gfh',
  //       base_price: 'gfh',
  //       qty: '234',
  //       rcvd_qty: '4',
  //       icon: '24');

  //   for (int i = 0; i < 10; i++) {
  //     addGarment.add(addOrderItemModel);
  //   }
  //   print(addGarment[0].qty);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      // backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar(
          elevation: 1,
          title: const Text('Add garments'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                resetQuantities();
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (garmentController.garmentModel.value.success == null) {
          return const CircularProgressIndicator();
        } else {
          var data = garmentController.garmentModel.value.data;
          var orderServiceId = int.parse(widget.serviceId.toString());
          int serviceId = 0;
          for (int i = 0; i < data!.length; i++) {
            if (data[i]!.id == orderServiceId) {
              serviceId = i;
            }
          }
          print('serviceidddddddddddddddddd $serviceId and order service id $orderServiceId');

          var allGarmentList = data[serviceId];
          for (int i = 0; i < allGarmentList.itemsList!.length; i++) {
            quantities.add(List<int>.filled(
                allGarmentList.itemsList![i].items!.length, 0));

            var itemsList = allGarmentList.itemsList![i].items;
            List<Map<String, dynamic>> datas = [];
            for (int j = 0; j < itemsList!.length; j++) {
              // var d = itemsList[i].price.toString();
              Map<String, dynamic> item = {
                "gtype_id": itemsList[j].subtypeId.toString(),
                "price_id": itemsList[j].priceId.toString(),
                "base_price": itemsList[j].price.toString(),
                "rcvd_qty": 0,
              };
              datas.add(item);
            }
            addGarment.add(datas);
          }
          print('total quantities $quantities and ${quantities.runtimeType}');
          print('final data $addGarment and ${addGarment.runtimeType}');
          print(' ${addGarment.runtimeType}');
          return DefaultTabController(
            length: allGarmentList.itemsList!.length,
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColor.primaryButtonColor),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: InkWell(
                      onTap: () {
                        Get.to( RecordeingScreen(orderId: widget.orderId,));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(text: 'Take garments using recording...'),
                          Image.asset(
                            'asset/image/voice.png',
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TabBar(
                  unselectedLabelColor: Colors.black45,
                  labelColor: AppColor.primaryColor1,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  isScrollable: true,
                  tabs: [
                    for (int i = 0; i < allGarmentList.itemsList!.length; i++)
                      Tab(text: allGarmentList.itemsList![i].name),
                  ],
                ),
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 240, 240, 240),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Center(
                      child: SmallText(
                        text:
                            'Minimum order amount should be : ₹$miniOrderValue',
                        color: totalPrice >= miniOrderValue
                            ? Colors.black
                            : Colors.red,
                        size: 14,
                        fontweights: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      for (int i = 0; i < allGarmentList.itemsList!.length; i++)
                        ListView.builder(
                          itemCount: allGarmentList.itemsList![i].items!.length,
                          itemBuilder: (context, index) {
                            String garmentName = allGarmentList
                                .itemsList![i].items![index].name
                                .toString();
                            String price = allGarmentList
                                .itemsList![i].items![index].price
                                .toString();
                            String image = allGarmentList
                                .itemsList![i].items![index].icon
                                .toString();
                            String url =
                                '${AppConstants.BASE_URL}/uploads/$image';
                            int indexOfItemsList = allGarmentList.itemsList!
                                .indexOf(allGarmentList.itemsList![i]);
                            int quantity = quantities[indexOfItemsList][index];

                            return Column(
                              children: [
                                Card(
                                  elevation: 0,
                                  color: quantity > 0
                                      ? Colors.grey[300]
                                      : AppColor.backgroundColor,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 10),
                                    leading: SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: Image.network(url),
                                    ),
                                    title: Text(
                                      garmentName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Height(5),
                                        SmallText(
                                          text: 'Per price:',
                                          size: 12,
                                        ),
                                        const Height(5),
                                        SmallText(
                                          text: '₹$price',
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
                                                quantity =quantities[indexOfItemsList][index]--;
                                                addGarment[indexOfItemsList][index]['rcvd_qty']--;
                                                decrementTotalPrice(price);
                                                print('decrementTotalPrice $price');
                                              });
                                            }
                                          },
                                        ),
                                        BigText(
                                          text: '$quantity',
                                          fontweights: FontWeight.w400,
                                        ),
                                        IconButton(
                                          icon: CircleAvatar(
                                            radius: 14,
                                            backgroundColor: Colors.grey[400],
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              quantity = quantity + 1;
                                              quantity =
                                                  quantities[indexOfItemsList]
                                                      [index]++;
                                              addGarment[indexOfItemsList]
                                                  [index]['rcvd_qty']++;
                                              updateTotalPrice(price);
                                              print('updateTotalPrice $price');
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider()
                              ],
                            );
                          },
                        )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
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
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
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
                  const SizedBox(
                    width: 25,
                  ),
                  BigText(
                    text: '\₹$totalPrice',
                    size: 18,
                    color: Colors.green[700],
                    fontweights: FontWeight.w500,
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor1,
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                onPressed: () {
                  orderContinue();
                },
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetQuantities() {
    setState(() {
      quantities = [];
      addGarment = [];
      totalPrice = 0;
      totalQuantities = 0;
    });
  }

  orderContinue() {
    if (totalPrice < miniOrderValue) {
      conformationDialogBox(miniOrderValue);
    } else {
      var items = addGarment.expand((innerList) => innerList).toList();
      print('data 1 $addGarment');
      print('data 2 $items');
      Get.to(CompletePickupOrderScreen(
        orderId: widget.orderId,
        totalPrice: totalPrice,
        garmentCollection: items,
        totalPickupItems: totalQuantities,
      ));
    }
  }

  conformationDialogBox(miniOrderValue) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Alert'),
        content: Text('Minimum order amount should be : ₹$miniOrderValue'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
