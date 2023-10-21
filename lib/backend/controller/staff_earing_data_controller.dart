import 'package:get/get.dart';
import 'package:new_clocare_delivery_boy/backend/models/staff/staff_earning.dart';

class DataController extends GetxController {
  StaffEaringData? _data;

  StaffEaringData get data => _data!;

  void saveData(StaffEaringData newData) {
    _data = newData;
    update(); // Trigger a UI update when data changes
  }
}