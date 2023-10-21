class StaffProfileModel {
  bool? success;
  Data? data;

  StaffProfileModel({this.success, this.data});

  StaffProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  String? status;
  List? list;
  Data({
    this.status,
    this.list,
  });

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    list = List.fromJson(json['list']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['list'] = list!.toJson();
    return _data;
  }
}

class List {
  int? id;
  int? centerId;
  int? centerDeptId;
  String? first;
  String? middle;
  String? last;
  int? status;
  int? roleId;
  String? spic;
  int? idProof;
  String? proofCopy;
  String? notes;
  String? education;
  String? dob;
  String? username;
  String? mobile;
  String? email;
  int? gender;
  String? authKey;
  int? isFirstEntryPoint;
  int? canPickup;
  int? canDeliver;
  int? canProcess;
  int? canSupervise;
  int? canInspect;
  int? canRepair;
  int? canAssignForDelivery;
  int? canAssignForPickup;
  int? canRcvdOrderFromCustomer;
  int? canAssignForRepairing;
  int? canAssignToStation;
  int? canIron;
  int? canLaundry;
  int? canHandleNonRoutedOrders;
  int? canRefund;
  int? canApprovePayout;
  int? canHandleRateCard;
  int? canTakeOrdersOnPhone;
  int? canAddCouponOnOrder;
  int? canAddRemoveClothes;
  int? canGenerateProformaInvoice;
  int? canDebitOutstandingAmount;
  int? canDoVerification;
  int? canChangeOrderPaymentMethod;
  int? canHandleDeliveryForUnpaid;
  int? canAllowPodBpPassdue;
  int? canAllowBpGarmentlimitPerorder;
  int? canMarkCcAsCorporate;
  int? canBypassOtpForOrderUpdation;
  int? canDoOptForAutoDebit;
  int? canCloseTicket;
  int? canMakeCommentVisibleToCustomer;
  int? canDoInwardForBags;
  int? canCloseOrderStageManually;
  int? canForcefullyUnpaidToPaid;
  int? isRoot;
  int? pickupCapacity;
  int? deliveryCapacity;
  int? ironingCapacity;
  int? laundryCapacity;
  // String? pwdLastModifiedOn;
  String? lastLogin;
  String? lastLogout;
  double? lastLat;
  double? lastLon;
  String? travelSpeed;
  String? lastLocatedOn;
  int? sun;
  int? mon;
  int? tue;
  int? wed;
  int? thu;
  int? fri;
  int? sat;
  String? device;
  String? appVer;
  String? createdOn;
  // String? lastModifiedOn;
  Centers? centers;
  Department? department;
  String? centerType;
  List({
    this.id,
    this.centerId,
    this.centerDeptId,
    this.first,
    this.middle,
    this.last,
    this.status,
    this.roleId,
    this.spic,
    this.idProof,
    this.proofCopy,
    this.notes,
    this.education,
    this.dob,
    this.username,
    this.mobile,
    this.email,
    this.gender,
    this.authKey,
    this.isFirstEntryPoint,
    this.canPickup,
    this.canDeliver,
    this.canProcess,
    this.canSupervise,
    this.canInspect,
    this.canRepair,
    this.canAssignForDelivery,
    this.canAssignForPickup,
    this.canRcvdOrderFromCustomer,
    this.canAssignForRepairing,
    this.canAssignToStation,
    this.canIron,
    this.canLaundry,
    this.canHandleNonRoutedOrders,
    this.canRefund,
    this.canApprovePayout,
    this.canHandleRateCard,
    this.canTakeOrdersOnPhone,
    this.canAddCouponOnOrder,
    this.canAddRemoveClothes,
    this.canGenerateProformaInvoice,
    this.canDebitOutstandingAmount,
    this.canDoVerification,
    this.canChangeOrderPaymentMethod,
    this.canHandleDeliveryForUnpaid,
    this.canAllowPodBpPassdue,
    this.canAllowBpGarmentlimitPerorder,
    this.canMarkCcAsCorporate,
    this.canBypassOtpForOrderUpdation,
    this.canDoOptForAutoDebit,
    this.canCloseTicket,
    this.canMakeCommentVisibleToCustomer,
    this.canDoInwardForBags,
    this.canCloseOrderStageManually,
    this.canForcefullyUnpaidToPaid,
    this.isRoot,
    this.pickupCapacity,
    this.deliveryCapacity,
    this.ironingCapacity,
    this.laundryCapacity,
    // this.pwdLastModifiedOn,
    this.lastLogin,
    this.lastLogout,
    this.lastLat,
    this.lastLon,
    this.travelSpeed,
    this.lastLocatedOn,
    this.sun,
    this.mon,
    this.tue,
    this.wed,
    this.thu,
    this.fri,
    this.sat,
    this.device,
    this.appVer,
    this.createdOn,
    // this.lastModifiedOn,
    this.centers,
    this.department,
    this.centerType,
  });

