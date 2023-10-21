// class Status {
//   bool? success;
//   Data? data;

//   Status({this.success, this.data});

//   Status.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['success'] = success;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? status;
//   Map<String, List<String>>? list;

//   Data({this.status, this.list});

//   Data.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['list'] != null) {
//       list = Map<String, List<String>>();
//       json['list'].forEach((key, value) {
//         if (value is List<dynamic>) {
//           list![key] = List<String>.from(value.map((item) => item.toString()));
//         }
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (list != null) {
//       data['list'] = list!.map((key, value) => MapEntry(key, value));
//     }
//     return data;
//   }
// }




class Status {
  bool? success;
  Data? data;

  Status({this.success, this.data});

  Status.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? status;
  List<Vendor>? list;
  List<dynamic>? mappingSuccess;
  List<dynamic>? mappingErrors;

  Data({this.status, this.list, this.mappingSuccess, this.mappingErrors});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['list'] != null) {
      if (json['list'] is List) {
        list = List<Vendor>.from(json['list'].map((item) => Vendor.fromJson(item)));
      } else {
        list = [];
      }
    }
    mappingSuccess = json['mappingSuccess'] != null ? List<dynamic>.from(json['mappingSuccess']) : [];
    mappingErrors = json['mappingErrors'] != null ? List<dynamic>.from(json['mappingErrors']) : [];
  }
}


class Vendor {
  String? id;
  String? personName;

  Vendor({this.id, this.personName});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personName = json['person_name'];
  }
}



