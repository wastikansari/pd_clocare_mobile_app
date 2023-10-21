class CustomerInfoModel {
  bool? success;
  Data? data;

  CustomerInfoModel({this.success, this.data});

  CustomerInfoModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? status;
  List<dynamic>? list;
  LoginInfo? loginInfo;
  CustomerInfo? customerInfo;
  List<AddressInfo>? addressInfo;
  List<ServiceList>? serviceList;

  Data(
      {this.status,
      this.loginInfo,
      this.list,
      this.customerInfo,
      this.addressInfo,
      this.serviceList});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    list = json['list'];
    loginInfo = json['loginInfo'] != null
        ? LoginInfo.fromJson(json['loginInfo'])
        : null;

    customerInfo = json['customerInfo'] != null
        ? CustomerInfo.fromJson(json['customerInfo'])
        : null;
    if (json['addressInfo'] != null) {
      addressInfo = <AddressInfo>[];
      json['addressInfo'].forEach((v) {
        addressInfo!.add(AddressInfo.fromJson(v));
      });
    }
    if (json['serviceList'] != null) {
      serviceList = <ServiceList>[];
      json['serviceList'].forEach((v) {
        serviceList!.add(ServiceList.fromJson(v));
      });
    }
  }
}

class LoginInfo {
  int? loginId;
  int? customerId;
  String? username;
  String? password;
  String? accessToken;
  // String? accessTokenStatus;
  // String? verificationCode;
  // String? verified;
  // String? verifiedOn;
  // int? requestCount;
  String? gatewayResponse;
  String? pushId;
  // String? device;
  // int? isMain;
  String? profileIcon;
  // int? externalLogin;
  // Null? externalSource;
  // Null? externalId;
  String? createdOn;
  String? lastModifiedOn;
  // Null? pwdLastModifiedOn;
  // String? resetAfter;
  // int? optForSmspush;
  // String? refCode;
  // String? refBy;
  int? currentStateId;
  int? currentCityId;
  int? currentAreaId;
  // String? currentVersion;
  // String? dob;
  // Null? anniversary;
  String? friendsName;

  LoginInfo(
      {this.loginId,
      this.customerId,
      this.username,
      this.password,
      this.accessToken,
      // this.accessTokenStatus,
      // this.verificationCode,
      // this.verified,
      // this.verifiedOn,
      // this.requestCount,
      this.gatewayResponse,
      this.pushId,
      // this.device,
      // this.isMain,
      this.profileIcon,
      // this.externalLogin,
      // this.externalSource,
      // this.externalId,
      this.createdOn,
      this.lastModifiedOn,
      // this.pwdLastModifiedOn,
      // this.resetAfter,
      // this.optForSmspush,
      // this.refCode,
      // this.refBy,
      this.currentStateId,
      this.currentCityId,
      this.currentAreaId,
      // this.currentVersion,
      // this.dob,
      // this.anniversary,
      this.friendsName});

  LoginInfo.fromJson(Map<String, dynamic> json) {
    loginId = json['login_id'];
    customerId = json['customer_id'];
    username = json['username'];
    password = json['password'];
    accessToken = json['access_token'];
    // accessTokenStatus = json['access_token_status'];
    // verificationCode = json['verification_code'];
    // verified = json['verified'];
    // verifiedOn = json['verified_on'];
    // requestCount = json['request_count'];
    gatewayResponse = json['gateway_response'];
    pushId = json['push_id'];
    // device = json['device'];
    // isMain = json['is_main'];
    profileIcon = json['profile_icon'];
    // externalLogin = json['external_login'];
    // externalSource = json['external_source'];
    // externalId = json['external_id'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
    // pwdLastModifiedOn = json['pwd_last_modified_on'];
    // resetAfter = json['reset_after'];
    // optForSmspush = json['opt_for_smspush'];
    // refCode = json['ref_code'];
    // refBy = json['ref_by'];
    currentStateId = json['current_state_id'];
    currentCityId = json['current_city_id'];
    currentAreaId = json['current_area_id'];
    // currentVersion = json['current_version'];
    // dob = json['dob'];
    // anniversary = json['anniversary'];
    friendsName = json['friends_name'];
  }
}

class CustomerInfo {
  int? customerId;
  String? firstname;
  String? lastname;
  String? email;
  String? mobile;
  int? status;
  int? availBalance;
  // Null? accountType;
  // String? emailVerified;
  // Null? emailVerifiedOn;
  // String? emailVerificationCode;
  // Null? mobileVerified;
  // Null? mobileVerifiedOn;
  // Null? mobileVerificationCode;
  // String? regSource;
  // String? fromIp;
  int? noMinWalletCheck;
  int? bypassOrderLimitCheck;
  int? totalMembers;
  // String? pickupFreq;
  // Null? customerOf;
  // Null? generalComments;
  // String? companyName;
  // String? gstNo;
  // int? createdBy;
  // String? customerInstructions;
  // int? isCorporateCustomer;
  // int? optForAutoDebit;
  String? createdOn;
  String? lastModifiedOn;

