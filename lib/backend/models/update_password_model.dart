class UpdatePasswordModel {
  bool? success;
  Data? data;

  UpdatePasswordModel({this.success, this.data});

  UpdatePasswordModel.fromJson(Map<String, dynamic> json) {
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
    status = json['status'].toString();
    msg = json['msg'].toString();
    list = json['list'];
  }
}
