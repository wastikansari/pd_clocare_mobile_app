import 'dart:async';
import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/pickup_done_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/pickup_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/pickup_start_model.dart';
import 'package:new_clocare_delivery_boy/backend/models/quick_pickup_model.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PickupApi {
  String url = AppConstants.BASE_URL;
  final StreamController<dynamic> _streamController = StreamController<dynamic>();
  Stream<dynamic> get stream => _streamController.stream;

  Future<PickupModel> getOrderData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(
      Uri.parse(url + AppConstants.PICKUP_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, String>{
        'staff_token': token,
      }),
    );

    if (response.statusCode == 200) {
      var data = PickupModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<PickupStartModel> pickupStart(orderId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(
      Uri.parse('$url${AppConstants.PICKUP_START_URL}'),
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
      var data = PickupStartModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<PickupDoneModel> pickupDone(
      orderId,
      orderstageId,
      orderItems,
      Orders,
      bagInfo,
      totalPickedItems,
      totalItems,
      stageComments,
      modeOfPayment,
      finalAddedMoney,
      referral) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(
      Uri.parse('$url${AppConstants.PICKUP_DONE_URL}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        'staff_token': token,
        'order_id': orderId,
        'orderstage_id': orderstageId,
        'OrderItems': orderItems,
        'Orders': Orders,
        'bagInfo': bagInfo,
        'total_picked_items': totalPickedItems,
        'total_items': totalItems,
        'stage_comments': stageComments,
        'mode_of_payment': modeOfPayment,
        'FinalAddedMoney': finalAddedMoney,
        'referral': referral,
      }),
    );
    if (response.statusCode == 200) {
      var data = PickupDoneModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<QuickPickupModel> quickPickup(
      orderId,
      orderstageId,
      orderItems,
      Orders,
      bagInfo,
      totalPickedItems,
      totalItems,
      stageComments,
      modeOfPayment,
      clothPics) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN)!;

    final response = await http.post(
      Uri.parse('$url${AppConstants.QUICK_PICKUP_URL}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': 'Bearer 466fdac7291ffb284856e6a25a15cbad',
      },
      body: jsonEncode(<String, dynamic>{
        'staff_token': token,
        'order_id': orderId,
        'orderstage_id': orderstageId,
        'OrderItems': orderItems,
        'Orders': Orders,
        'bagInfo': bagInfo,
        'total_picked_items': totalPickedItems,
        'total_items': totalItems,
        'stage_comments': stageComments,
        'mode_of_payment': modeOfPayment,
        'clothPics': clothPics,
      }),
    );
    if (response.statusCode == 200) {
      var data = QuickPickupModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
