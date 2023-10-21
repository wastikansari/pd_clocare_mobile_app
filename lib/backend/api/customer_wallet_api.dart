import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/collect_case_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/customer_balance_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/order_processing_payment_model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerWalletApi {
  String url = AppConstants.BASE_URL;

  Future<CustomerBalanceModel> getCustomerBalance(customerId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    final response = await http.post(
      Uri.parse(url + AppConstants.CUSTOMER_BALANCE_CHECK_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        'staff_token': token,
        'customer_id': customerId,
      }),
    );
    if (response.statusCode == 200) {
      return CustomerBalanceModel.fromJson(jsonDecode(response.body));
    } else {
      return CustomerBalanceModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<CollectCashModel> collectCash(customerId, amount) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    final response = await http.post(
      Uri.parse(url + AppConstants.COLLECT_CASH_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        'staff_token': token,
        'customer_id': customerId,
        'amount': amount
      }),
    );
    print('collect cash ${response.body}');
    if (response.statusCode == 200) {
      return CollectCashModel.fromJson(jsonDecode(response.body));
    } else {
      return CollectCashModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<OrderProcessingPaymentModel> orderProcessingPayment(
      orderId, modeOfPayment) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    final response = await http.post(
      Uri.parse(url + AppConstants.ORDER_PROCESSING_PAYMENT_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        'staff_token': token,
        'order_id': orderId,
        'mode_of_payment': modeOfPayment
      }),
    );
    print('orderPayment ${response.body}');
    if (response.statusCode == 200) {
      return OrderProcessingPaymentModel.fromJson(jsonDecode(response.body));
    } else {
      return OrderProcessingPaymentModel.fromJson(jsonDecode(response.body));
    }
  }
}
