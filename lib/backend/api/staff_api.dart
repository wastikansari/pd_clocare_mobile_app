import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/staff_earning_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/update_password_model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StaffApi {
  String url = AppConstants.BASE_URL;

  // Future<StaffProfileModel> getUser() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String token = sharedPreferences.getString(AppConstants.TOKEN)!;
  //   print('token wastikkkkkk $token');
  //   final response = await http.post(
  //     Uri.parse(url + AppConstants.STAFF_PROFILE_URL),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'staff_token': token,
  //     }),
  //   );
  //   print('re ${response.body}');
  //   if (response.statusCode == 200) {
  //     print('st data 1');
  //     return StaffProfileModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     print('st 2');
  //     return StaffProfileModel.fromJson(jsonDecode(response.body));
  //   }
  // }

  Future<UpdatePasswordModel> changePassword(password, newPassword) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    print('token wastikkkkkk $token');

    final response = await http.post(
      Uri.parse(url + AppConstants.STAFF_PASSWORD_UPDATE),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'staff_token': token,
        'password': password,
        'new_password': newPassword,
        'cpassword': newPassword,
      }),
    );
    print('data');
    print('re ${response.body}');
    if (response.statusCode == 200) {
      print('st data 1');
      return UpdatePasswordModel.fromJson(jsonDecode(response.body));
    } else {
      print('st 2');
      return UpdatePasswordModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<StaffEarningModel> staffPerOrderEarning(
      distance, timeTaken, earning, type) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    print('token wastikkkkkk $token $distance $timeTaken $earning $type');
    print('token wastikkkkkk ${url + AppConstants.STAFF_PER_ORDER_EARNING}');

    final response = await http.post(
      Uri.parse(url + AppConstants.STAFF_PER_ORDER_EARNING),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'staff_id': token,
        'distance': distance,
        'time_taken': timeTaken,
        'earning': earning,
        'type': type,
      }),
    );
    print('data');
    print('re ${response.body}');
    if (response.statusCode == 200) {
      print('st data 1');
      return StaffEarningModel.fromJson(jsonDecode(response.body));
    } else {
      print('st 2');
      return StaffEarningModel.fromJson(jsonDecode(response.body));
    }
  }
}