  List.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    centerId = json['center_id'];
    centerDeptId = json['center_dept_id'];

    first = json['first'];
    middle = json['middle'];
    last = json['last'];

    status = json['status'];
    roleId = json['role_id'];
    spic = json['spic'];
    idProof = json['id_proof'];
    proofCopy = json['proof_copy'];
    notes = json['notes'];
    education = json['education'];
    dob = json['dob'];
    username = json['username'];

    mobile = json['mobile'];
    email = json['email'];

    gender = json['gender'];

    authKey = json['auth_key'];
    isFirstEntryPoint = json['is_first_entry_point'];
    canPickup = json['can_pickup'];
    canDeliver = json['can_deliver'];
    canProcess = json['can_process'];
    canSupervise = json['can_supervise'];
    canInspect = json['can_inspect'];
    canRepair = json['can_repair'];
    canAssignForDelivery = json['can_assign_for_delivery'];
    canAssignForPickup = json['can_assign_for_pickup'];
    canRcvdOrderFromCustomer = json['can_rcvd_order_from_customer'];
    canAssignForRepairing = json['can_assign_for_repairing'];
    canAssignToStation = json['can_assign_to_station'];
    canIron = json['can_iron'];
    canLaundry = json['can_laundry'];
    canHandleNonRoutedOrders = json['can_handle_non_routed_orders'];
    canRefund = json['can_refund'];
    canApprovePayout = json['can_approve_payout'];
    canHandleRateCard = json['can_handle_rate_card'];
    canTakeOrdersOnPhone = json['can_take_orders_on_phone'];
    canAddCouponOnOrder = json['can_add_coupon_on_order'];
    canAddRemoveClothes = json['can_add_remove_clothes'];
    canGenerateProformaInvoice = json['can_generate_proforma_invoice'];
    canDebitOutstandingAmount = json['can_debit_outstanding_amount'];
    canDoVerification = json['can_do_verification'];
    canChangeOrderPaymentMethod = json['can_change_order_payment_method'];
    canHandleDeliveryForUnpaid = json['can_handle_delivery_for_unpaid'];
    canAllowPodBpPassdue = json['can_allow_pod_bp_passdue'];
    canAllowBpGarmentlimitPerorder = json['can_allow_bp_garmentlimit_perorder'];
    canMarkCcAsCorporate = json['can_mark_cc_as_corporate'];
    canBypassOtpForOrderUpdation = json['can_bypass_otp_for_order_updation'];
    canDoOptForAutoDebit = json['can_do_opt_for_auto_debit'];
    canCloseTicket = json['can_close_ticket'];
    canMakeCommentVisibleToCustomer =
        json['can_make_comment_visible_to_customer'];
    canDoInwardForBags = json['can_do_inward_for_bags'];
    canCloseOrderStageManually = json['can_close_order_stage_manually'];
    canForcefullyUnpaidToPaid = json['can_forcefully_unpaid_to_paid'];
    isRoot = json['is_root'];
    pickupCapacity = json['pickup_capacity'];
    deliveryCapacity = json['delivery_capacity'];
    ironingCapacity = json['ironing_capacity'];
    laundryCapacity = json['laundry_capacity'];
    // pwdLastModifiedOn = json['pwd_last_modified_on'];
    lastLogin = json['last_login'];
    lastLogout = json['last_logout'];
    lastLat = json['last_lat'];
    lastLon = json['last_lon'];
    travelSpeed = json['travel_speed'];

    lastLocatedOn = json['last_located_on'];

    sun = json['sun'];
    mon = json['mon'];
    tue = json['tue'];
    wed = json['wed'];
    thu = json['thu'];
    fri = json['fri'];
    sat = json['sat'];
    device = json['device'];
    appVer = json['app_ver'];

