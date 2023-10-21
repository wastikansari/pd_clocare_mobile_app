// class Status {
//   final bool? status;
//   final String? token;
//   final String? error;
//   final String? message;

//   Status({this.token, this.status, this.error, this.message,});
//   factory Status.fromJson(Map<String, dynamic> json) {
//     return Status(
//         status: json['status'] ?? false,
//         token: json['access_token'] ?? '',
//         error: json['error'] ?? '',
//         message: json['message'] ?? '');
//   }
// }

class StatusData {
  bool? success;
  Data? data;

  StatusData({this.success, this.data});

  StatusData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


}

class Data {
  String? status;
  String? accessToken;
  int? staffId;
  String? firstname;
  String? lastname;
  String? email;
  String? mobile;
  int? pickupCapacity;
  int? deliveryCapacity;
  int? ironingCapacity;
  int? canPickup;
  int? canDeliver;
  int? canIron;
  int? canLaundry;
  String? profileIcon;
  String? createdOn;
  String? pwdLastModifiedOn;
  String? centerType;
  Centers? centers;
  Department? department;
  int? loginId;
  String? totalOrdersForPickup;
  String? totalOrdersForDelivery;
  String? totalRequestForPickup;
  int? totalRequestForDelivery;

  Data(
      {this.status,
      this.accessToken,
      this.staffId,
      this.firstname,
      this.lastname,
      this.email,
      this.mobile,
      this.pickupCapacity,
      this.deliveryCapacity,
      this.ironingCapacity,
      this.canPickup,
      this.canDeliver,
      this.canIron,
      this.canLaundry,
      this.profileIcon,
      this.createdOn,
      this.pwdLastModifiedOn,
      this.centerType,
      this.centers,
      this.department,
      this.loginId,
      this.totalOrdersForPickup,
      this.totalOrdersForDelivery,
      this.totalRequestForPickup,
      this.totalRequestForDelivery});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['access_token'];
    staffId = json['staff_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    mobile = json['mobile'];
    pickupCapacity = json['pickup_capacity'];
    deliveryCapacity = json['delivery_capacity'];
    ironingCapacity = json['ironing_capacity'];
    canPickup = json['can_pickup'];
    canDeliver = json['can_deliver'];
    canIron = json['can_iron'];
    canLaundry = json['can_laundry'];
    profileIcon = json['profile_icon'];
    createdOn = json['created_on'];
    pwdLastModifiedOn = json['pwd_last_modified_on'];
    centerType = json['center_type'];
    centers =
        json['center'] != null ? new Centers.fromJson(json['center']) : null;
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    loginId = json['login_id'];
    totalOrdersForPickup = json['total_orders_for_pickup'].toString();
    totalOrdersForDelivery = json['total_orders_for_delivery'].toString();
    totalRequestForPickup = json['total_request_for_pickup'].toString();
    totalRequestForDelivery = json['total_request_for_delivery'];
  }
}

class Centers {
  int? centerId;
  int? serviceId;
  String? centerName;
  String? centerDesc;
  String? centerStreet;
  String? centerLandmark;
  int? centerStateId;
  int? centerCityId;
  int? centerPincodeId;
  String? centerContactNumber;
  String? centerEmail;
  int? centerStatus;
  int? centerType;
  String? centerCustomerCareEmail;
  String? centerDailyReportEmails;
  String? centerDailySalesReportEmails;
  String? centerCustomerCareMobile;
  String? centerDailyCashCollectionReportEmail;
  String? assignedServices;
  String? createdOn;
  String? lastModifiedOn;

  Centers(
      {this.centerId,
      this.serviceId,
      this.centerName,
      this.centerDesc,
      this.centerStreet,
      this.centerLandmark,
      this.centerStateId,
      this.centerCityId,
      this.centerPincodeId,
      this.centerContactNumber,
      this.centerEmail,
      this.centerStatus,
      this.centerType,
      this.centerCustomerCareEmail,
      this.centerDailyReportEmails,
      this.centerDailySalesReportEmails,
      this.centerCustomerCareMobile,
      this.centerDailyCashCollectionReportEmail,
      this.assignedServices,
      this.createdOn,
      this.lastModifiedOn});

  Centers.fromJson(Map<String, dynamic> json) {
    centerId = json['center_id'];
    serviceId = json['service_id'];
    centerName = json['center_name'];
    centerDesc = json['center_desc'];
    centerStreet = json['center_street'];
    centerLandmark = json['center_landmark'];
    centerStateId = json['center_state_id'];
    centerCityId = json['center_city_id'];
    centerPincodeId = json['center_pincode_id'];
    centerContactNumber = json['center_contact_number'];
    centerEmail = json['center_email'];
    centerStatus = json['center_status'];
    centerType = json['center_type'];
    centerCustomerCareEmail = json['center_customer_care_email'];
    centerDailyReportEmails = json['center_daily_report_emails'];
    centerDailySalesReportEmails = json['center_daily_sales_report_emails'];
    centerCustomerCareMobile = json['center_customer_care_mobile'];
    centerDailyCashCollectionReportEmail =
        json['center_daily_cash_collection_report_email'];
    assignedServices = json['assigned_services'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['center_id'] = this.centerId;
    data['service_id'] = this.serviceId;
    data['center_name'] = this.centerName;
    data['center_desc'] = this.centerDesc;
    data['center_street'] = this.centerStreet;
    data['center_landmark'] = this.centerLandmark;
    data['center_state_id'] = this.centerStateId;
    data['center_city_id'] = this.centerCityId;
    data['center_pincode_id'] = this.centerPincodeId;
    data['center_contact_number'] = this.centerContactNumber;
    data['center_email'] = this.centerEmail;
    data['center_status'] = this.centerStatus;
    data['center_type'] = this.centerType;
    data['center_customer_care_email'] = this.centerCustomerCareEmail;
    data['center_daily_report_emails'] = this.centerDailyReportEmails;
    data['center_daily_sales_report_emails'] =
        this.centerDailySalesReportEmails;
    data['center_customer_care_mobile'] = this.centerCustomerCareMobile;
    data['center_daily_cash_collection_report_email'] =
        this.centerDailyCashCollectionReportEmail;
    data['assigned_services'] = this.assignedServices;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    return data;
  }
}

class Department {
  int? centerDeptId;
  int? centerId;
  String? centerDeptName;
  int? departmentStatus;
  int? handlingCapacity;
  String? capacityUnit;
  String? createdOn;
  String? lastModifiedOn;

  Department(
      {this.centerDeptId,
      this.centerId,
      this.centerDeptName,
      this.departmentStatus,
      this.handlingCapacity,
      this.capacityUnit,
      this.createdOn,
      this.lastModifiedOn});

  Department.fromJson(Map<String, dynamic> json) {
    centerDeptId = json['center_dept_id'];
    centerId = json['center_id'];
    centerDeptName = json['center_dept_name'];
    departmentStatus = json['department_status'];
    handlingCapacity = json['handling_capacity'];
    capacityUnit = json['capacity_unit'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['center_dept_id'] = this.centerDeptId;
    data['center_id'] = this.centerId;
    data['center_dept_name'] = this.centerDeptName;
    data['department_status'] = this.departmentStatus;
    data['handling_capacity'] = this.handlingCapacity;
    data['capacity_unit'] = this.capacityUnit;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    return data;
  }
}
