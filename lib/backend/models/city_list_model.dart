class CityListModel {
  bool? success;
  Data? data;

  CityListModel({this.success, this.data});

  factory CityListModel.fromJson(Map<String, dynamic> json) {
    return CityListModel(
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  String? status;
  List<City>? list;

  Data({this.status, this.list});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      status: json['status'],
      list: List<City>.from(json['list'].map((x) => City.fromJson(x))),
    );
  }
}

class City {
  String? cityId;
  String? cityName;

  City({this.cityId, this.cityName});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json['city_id'],
      cityName: json['city_name'],
    );
  }
}