  CustomerInfo(
      {this.customerId,
      this.firstname,
      this.lastname,
      this.email,
      this.mobile,
      this.status,
      this.availBalance,
      // this.accountType,
      // this.emailVerified,
      // this.emailVerifiedOn,
      // this.emailVerificationCode,
      // this.mobileVerified,
      // this.mobileVerifiedOn,
      // this.mobileVerificationCode,
      // this.regSource,
      // this.fromIp,
      this.noMinWalletCheck,
      this.bypassOrderLimitCheck,
      this.totalMembers,
      // this.pickupFreq,
      // this.customerOf,
      // this.generalComments,
      // this.companyName,
      // this.gstNo,
      // this.createdBy,
      // this.customerInstructions,
      // this.isCorporateCustomer,
      // this.optForAutoDebit,
      this.createdOn,
      this.lastModifiedOn});

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    firstname = json['firstname'];
    lastname = json['lastname'] ?? '';
    email = json['email'] ?? '';
    mobile = json['mobile'];
    status = json['status'];
    availBalance = json['avail_balance'];
    // accountType = json['account_type'];
    // emailVerified = json['email_verified'];
    // emailVerifiedOn = json['email_verified_on'];
    // emailVerificationCode = json['email_verification_code'];
    // mobileVerified = json['mobile_verified'];
    // mobileVerifiedOn = json['mobile_verified_on'];
    // mobileVerificationCode = json['mobile_verification_code'];
    // regSource = json['reg_source'];
    // fromIp = json['from_ip'];
    noMinWalletCheck = json['no_min_wallet_check'];
    bypassOrderLimitCheck = json['bypass_order_limit_check'];
    totalMembers = json['total_members'];
    // pickupFreq = json['pickup_freq'];
    // customerOf = json['customer_of'];
    // generalComments = json['general_comments'];
    // companyName = json['company_name'];
    // gstNo = json['gst_no'];
    // createdBy = json['created_by'];
    // customerInstructions = json['customer_instructions'];
    // isCorporateCustomer = json['is_corporate_customer'];
    // optForAutoDebit = json['opt_for_auto_debit'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
  }
}

class AddressInfo {
  int? addressId;
  int? customerId;
  // int? addressType;
  // String? addressLabel;
  String? flatNo;
  String? street;
  String? landmark;
  int? stateId;
  int? cityId;
  int? pincodeId;
  // String? isDefault;
  // Null? isRegistered;
  // int? isBilling;
  // Null? addressLat;
  // Null? addressLon;
  // String? createdOn;
  // String? lastModifiedOn;
  String? formattedAddress;

  AddressInfo(
      {this.addressId,
      this.customerId,
      // this.addressType,
      // this.addressLabel,
      this.flatNo,
      this.street,
      this.landmark,
      this.stateId,
      this.cityId,
      this.pincodeId,
      // this.isDefault,
      // this.isRegistered,
      // this.isBilling,
      // this.addressLat,
      // this.addressLon,
      // this.createdOn,
      // this.lastModifiedOn,
      this.formattedAddress});

  AddressInfo.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    customerId = json['customer_id'];
    // addressType = json['address_type'];
    // addressLabel = json['address_label'];
    flatNo = json['flat_no'];
    street = json['street'];
    landmark = json['landmark'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    pincodeId = json['pincode_id'];
    // isDefault = json['is_default'];
    // isRegistered = json['is_registered'];
    // isBilling = json['is_billing'];
    // addressLat = json['address_lat'];
    // addressLon = json['address_lon'];
    // createdOn = json['created_on'];
    // lastModifiedOn = json['last_modified_on'];
    formattedAddress = json['formattedAddress'];
  }
}

class ServiceList {
  int? serviceId;
  String? name;
  int? status;
  int? maxOrderPerCustomerPerDay;
  String? serviceType;
  String? workflowType;
  int? isRegular;
  int? isOndemand;
  int? isCleaning;

  ServiceList({
    this.serviceId,
    this.name,
    this.status,
    this.maxOrderPerCustomerPerDay,
    this.serviceType,
    this.workflowType,
    this.isRegular,
    this.isOndemand,
    this.isCleaning,
  });

  ServiceList.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    name = json['name'];
    status = json['status'];
    maxOrderPerCustomerPerDay = json['max_order_per_customer_per_day'];
    serviceType = json['service_type'];
    workflowType = json['workflow_type'];

    isRegular = json['is_regular'];
    isOndemand = json['is_ondemand'];
    isCleaning = json['is_cleaning'];
  }
}
