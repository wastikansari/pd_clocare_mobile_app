import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/check_number_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/otp_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/status.dart';
import 'package:new_clocare_delivery_boy/backend/models/status_model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:http/http.dart' as http;

class AuthendicationApi {
  String url = AppConstants.BASE_URL;

  Future<StatusModel> registerUser(
      firstName, lastName, email, phoneNumber, password) async {
    print('registerUser');
    final response = await http.post(
      Uri.parse(url + AppConstants.REGISTRATION_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone_number': phoneNumber,
        'password': password
      }),
    );

    print("rrrrrrrrrrrrrrr p1 ${response.body}");
    if (response.statusCode == 200) {
      print("rrrrrrrrrrrrrrr  p2 ${response.body}");
      return StatusModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<StatusData> loginUser(String userName, String password) async {
    print('re $userName and $password');
    final response = await http.post(
      Uri.parse(url + AppConstants.LOGIN_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(
          <String, String>{'username': userName, 'password': password}),
    );
    print('re wastikkkkkkkkkkkkk ${response.body}');

    if (response.statusCode == 200) {
      print('st 1');
      return StatusData.fromJson(jsonDecode(response.body));
    } else {
      print('st 2');
      return StatusData.fromJson(jsonDecode(response.body));
    }
  }

  Future<CheckNumberModel> numberCheck(
    String number,
  ) async {
    print('re $number');
    final response = await http.post(
      Uri.parse(url + AppConstants.NUMBER_CHECK_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'number': number,
      }),
    );
    print('re ${response.body}');
    if (response.statusCode == 200) {
      print('st 1');
      return CheckNumberModel.fromJson(jsonDecode(response.body));
    } else {
      print('st 2');
      return CheckNumberModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<OtpModel> numberVerificaion(number) async {
    print('numberVerificaion $number');
    final response = await http.post(
      Uri.parse(url + AppConstants.RESEND_OTP_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'username': number,
      }),
    );

    print("rrrrrrrrrrrrrrr p1 ${response.body}");
    if (response.statusCode == 200) {
      print("rrrrrrrrrrrrrrr  p2 ${response.body}");
      return OtpModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }
}
