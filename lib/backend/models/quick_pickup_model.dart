class QuickPickupModel {
  bool? success;
  Data? data;

  QuickPickupModel({this.success, this.data});

  QuickPickupModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? status;
  String? name;
  String? message;
  List<String>? list;

  Data({this.status, this.list, this.name, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'].toString();
    message = json['message'].toString();
    list = json['list'] ?? [];
  }
}
