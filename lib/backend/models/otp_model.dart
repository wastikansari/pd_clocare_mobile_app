class OtpModel {
  bool? success;
  Data? data;

  OtpModel({this.success, this.data});

  OtpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? status;
  String? msg;
  String? verificationCode;

  Data({this.status, this.msg, this.verificationCode});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    verificationCode = json['verification_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['verification_code'] = this.verificationCode;
    return data;
  }
}