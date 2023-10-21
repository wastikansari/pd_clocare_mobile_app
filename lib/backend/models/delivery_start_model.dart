class DeliveryStart {
  bool? success;
  Data? data;

  DeliveryStart({this.success, this.data});

  DeliveryStart.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? status;
  List<dynamic>? list;

  Data({this.status, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    list = json['list'];
  }
}