    createdOn = json['created_on'];
    // lastModifiedOn = json['last_modified_on'];
    centers = Centers.fromJson(json['center']);
    department = Department.fromJson(json['department']);
    centerType = json['center_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['center_id'] = centerId;
    _data['center_dept_id'] = centerDeptId;

    _data['first'] = first;
    _data['middle'] = middle;
    _data['last'] = last;

    _data['status'] = status;
    _data['role_id'] = roleId;
    _data['spic'] = spic;
    _data['id_proof'] = idProof;
    _data['proof_copy'] = proofCopy;
    _data['notes'] = notes;
    _data['education'] = education;
    _data['dob'] = dob;
    _data['username'] = username;

    _data['mobile'] = mobile;
    _data['email'] = email;
    _data['auth_key'] = authKey;
    _data['is_first_entry_point'] = isFirstEntryPoint;
    _data['can_pickup'] = canPickup;
    _data['can_deliver'] = canDeliver;
    _data['can_process'] = canProcess;
    _data['can_supervise'] = canSupervise;
    _data['can_inspect'] = canInspect;
    _data['can_repair'] = canRepair;
    _data['can_assign_for_delivery'] = canAssignForDelivery;
    _data['can_assign_for_pickup'] = canAssignForPickup;
    _data['can_rcvd_order_from_customer'] = canRcvdOrderFromCustomer;
    _data['can_assign_for_repairing'] = canAssignForRepairing;
    _data['can_assign_to_station'] = canAssignToStation;
    _data['can_iron'] = canIron;
    _data['can_laundry'] = canLaundry;
    _data['can_handle_non_routed_orders'] = canHandleNonRoutedOrders;
    _data['can_refund'] = canRefund;
    _data['can_approve_payout'] = canApprovePayout;
    _data['can_handle_rate_card'] = canHandleRateCard;
    _data['can_take_orders_on_phone'] = canTakeOrdersOnPhone;
    _data['can_add_coupon_on_order'] = canAddCouponOnOrder;
    _data['can_add_remove_clothes'] = canAddRemoveClothes;
    _data['can_generate_proforma_invoice'] = canGenerateProformaInvoice;
    _data['can_debit_outstanding_amount'] = canDebitOutstandingAmount;
    _data['can_do_verification'] = canDoVerification;
    _data['can_change_order_payment_method'] = canChangeOrderPaymentMethod;
    _data['can_handle_delivery_for_unpaid'] = canHandleDeliveryForUnpaid;
    _data['can_allow_pod_bp_passdue'] = canAllowPodBpPassdue;
    _data['can_allow_bp_garmentlimit_perorder'] =
        canAllowBpGarmentlimitPerorder;
    _data['can_mark_cc_as_corporate'] = canMarkCcAsCorporate;
    _data['can_bypass_otp_for_order_updation'] = canBypassOtpForOrderUpdation;
    _data['can_do_opt_for_auto_debit'] = canDoOptForAutoDebit;
    _data['can_close_ticket'] = canCloseTicket;
    _data['can_make_comment_visible_to_customer'] =
        canMakeCommentVisibleToCustomer;
    _data['can_do_inward_for_bags'] = canDoInwardForBags;
    _data['can_close_order_stage_manually'] = canCloseOrderStageManually;
    _data['can_forcefully_unpaid_to_paid'] = canForcefullyUnpaidToPaid;
    _data['is_root'] = isRoot;
    _data['pickup_capacity'] = pickupCapacity;
    _data['delivery_capacity'] = deliveryCapacity;
    _data['ironing_capacity'] = ironingCapacity;
    _data['laundry_capacity'] = laundryCapacity;
    // _data['pwd_last_modified_on'] = pwdLastModifiedOn;
    _data['last_login'] = lastLogin;
    _data['last_logout'] = lastLogout;
    _data['last_lat'] = lastLat;
    _data['last_lon'] = lastLon;
    _data['travel_speed'] = travelSpeed;

    _data['last_located_on'] = lastLocatedOn;

    _data['sun'] = sun;
    _data['mon'] = mon;
    _data['tue'] = tue;
    _data['wed'] = wed;
    _data['thu'] = thu;
    _data['fri'] = fri;
    _data['sat'] = sat;
    _data['device'] = device;
    _data['app_ver'] = appVer;
    _data['created_on'] = createdOn;
    // _data['last_modified_on'] = lastModifiedOn;
    _data['center'] = centers!.toJson();
    _data['department'] = department!.toJson();
    _data['center_type'] = centerType;
    return _data;
  }
}

