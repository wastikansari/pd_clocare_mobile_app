class VendorModel {
  bool? success;
  Data? data;

  VendorModel({this.success, this.data});

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }
}

// class VendorModel {
//   bool? _success;
//   late List<Data> _data;
//   List<Data> get data => _data;

//   VendorModel({required success, required data}) {
//     this._success = success;
//     this._data = data;
//   }

//   VendorModel.fromJson(Map<String, dynamic> json) {
//     _success = json['success'];
//     if (json['data'] != null) {
//       _data = <Data>[];
//       json['data'].forEach((v) {
//         _data.add(Data.fromJson(v));
//       });
//     }
//   }
// }

// class Data {
//   String? status;
//    List<Map<String, String>>? list;

//   Data({this.status, this.list});

//   factory Data.fromJson(Map<String, dynamic> json) {
//     var personList = json['list'] as List;
//     List<Map<String, String>> persons = personList.cast<Map<String, String>>();

//     return Data(
//       status: json['status'],
//       list: persons,
//     );
//   }
// }

class Data {
  String? status;
  List<Person>? list;

  Data({this.status, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['list'] != null) {
      list = <Person>[];
      json['list'].forEach((v) {
        list!.add(Person.fromJson(v));
      });
    }
  }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.list != null) {
//       data['list'] = list!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
}

class Person {
  String? id;
  String? personName;

  Person({this.id, this.personName});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personName = json['person_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['person_name'] = personName;
    return data;
  }
}
