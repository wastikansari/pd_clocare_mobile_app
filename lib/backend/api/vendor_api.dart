import 'dart:convert';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/vendor_model.dart';

// class VendorApi extends GetxController {
//   String url = AppConstants.BASE_URL;
//   final List<dynamic> _allVendorList = [].obs;

//   Future<void> getVendorList() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';

//     var response = await http.post(
//       Uri.parse(url + AppConstants.VENDOR_URL),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'at': AppConstants.HEADER_TOKEN,
//       },
//       body: jsonEncode(<String, String>{
//         'staff_token': token,
//       }),
//     );

//     if (response.statusCode == 200) {
//       print('Data retrieved successfully was');
//       var d = jsonDecode(response.body);
//       print('de ${d['data']['list']}');

//       _allVendorList.add(VendorModel.fromJson(jsonDecode(d['data']['list'])));
//       print('was ${_allVendorList[0].success}');
//       // return response;
//       // VendorModel.fromJson(jsonDecode(response.body));
//     } else {
//       print('Failed to retrieve data: ${response.statusCode}');
//       throw Exception('Failed to load user');
//     }
//   }

  //  var client = http.Client();

  // Future<Response?> fetchProducts() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';
  //   var response = await client.post(
  //     Uri.parse(url + AppConstants.VENDOR_URL),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'at': AppConstants.HEADER_TOKEN,
  //     },
  //     body: jsonEncode(<String, String>{
  //       'staff_token': token,
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     return response;
  //   } else {
  //     //show error message
  //     return null;
  //   }
  // }
// }
