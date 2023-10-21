import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/address_create_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/address_delete_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/check_number_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/customer_info_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/otp_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/response_model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerApi {
  String url = AppConstants.BASE_URL;

  Future<CheckNumberModel> customerNumberCheck(String number) async {
    final response = await http.post(
      Uri.parse(url + AppConstants.CUSTOMER_MOBILE_NUMBER_CHECK_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'number': number,
      }),
    );
    print('Customer Number check ${response.body}');
    if (response.statusCode == 200) {
      return CheckNumberModel.fromJson(jsonDecode(response.body));
    } else {
      return CheckNumberModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<OtpModel> customerNumberVerificaion(number) async {
    final response = await http.post(
      Uri.parse(url + AppConstants.CUSTOMER_RESEND_OTP_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'mobile': number,
      }),
    );


    if (response.statusCode == 200) {

      return OtpModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<Status> createCustmer(
    name,
    fm,
    phone,
    email,
    flatNo,
    street,
    landmark,
    cityId,
    pincodeId,
    stateId,
    vendor,
    pickupType,
    locationId,
    corporateId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    final response = await http.post(
      Uri.parse(url + AppConstants.CREATE_NEW_CUSTOMER_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        "staff_token": token,
        "name": name,
        "fm": fm,
        "mobile": phone,
        "email": email,
        "flat_no": flatNo,
        "street": street,
        "landmark": landmark,
        "city_id": cityId,
        "pincode_id": pincodeId,
        "state_id": stateId,
        "vendor": vendor,
        "pickupType": pickupType,
        "location_id": locationId,
        "corporate_id": corporateId,
      }),
    );

    if (response.statusCode == 200) {

      return Status.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<CustomerInfoModel> custmerInfo(String userName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(
      Uri.parse(url + AppConstants.CUSTOMER_INFO_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        "staff_token": token,
        "username": userName,
      }),
    );
    print('customer info ${response.body}');
    if (response.statusCode == 200) {
      return CustomerInfoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<AddressCreateModel> custmerAddressUpdate(addresId,
    customerToken,
    flatNo,
    street,
    landMark,
    stateId,
    cityId,
    pincodeId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    final response = await http.post(
      Uri.parse('$url${AppConstants.CUSTOMER_ADDRESS_UPDATE_URL}/$addresId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        'customer_token': customerToken,
        'flat_no': flatNo,
        'street': street,
        'landmark': landMark,
        'state_id': stateId,
        'city_id': cityId,
        'pincode_id': pincodeId,
        'address_label': '',
        'address_lat': '',
        'address_lon': '',
      }),
    );

print('ddddddddddddddddd ${response.body}');
    if (response.statusCode == 200) {

      return AddressCreateModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<AddressCreateModel> custmerAddressCreate(
    customerToken,
    flatNo,
    street,
    landMark,
    stateId,
    cityId,
    pincodeId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    final response = await http.post(
      Uri.parse(url + AppConstants.CUSTOMER_ADDRESS_CREATE_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        'customer_token': customerToken,
        'flat_no': flatNo,
        'street': street,
        'landmark': landMark,
        'state_id': stateId,
        'city_id': cityId,
        'pincode_id': pincodeId,
        'address_label': '',
        'address_lat': '',
        'address_lon': '',
      }),
    );

print('ddddddddddddddddd ${response.body}');
    if (response.statusCode == 200) {

      return AddressCreateModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<AddressDeleteModel> custmerAddressDelete(
      int addressId, String customerToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    final response = await http.post(
      Uri.parse("$url${AppConstants.CUSTOMER_ADDRESS_DELETE_URL}/$addressId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        "customer_token": customerToken,
      }),
    );
    if (response.statusCode == 200) {
      
      return AddressDeleteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load User');
    }
  }
}
