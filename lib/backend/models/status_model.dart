class StatusModel {
  bool? success;
  Data? data;

  StatusModel({this.success, this.data});

  StatusModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? status;
  String? msg;
  Errors? errors;

  Data({this.status, this.msg, this.errors});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
}

class Errors {
  List<String>? mobile;

  Errors({this.mobile});

  Errors.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'].cast<String>();
  }
}
