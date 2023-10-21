import 'dart:async';
import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/delivery_done_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/delivery_order_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/delivery_start_model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryApi {
  String url = AppConstants.BASE_URL;
  final StreamController<dynamic> _streamController = StreamController<dynamic>();
  Stream<dynamic> get stream => _streamController.stream;

  // Future<DeliveryModel> getDeliveryData(int page) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String token = sharedPreferences.getString(AppConstants.TOKEN)!;
  //   final response = await http.post(
  //     Uri.parse('$url${AppConstants.DELIVER_URL}?page=$page&per-page=5'),
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
  //     print('Data retrieved successfully');
  //     var data = DeliveryModel.fromJson(jsonDecode(response.body));
  //     print('data ${data.success}');
  //     return data;
  //   } else {
  //     print('Failed to retrieve data: ${response.statusCode}');
  //     throw Exception('Failed to load user');
  //   }
  // }

  Future<DeliverOrderModel> pendingDeliverOrderList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(Uri.parse('$url${AppConstants.NEW_DELIVERIE_ORDER_LIST_URL}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'staff_token': token,
      }),
    );
    if (response.statusCode == 200) {
      var data = DeliverOrderModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<DeliveryStart> deliveryStart(orderId,) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(
      Uri.parse('$url${AppConstants.DELIVERY_STARTED_URL}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'staff_token': token,
        'order_id': orderId,
      }),
    );
    if (response.statusCode == 200) {
      var data = DeliveryStart.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<DeliveryDoneModel> deliveryDone(orderId, orderItems, orderstageId,
      customerSign, stageComments, Orders, feedback) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(
      Uri.parse('$url${AppConstants.DELIVERY_DONE_URL}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        'staff_token': token,
        'order_id': orderId,
        'orderItems': orderItems,
        'orderstage_id': orderstageId,
        'customer_sign': customerSign,
        'stage_comments': stageComments,
        'Orders': Orders,
        'feedback': feedback,
      }),
    );
    if (response.statusCode == 200) {
      var data = DeliveryDoneModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
