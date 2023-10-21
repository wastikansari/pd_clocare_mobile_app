// class PincodeModel {
//   bool? success;
//   Data? data;

//   PincodeModel({this.success, this.data});

//   PincodeModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? status;
//   List<Lists>? list;

//   Data({this.status, this.list});

//   Data.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['list'] != null) {
//       list = <Lists>[];
//       json['list'].forEach((v) {
//         list!.add(new Lists.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.list != null) {
//       data['list'] = this.list!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Lists {
//   String? areaPincode;
//   String? pincodeId;
//   String? pincode;
//   String? areaName;

//   Lists({this.areaPincode, this.pincodeId, this.pincode, this.areaName});

//   Lists.fromJson(Map<String, dynamic> json) {
//     areaPincode = json['area_pincode'];
//     pincodeId = json['pincode_id'];
//     pincode = json['pincode'];
//     areaName = json['area_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['area_pincode'] = this.areaPincode;
//     data['pincode_id'] = this.pincodeId;
//     data['pincode'] = this.pincode;
//     data['area_name'] = this.areaName;
//     return data;
//   }
// }

class PincodeModel {
  bool? success;
  Data? data;

  PincodeModel({this.success, this.data});

  PincodeModel.fromJson(Map<String, dynamic> json) {
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
  List<Items>? items;

  Data({
    this.items,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Items {
  int? pincodeId;
  int? stateId;
  int? cityId;
  String? pincode;
  String? areaName;

  Items({
    this.pincodeId,
    this.stateId,
    this.cityId,
    this.pincode,
    this.areaName,
  });

  Items.fromJson(Map<String, dynamic> json) {
    pincodeId = json['pincode_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    pincode = json['pincode'];
    areaName = json['area_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pincode_id'] = this.pincodeId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['pincode'] = this.pincode;
    data['area_name'] = this.areaName;

    return data;
  }
}
