class CollectCashModel {
  bool? success;
  Data? data;

  CollectCashModel({this.success, this.data});

  CollectCashModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? status;
  String? msg;
  List<dynamic>? list;

  Data({this.status, this.msg, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    list = json['list'];
  }
}
