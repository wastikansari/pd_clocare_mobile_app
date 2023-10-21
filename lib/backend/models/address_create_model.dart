class AddressCreateModel {
  bool? success;
  Data? data;

  AddressCreateModel({this.success, this.data});

  AddressCreateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
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
  int? addressId;

  Data({this.status, this.msg, this.addressId});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'].toString();
    msg = json['msg'];
    addressId = json['address_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['address_id'] = this.addressId;
    return data;
  }
}