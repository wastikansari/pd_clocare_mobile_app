import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/service_type_model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TimeSlotApi {
  String url = AppConstants.BASE_URL;

  Future<ServiceTypeModel> getTimeSlotList(serviceId, customerId, ordertypeId, addressId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;
    final response = await http.post(
      Uri.parse(url + AppConstants.TIME_SLOT_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        'address_id': addressId,
        'daddress_id': addressId,
        'ordertype_id': ordertypeId,
        'customer_id': customerId,
        'service_id': serviceId,
      }),
    );
    if (response.statusCode == 200) {
      return ServiceTypeModel.fromJson(jsonDecode(response.body));
    } else {
      return ServiceTypeModel.fromJson(jsonDecode(response.body));
    }
  }
}
