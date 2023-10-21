import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/order_detail_model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailController extends GetxController {
  String url = AppConstants.BASE_URL;
  RxBool isLoading = false.obs;
  Rx<OrderModel> orderModel = OrderModel().obs;

  Future<void> getOrderDetailList(orderId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';
    isLoading(true);
    var response = (await http.post(
      Uri.parse(url + AppConstants.ORDER_DETAIL_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': AppConstants.HEADER_TOKEN,
      },
      body: jsonEncode(
          <String, String>{'staff_token': token, 'order_id': orderId}),
    ));
    print('wwwwwwwwwwwwwwwwwww ${response.body}');
    if (response.statusCode == 200) {
      final model = OrderModel.fromJson(jsonDecode(response.body));
      orderModel.value = model;
      isLoading(false);
    } else {
      isLoading(false);
      throw Exception('Failed to load data');
    }
  }
}
