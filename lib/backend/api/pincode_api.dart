import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/pincode-model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PincodeApi {
  String url = AppConstants.BASE_URL;

  Future<PincodeModel> getPincode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    print('token wastikkkkkk $token');

    final response = await http.post(
      Uri.parse(url+AppConstants.PINCODE_URL+'/10'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'staff_token': token,
      }),
    );
    print('re ${response.body}');
    if (response.statusCode == 200) {
      print('st 1');
      return PincodeModel.fromJson(jsonDecode(response.body));
    } else {
      print('st 2');
      return PincodeModel.fromJson(jsonDecode(response.body));
    }
  }
}
