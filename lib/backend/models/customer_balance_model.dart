class CustomerBalanceModel {
  bool? success;
  Data? data;

  CustomerBalanceModel({this.success, this.data});

  CustomerBalanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? status;
  String? balance;

  Data({this.status, this.balance});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    balance = json['balance'].toString();
  }
}
