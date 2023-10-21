
// import 'dart:convert';
// import 'package:new_clocare_delivery_boy/backend/models/customer_info_model.dart';
// import 'package:new_clocare_delivery_boy/backend/models/response_model.dart';
// import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class CustomerApi {
//   String url = AppConstants.BASE_URL;

//   Future<Status> createCustmer(
//     name,
//     fm,
//     phone,
//     email,
//     flatNo,
//     street,
//     landmark,
//     cityId,
//     pincodeId,
//     stateId,
//     vendor,
//     pickupType,
//     locationId,
//     corporateId,
//   ) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String token = sharedPreferences.getString(AppConstants.TOKEN)!;
//     print('token wastikkkkkk $token');
//     print(
//         'createCustmer   $name $fm $phone $email $flatNo $street $landmark $cityId $pincodeId $stateId $vendor $pickupType $locationId $corporateId,');
//     final response = await http.post(
//       Uri.parse(url + AppConstants.CREATE_NEW_CUSTOMER_URL),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
//       },
//       body: jsonEncode(<String, dynamic>{
//         "staff_token": token,
//         "name": name,
//         "fm": fm,
//         "mobile": phone,
//         "email": email,
//         "flat_no": flatNo,
//         "street": street,
//         "landmark": landmark,
//         "city_id": cityId,
//         "pincode_id": pincodeId,
//         "state_id": stateId,
//         "vendor": vendor,
//         "pickupType": pickupType,
//         "location_id": locationId,
//         "corporate_id": corporateId,
//       }),
//     );

//     if (response.statusCode == 200) {
//       print(response.body);
//       return Status.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load User');
//     }
//   }

//   Future<CustomerInfoModel> custmerInfo(String userName) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String token = sharedPreferences.getString(AppConstants.TOKEN)!;
//     print('token wastikkkkkk $token');

//     final response = await http.post(
//       Uri.parse(url + AppConstants.CUSTOMER_INFO_URL),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
//       },
//       body: jsonEncode(<String, dynamic>{
//         "staff_token": token,
//         "username": userName,
//       }),
//     );
//     print(response.body);

//     if (response.statusCode == 200) {
//       print(response.body);
//       return CustomerInfoModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load User');
//     }
//   }
// }
