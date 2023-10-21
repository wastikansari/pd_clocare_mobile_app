import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/pincode-model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PincodeController extends GetxController {
  String url = AppConstants.BASE_URL;
  RxBool isLoading = false.obs;
  Rx<PincodeModel> pincodeModel = PincodeModel().obs;

  Future<void> getPincodeList(cityId) async {
    print('PINCODE ID $cityId');

    isLoading(true);
    var response = (await http.get(
      Uri.parse('$url${AppConstants.PINCODE_URL}/$cityId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': AppConstants.HEADER_TOKEN,
      },
    ));
    if (response.statusCode == 200) {
      final model = PincodeModel.fromJson(jsonDecode(response.body));
      pincodeModel.value = model;
      isLoading(false);
    } else {
      isLoading(false);
      throw Exception('Failed to load data');
    }
  }
}
