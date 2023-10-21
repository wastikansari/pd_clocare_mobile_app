// class TimeSlotModel {
//   bool? success;
//   Data? data;

//   TimeSlotModel({this.success, this.data});

//   TimeSlotModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
// }

// class Data {
//   String? status;
//   Pickup? pickup;
//   Pickup? delivery;

//   Data({this.status, this.pickup, this.delivery});

//   Data.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     pickup = json['pickup'] != null ? Pickup.fromJson(json['pickup']) : null;
//     delivery = json['delivery'] != null ? Pickup.fromJson(json['delivery']) : null;
//   }
// }

// class Pickup {
//   String? date;
//   String? dateText;
//   List<DateLists>? dateLists;
//   int? time;
//   String? timeText;
//   List<TimeList>? timeList;

//   Pickup(
//       {this.date,
//       this.dateText,
//       this.dateLists,
//       this.time,
//       this.timeText,
//       this.timeList});

//   Pickup.fromJson(Map<String, dynamic> json) {
//     date = json['date'];
//     dateText = json['date_text'];
//     if (json['date_list'] != null) {
//       dateLists = <DateLists>[];
//       json['date_list'].forEach((v) {
//         dateLists!.add(new DateLists.fromJson(v));
//       });
//     }
//     time = json['time'];
//     timeText = json['time_text'];
//     if (json['time_list'] != null) {
//       timeList = <TimeList>[];
//       json['time_list'].forEach((v) {
//         timeList!.add(new TimeList.fromJson(v));
//       });
//     }
//   }
// }

// class DateLists {
//   String? date;
//   String? dateText;

//   DateLists({this.date, this.dateText});

//   DateLists.fromJson(Map<String, dynamic> json) {
//     date = json['date'];
//     dateText = json['date_text'];
//   }
// }

// class TimeList {
//   int? timeId;
//   String? timeText;
//   String? ends;

//   TimeList({this.timeId, this.timeText, this.ends});

//   TimeList.fromJson(Map<String, dynamic> json) {
//     timeId = json['time_id'];
//     timeText = json['time_text'];
//     ends = json['ends'];
//   }
// }

// class DateLists {
//   String? time;
//   String? date;
//   String? dateText;

//   DateLists({this.time, this.date, this.dateText});

//   DateLists.fromJson(Map<String, dynamic> json) {
//     time = json['time'];
//     date = json['date'];
//     dateText = json['date_text'];
//   }
// }
