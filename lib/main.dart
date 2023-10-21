import 'package:intl/intl.dart';
import 'package:new_clocare_delivery_boy/backend/controller/garment_controller.dart';
import 'package:new_clocare_delivery_boy/backend/controller/order_detail_controller.dart';
import 'package:new_clocare_delivery_boy/backend/controller/pincode_controller.dart';
import 'package:new_clocare_delivery_boy/backend/controller/profile_controller.dart';
import 'package:new_clocare_delivery_boy/backend/controller/service_type_controller.dart';
import 'package:new_clocare_delivery_boy/backend/controller/staff_earing_data_controller.dart';
import 'package:new_clocare_delivery_boy/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:table_calendar/table_calendar.dart';

void main() async {
  Get.lazyPut(() => PincodeController());
  Get.lazyPut(() => ProfileController());
  Get.lazyPut(() => OrderDetailController());
  Get.lazyPut(() => GarmentController());
  Get.lazyPut(() => ServiceController());
  Get.lazyPut(() => DataController(), fenix: true);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.find<ProfileController>().getProfileData();
    Get.find<GarmentController>().getGarmentList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.white),
          color: AppColor.primaryColor1,
        ),
      ),
      getPages: RouteHelper.routes,
    );
  }
}
