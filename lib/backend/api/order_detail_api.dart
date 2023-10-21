import 'dart:async';
import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/delivery_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/order_detail_model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailApi {
  String url = AppConstants.BASE_URL;
  final StreamController<dynamic> _streamController =
      StreamController<dynamic>();
  Stream<dynamic> get stream => _streamController.stream;

  Future<OrderModel> getOrderDetail(orderId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(
      Uri.parse(url + AppConstants.ORDER_DETAIL_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(
          <String, String>{'staff_token': token, 'order_id': orderId}),
    );
    if (response.statusCode == 200) {
      var data = OrderModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load user');
    }
  }

  // void fetchDataFromAPI() async {
  //   try {
  //     var response = await http.post(Uri.parse(url + AppConstants.ORDER_DETAIL_URL),       body: jsonEncode(
  //         <String, String>{'staff_token': token, 'order_id': orderId}),
  //   );
  //     if (response.statusCode == 200) {
  //       var data = response.body; // Parse the data as needed
  //       _streamController.add(data); // Add the data to the stream
  //     } else {
  //       throw Exception('Failed to fetch data');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to fetch data: $e');
  //   }
  // }
}
