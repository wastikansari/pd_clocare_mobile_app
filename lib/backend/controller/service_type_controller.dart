import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/service_type_model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ServiceController extends GetxController {
  String url = AppConstants.BASE_URL;
  RxBool isLoading = false.obs;
  Rx<ServiceTypeModel> serviceTypeModel = ServiceTypeModel().obs;

  Future<void> getServiceTypeList(serviceId, customerId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    isLoading(true);
    var response = (await http.post(
      Uri.parse('$url${AppConstants.SERVICE_TYPE_URL}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': AppConstants.HEADER_TOKEN,
      },
      body: jsonEncode(<String, dynamic>{
        'staff_token': token,
        'service_id': serviceId,
        'customer_id': customerId,
      }),
    ));
    if (response.statusCode == 200) {
      final model = ServiceTypeModel.fromJson(jsonDecode(response.body));
      serviceTypeModel.value = model;
      isLoading(false);
    } else {
      isLoading(false);
      throw Exception('Failed to load data');
    }
  }
}
