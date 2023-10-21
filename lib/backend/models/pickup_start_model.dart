class PickupStartModel {
  bool? success;
  Data? data;

  PickupStartModel({this.success, this.data});

  PickupStartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


}

class Data {
  String? status;
  String? msg;
  Task? task;
  List<dynamic>? list;

  Data({this.status, this.msg, this.task, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    task = json['task'] != null ? Task.fromJson(json['task']) : null;
    list = json['list'];
  }
}

class Task {
  int? orderTaskId;
  int? orderId;
  String? orderTaskCode;
  String? orderTaskDisplayText;
  String? taskType;
  String? assignedLookup;
  int? assignedTo;
  int? completedBy;
  int? returnedBy;
  Null? returnExpectedDt;
  int? createdBy;
  String? assignedOn;
  Null? completedOn;
  Null? returnedOn;
  Null? taskComments;
  int? previousTaskId;
  Null? generalNotes;
  int? noOfAttempt;
  Null? collectedBy;
  Null? collectedByMobileNo;
  int? processStatus;
  String? startDtTime;
  Null? endDtTime;
  Null? totalTimeTakenInMins;
  int? markedAsNotOk;
  Null? markedAsNotOkOn;
  String? transportType;
  Null? payoutBasedOnService;

  Task(
      {this.orderTaskId,
      this.orderId,
      this.orderTaskCode,
      this.orderTaskDisplayText,
      this.taskType,
      this.assignedLookup,
      this.assignedTo,
      this.completedBy,
      this.returnedBy,
      this.returnExpectedDt,
      this.createdBy,
      this.assignedOn,
      this.completedOn,
      this.returnedOn,
      this.taskComments,
      this.previousTaskId,
      this.generalNotes,
      this.noOfAttempt,
      this.collectedBy,
      this.collectedByMobileNo,
      this.processStatus,
      this.startDtTime,
      this.endDtTime,
      this.totalTimeTakenInMins,
      this.markedAsNotOk,
      this.markedAsNotOkOn,
      this.transportType,
      this.payoutBasedOnService});

  Task.fromJson(Map<String, dynamic> json) {
    orderTaskId = json['order_task_id'];
    orderId = json['order_id'];
    orderTaskCode = json['order_task_code'];
    orderTaskDisplayText = json['order_task_display_text'];
    taskType = json['task_type'];
    assignedLookup = json['assigned_lookup'];
    assignedTo = json['assigned_to'];
    completedBy = json['completed_by'];
    returnedBy = json['returned_by'];
    returnExpectedDt = json['return_expected_dt'];
    createdBy = json['created_by'];
    assignedOn = json['assigned_on'];
    completedOn = json['completed_on'];
    returnedOn = json['returned_on'];
    taskComments = json['task_comments'];
    previousTaskId = json['previous_task_id'];
    generalNotes = json['general_notes'];
    noOfAttempt = json['no_of_attempt'];
    collectedBy = json['collected_by'];
    collectedByMobileNo = json['collected_by_mobile_no'];
    processStatus = json['process_status'];
    startDtTime = json['start_dt_time'];
    endDtTime = json['end_dt_time'];
    totalTimeTakenInMins = json['total_time_taken_in_mins'];
    markedAsNotOk = json['marked_as_not_ok'];
    markedAsNotOkOn = json['marked_as_not_ok_on'];
    transportType = json['transport_type'];
    payoutBasedOnService = json['payout_based_on_service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_task_id'] = this.orderTaskId;
    data['order_id'] = this.orderId;
    data['order_task_code'] = this.orderTaskCode;
    data['order_task_display_text'] = this.orderTaskDisplayText;
    data['task_type'] = this.taskType;
    data['assigned_lookup'] = this.assignedLookup;
    data['assigned_to'] = this.assignedTo;
    data['completed_by'] = this.completedBy;
    data['returned_by'] = this.returnedBy;
    data['return_expected_dt'] = this.returnExpectedDt;
    data['created_by'] = this.createdBy;
    data['assigned_on'] = this.assignedOn;
    data['completed_on'] = this.completedOn;
    data['returned_on'] = this.returnedOn;
    data['task_comments'] = this.taskComments;
    data['previous_task_id'] = this.previousTaskId;
    data['general_notes'] = this.generalNotes;
    data['no_of_attempt'] = this.noOfAttempt;
    data['collected_by'] = this.collectedBy;
    data['collected_by_mobile_no'] = this.collectedByMobileNo;
    data['process_status'] = this.processStatus;
    data['start_dt_time'] = this.startDtTime;
    data['end_dt_time'] = this.endDtTime;
    data['total_time_taken_in_mins'] = this.totalTimeTakenInMins;
    data['marked_as_not_ok'] = this.markedAsNotOk;
    data['marked_as_not_ok_on'] = this.markedAsNotOkOn;
    data['transport_type'] = this.transportType;
    data['payout_based_on_service'] = this.payoutBasedOnService;
    return data;
  }
}