class Centers {
  Centers({
    required this.centerId,
    required this.serviceId,
    required this.centerName,
    required this.centerDesc,
    required this.centerStreet,
    required this.centerLandmark,
    required this.centerStateId,
    required this.centerCityId,
    required this.centerPincodeId,
    required this.centerContactNumber,
    required this.centerEmail,
    required this.centerStatus,
    required this.centerType,
    required this.centerCustomerCareEmail,
    required this.centerDailyReportEmails,
    required this.centerDailySalesReportEmails,
    required this.centerCustomerCareMobile,
    required this.centerDailyCashCollectionReportEmail,
    required this.assignedServices,
    required this.createdOn,
    // required this.lastModifiedOn,
  });
  late final int centerId;
  late final int serviceId;
  late final String centerName;
  late final String centerDesc;
  late final String centerStreet;
  late final String centerLandmark;
  late final int centerStateId;
  late final int centerCityId;
  late final int centerPincodeId;
  late final String centerContactNumber;
  late final String centerEmail;
  late final int centerStatus;
  late final int centerType;
  late final String centerCustomerCareEmail;
  late final String centerDailyReportEmails;
  late final String centerDailySalesReportEmails;
  late final String centerCustomerCareMobile;
  late final String centerDailyCashCollectionReportEmail;
  late final String assignedServices;
  late final String createdOn;
  // late final String lastModifiedOn;

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
    // lastModifiedOn = json['last_modified_on'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['center_id'] = centerId;
    _data['service_id'] = serviceId;
    _data['center_name'] = centerName;
    _data['center_desc'] = centerDesc;
    _data['center_street'] = centerStreet;
    _data['center_landmark'] = centerLandmark;
    _data['center_state_id'] = centerStateId;
    _data['center_city_id'] = centerCityId;
    _data['center_pincode_id'] = centerPincodeId;
    _data['center_contact_number'] = centerContactNumber;
    _data['center_email'] = centerEmail;
    _data['center_status'] = centerStatus;
    _data['center_type'] = centerType;
    _data['center_customer_care_email'] = centerCustomerCareEmail;
    _data['center_daily_report_emails'] = centerDailyReportEmails;
    _data['center_daily_sales_report_emails'] = centerDailySalesReportEmails;
    _data['center_customer_care_mobile'] = centerCustomerCareMobile;
    _data['center_daily_cash_collection_report_email'] =
        centerDailyCashCollectionReportEmail;
    _data['assigned_services'] = assignedServices;
    _data['created_on'] = createdOn;
    // _data['last_modified_on'] = lastModifiedOn;
    return _data;
  }
}

class Department {
  Department({
    required this.centerDeptId,
    required this.centerId,
    required this.centerDeptName,
    required this.departmentStatus,
    required this.handlingCapacity,
    required this.capacityUnit,
    required this.createdOn,
    // required this.lastModifiedOn,
  });
  late final int centerDeptId;
  late final int centerId;
  late final String centerDeptName;
  late final int departmentStatus;
  late final int handlingCapacity;
  late final String capacityUnit;
  late final String createdOn;
  // late final String lastModifiedOn;

  Department.fromJson(Map<String, dynamic> json) {
    centerDeptId = json['center_dept_id'];
    centerId = json['center_id'];
    centerDeptName = json['center_dept_name'];
    departmentStatus = json['department_status'];
    handlingCapacity = json['handling_capacity'];
    capacityUnit = json['capacity_unit'];
    createdOn = json['created_on'];
    // lastModifiedOn = json['last_modified_on'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['center_dept_id'] = centerDeptId;
    _data['center_id'] = centerId;
    _data['center_dept_name'] = centerDeptName;
    _data['department_status'] = departmentStatus;
    _data['handling_capacity'] = handlingCapacity;
    _data['capacity_unit'] = capacityUnit;
    _data['created_on'] = createdOn;
    // _data['last_modified_on'] = lastModifiedOn;
    return _data;
  }
}
