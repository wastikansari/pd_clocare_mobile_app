// import 'dart:convert';
// import 'package:new_clocare_delivery_boy/backend/models/vendor_model.dart';
// import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;


// class VendorController extends GetxController {
//   String url = AppConstants.BASE_URL;
//   var isLoading = true.obs;
//   Rx<VendorModel> vendorModel = VendorModel().obs;

//   Future<void> getVendorList() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';

//     var response = (await http.post(
//       Uri.parse(url + AppConstants.VENDOR_URL),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'at': AppConstants.HEADER_TOKEN,
//       },
//       body: jsonEncode(<String, String>{
//         'staff_token': token,
//       }),
//     ));

//     if (response.statusCode == 200) {
//       final model = VendorModel.fromJson(jsonDecode(response.body));
//       vendorModel.value = model;
//     } else {
//       throw Exception('Failed to load user');
//     }
//   }
// }
