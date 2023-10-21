class DeliveryDoneModel {
  bool? success;
  Data? data;

  DeliveryDoneModel({this.success, this.data});

  DeliveryDoneModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? status;
  String? msg;

  Data({this.status, this.msg});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
  }
}
