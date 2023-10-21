import 'dart:async';
import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/deliver_attempted_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/reason_attemp_model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReasonApi {
  String url = AppConstants.BASE_URL;
  final StreamController<dynamic> _streamController =
      StreamController<dynamic>();
  Stream<dynamic> get stream => _streamController.stream;

  Future<AttempReason> getdeliveryAttemptsReasonslist(orderId) async {
    print('data 1');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(
      Uri.parse('$url${AppConstants.ORDER_ATTEMPT_REASONS_URL}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'staff_token': token,
        'order_id': orderId,
      }),
    );
    print('data 2');
    print(response.body);
    if (response.statusCode == 200) {
      var data = AttempReason.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<DeliverAttempted> deliveryAttempts(orderId, reasonCode, reason) async {
    print('data 1');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(
      Uri.parse('$url${AppConstants.ORDER_DELIVERY_ATTEMPT_URL}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'staff_token': token,
        'order_id': orderId,
        'reason_code': reasonCode,
        'reason': reason,
      }),
    );
    print('data 2');
    print(response.body);
    if (response.statusCode == 200) {
      var data = DeliverAttempted.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load user');
    }
  }


    Future<DeliverAttempted> pickupAttempts(orderId, reasonCode, reason) async {
    print('data 1');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(
      Uri.parse('$url${AppConstants.ORDER_PICKUP_ATTEMPT_URL}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'staff_token': token,
        'order_id': orderId,
        'reason_code': reasonCode,
        'reason': reason,
      }),
    );
    print('data 2');
    print(response.body);
    if (response.statusCode == 200) {
      var data = DeliverAttempted.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
