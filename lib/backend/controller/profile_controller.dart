import 'dart:convert';
import 'package:new_clocare_delivery_boy/backend/models/staff_profile.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  String url = AppConstants.BASE_URL;
  var isLoading = true.obs;
  RxList<StaffProfileModel> staffProfileModel = <StaffProfileModel>[].obs;

  final Rx<StaffProfileModel> profile = StaffProfileModel(
    success: false,
    // data: Data(
    //   status: '',
    //   list: List(
    //     first: '',
    //     last: '',
    //     username: '',
    //     images:'',
    //   ),
    // )
  ).obs;

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }

  Future<void> getProfileData() async {
    print('wastik getProfileData method call');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';

    var response = (await http.post(
      Uri.parse(url + AppConstants.STAFF_PROFILE_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'at': AppConstants.HEADER_TOKEN,
      },
      body: jsonEncode(<String, String>{
        'staff_token': token,
      }),
    ));

    print('wastik getProfileData method call data ${response.body}');

    if (response.statusCode == 200) {
      // final model = StaffProfileModel.fromJson(jsonDecode(response.body));
      // staffProfileModel.value = model;

      final Map<String, dynamic> responseData = json.decode(response.body);
      final StaffProfileModel staffProfileModel = StaffProfileModel.fromJson(responseData);
      profile.value = staffProfileModel;
    } else {
      throw Exception('Failed to load user');
    }
  }

  void clearUsers() {
    print('data clean all');
    staffProfileModel.clear();
    // profile.clear();
  }
}
