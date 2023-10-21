import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/delivery_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/pickup_api.dart';
import 'package:new_clocare_delivery_boy/backend/models/delivery_order_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/pickup_model.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/new_pickup_requests_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/pending_deliveries_screeen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/pending_pickup_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pickedup_orders_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/services/services_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkScreen extends StatelessWidget {
  WorkScreen({super.key});
  DeliveryApi deliveryApi = DeliveryApi();
  PickupApi pickupApi = PickupApi();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'My Work',
          style: TextStyle(fontSize: 22),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServicesBox(
                  imageUrl: 'asset/image/pickup_requests.png',
                  name: 'New Pickup Requests',
                  onPressed: () {
                    Get.to(const NewPickupRequestsScreen());
                  },
                ),
                ServicesBox(
                  imageUrl: 'asset/image/rd.png',
                  name: 'Picked up Orders',
                  onPressed: () {
                   Get.to(const PickedupOrderScreen());
                  },
                ),
              ],
            ),
            const Height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(PendingPickupScreen());
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
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 15),
                            child: Column(
                              children: [
                                Image.asset(
                                  'asset/image/delivery.png',
                                  height: 70,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Pending Pickups',
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
                              child: FutureBuilder<PickupModel>(
                                  future: pickupApi.getOrderData(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      var itemsData = snapshot
                                          .data!.data!.mMeta!.totalCount
                                          .toString();

                                      return SmallText(
                                        text: itemsData,
                                        fontweights: FontWeight.bold,
                                        size: 16,
                                        color: const Color.fromARGB(
                                            255, 192, 13, 0),
                                      );
                                    } else {
                                      return LoadingAnimationWidget
                                          .fourRotatingDots(
                                        color: AppColor.primaryColor2,
                                        size: 10,
                                      );
                                    }
                                  }),
                            )),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(PendingDeliveriesScreen());
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
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 15),
                            child: Column(
                              children: [
                                Image.asset(
                                  'asset/image/pd.png',
                                  height: 70,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Pending Deliveries',
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
                                  blurRadius: 0.5,
                                ),
                              ],
                              color: const Color.fromARGB(255, 228, 241, 252),
                            ),
                            child: Center(
                              child: FutureBuilder<DeliverOrderModel>(
                                  future: deliveryApi.pendingDeliverOrderList(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      var totalItems = snapshot
                                          .data!.data!.length
                                          .toString();

                                      return SmallText(
                                        text: totalItems,
                                        fontweights: FontWeight.bold,
                                        size: 16,
                                        color: const Color.fromARGB(
                                            255, 192, 13, 0),
                                      );
                                    } else {
                                      return LoadingAnimationWidget
                                          .fourRotatingDots(
                                        color: AppColor.primaryColor2,
                                        size: 10,
                                      );
                                    }
                                  }),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
