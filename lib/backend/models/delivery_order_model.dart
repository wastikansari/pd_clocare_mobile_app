class DeliverOrderModel {
  bool? success;
  List<Data>? data;

  DeliverOrderModel({this.success, this.data});

  DeliverOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
      
    }
  }


}

class Data {
  String? orderId;
  String? orderDisplayId;
  String? customerId;
  String? serviceId;
  String? pickupDate;
  String? pickupSlotId;
  // Null? prefPickupTime;
  String? deliveryDate;
  String? deliverySlotId;
  // Null? prefDeliveryTime;
  String? ordertypeId;
  String? orderTotal;
  String? orderSubTotal;
  String? orderAmount;
  String? orderTaxes;
  String? orderOutstandingAmount;
  String? totalItems;
  // String? totalRcvdItems;
  // String? totalDlvrdItems;
  // String? comments;
  String? pickupaddressId;
  String? deliveryaddressId;
  // String? sameAs;
  String? pickupFlatNo;
  String? pickupStreet;
  String? pickupLandmark;
  String? pickupStateId;
  String? pickupCityId;
  String? pickupPincodeId;
  // Null? pickupLat;
  // Null? pickupLng;
  String? deliveryFlatNo;
  String? deliveryStreet;
  String? deliveryLandmark;
  String? deliveryStateId;
  String? deliveryCityId;
  String? deliveryPincodeId;
  // Null? deliveryLat;
  // Null? deliveryLng;
  // String? orderBookedBy;
  // Null? atPlace;
  String? status;
  // String? cancelled;
  // Null? cancellationReason;
  // Null? cancelledOn;
  // String? cancelledBy;
  // String? cancelledById;
  // String? initialAssignedTo;
  // String? deliveryAssignedTo;
  // String? extraPay;
  // String? extraPaidAmount;
  // String? extraPaidOn;
  // String? extraPaidBy;
  // String? isFeedbackRcvd;
  // String? isMarkedAsAutoFeedback;
  // Null? feedbackRcvdOn;
  // String? isPickedup;
  // String? isProcessed;
  // String? isDelivered;
  // String? isCollectedInPerson;
  // String? isAutoRouted;
  // String? isRefunded;
  // String? refundedAmount;
  // Null? refundedOn;
  // Null? refundedBy;
  // Null? refundComment;
  // Null? submitTo;
  // Null? submittedBy;
  // Null? isSubmitted;
  // Null? submittedOn;
  // String? isRepeated;
  // String? rateMultiplier;
  // String? isPaidToVendor;
  // String? isPayableCalculated;
  String? deliveryAttempts;
  // String? pickupAttempts;
  // String? isInvoiceGenerated;
  // Null? invoiceNum;
  // Null? invoiceFile;
  // Null? invoicedOn;
  // String? additionalCharges;
  // String? isProformaInvoiceGenerated;
  // Null? proformaInvoiceNum;
  // Null? proformaInvoiceFile;
  // Null? proformaInvoicedOn;
  // String? originSource;
  // Null? orderBookedByStaff;
  // Null? paymentMethod;
  // String? refDiscount;
  // Null? refDiscountMsg;
  // String? isBillGenerated;
  // Null? feedbackFollowupRequestStatus;
  // Null? scheduleDate;
  String? modeOfPayment;
  // Null? closedOn;
  // Null? corporateId;
  // Null? corporateLocationId;
  // Null? corporateUnitId;
  // String? isGeneratedByScheduler;
  // String? monthlySubscription;
  // String? parentOrderId;
  // String? additionalDiscount;
  // Null? additionalDiscountType;
  // String? additionalDiscountAmount;
  // String? specialDiscount;
  // String? additionalCb;
  // Null? additionalCbType;
  // String? additionalCbAmount;
  // Null? specialDiscountType;
  // String? specialDiscountAmount;
  // String? specialComment;
  // String? isDonation;
  // String? prefPickupTimeCharge;
  // String? prefDeliveryTimeCharge;
  // String? hasPrefPickupTime;
  // String? hasPrefDeliveryTime;
  // String? needsVerification;
  // String? verifiedBy;
  // String? verifiedOn;
  // String? verifiedByResponsiblePerson;
  // String? isLf;
  // String? isQuicklyPickedup;
  // String? createdOn;
  // String? lastModifiedOn;
  // Null? additionalCbRedeemed;
  // Null? additionalCbRedeemedOn;
  // Null? additionalCbRedeemedFor;
  // String? orderTaxableAmount;
  // String? relatedCenterId;
  // String? isReturnedOrder;
  // Null? returnOrderId;
  // String? totalReturnedCount;
  // Null? deliveryPackId;
  String? deliveryPackPrice;
  String? deliveryPackExtraIncluded;
  String? isRegular;
  String? isSeniorCitizens;
  String? isCovidPatients;
  String? covidPatientAmount;
  String? isCovidCenters;
  String? cancellationCharges;
  String? cancellationChargesPay;
  String? rescheduleCharges;
  String? holdAmount;
  String? payOnPickup;
  String? deliveryCharges;
  String? name;
  String? startsOn;
  String? endsOn;
  String? username;
  String? typeName;
  String? orderTaskId;
  String? orderDate;
  DeliveryPincodes? deliveryPincodes;
  Service? service;
  Customer? customer;
  DeliveryTimeSlot? deliveryTimeSlot;
  OrderType? orderType;
  SignIn? signIn;
  // List<OrderStages>? orderStages;
  // bool? isPickedUp;
  // bool? isProcessed;
  // bool? isDelivered;
  // OrderBookedBy? orderBookedBy;
  // DeliveryPincodes? pickupPincodes;
  // PickupCities? pickupCities;
  // PickupStates? pickupStates;
  // DeliveryTimeSlot? timeSlot;
  String? formattedPickupAddress;
  // PickupCities? deliveryCities;
  // PickupStates? deliveryStates;
  String? formattedDeliveryAddress;
  // List<Null>? taxes;
  // Null? offer;
  // List<OrderWiseStages>? orderWiseStages;
  // DeliveryPersonInfo? deliveryPersonInfo;
  // DeliveryPersonInfo? pickupPersonInfo;

  Data(
      {this.orderId,
      this.orderDisplayId,
      this.customerId,
      this.serviceId,
      this.pickupDate,
      this.pickupSlotId,
      // this.prefPickupTime,
      this.deliveryDate,
      this.deliverySlotId,
      // this.prefDeliveryTime,
      this.ordertypeId,
      this.orderTotal,
      this.orderSubTotal,
      this.orderAmount,
      this.orderTaxes,
      this.orderOutstandingAmount,
      this.totalItems,
      // this.totalRcvdItems,
      // this.totalDlvrdItems,
      // this.comments,
      this.pickupaddressId,
      this.deliveryaddressId,
      // this.sameAs,
      this.pickupFlatNo,
      this.pickupStreet,
      this.pickupLandmark,
      this.pickupStateId,
      this.pickupCityId,
      this.pickupPincodeId,
      // this.pickupLat,
      // this.pickupLng,
      this.deliveryFlatNo,
      this.deliveryStreet,
      this.deliveryLandmark,
      this.deliveryStateId,
      this.deliveryCityId,
      this.deliveryPincodeId,
      // this.deliveryLat,
      // this.deliveryLng,
      // this.orderBookedBy,
      // this.atPlace,
      this.status,
      // this.cancelled,
      // this.cancellationReason,
      // this.cancelledOn,
      // this.cancelledBy,
      // this.cancelledById,
      // this.initialAssignedTo,
      // this.deliveryAssignedTo,
      // this.extraPay,
      // this.extraPaidAmount,
      // this.extraPaidOn,
      // this.extraPaidBy,
      // this.isFeedbackRcvd,
      // this.isMarkedAsAutoFeedback,
      // this.feedbackRcvdOn,
      // this.isPickedup,
      // this.isProcessed,
      // this.isDelivered,
      // this.isCollectedInPerson,
      // this.isAutoRouted,
      // this.isRefunded,
      // this.refundedAmount,
      // this.refundedOn,
      // this.refundedBy,
      // this.refundComment,
      // this.submitTo,
      // this.submittedBy,
      // this.isSubmitted,
      // this.submittedOn,
      // this.isRepeated,
      // this.rateMultiplier,
      // this.isPaidToVendor,
      // this.isPayableCalculated,
      this.deliveryAttempts,
      // this.pickupAttempts,
      // this.isInvoiceGenerated,
      // this.invoiceNum,
      // this.invoiceFile,
      // this.invoicedOn,
      // this.additionalCharges,
      // this.isProformaInvoiceGenerated,
      // this.proformaInvoiceNum,
      // this.proformaInvoiceFile,
      // this.proformaInvoicedOn,
      // this.originSource,
      // this.orderBookedByStaff,
      // this.paymentMethod,
      // this.refDiscount,
      // this.refDiscountMsg,
      // this.isBillGenerated,
      // this.feedbackFollowupRequestStatus,
      // this.scheduleDate,
      this.modeOfPayment,
      // this.closedOn,
      // this.corporateId,
      // this.corporateLocationId,
      // this.corporateUnitId,
      // this.isGeneratedByScheduler,
      // this.monthlySubscription,
      // this.parentOrderId,
      // this.additionalDiscount,
      // this.additionalDiscountType,
      // this.additionalDiscountAmount,
      // this.specialDiscount,
      // this.additionalCb,
      // this.additionalCbType,
      // this.additionalCbAmount,
      // this.specialDiscountType,
      // this.specialDiscountAmount,
      // this.specialComment,
      // this.isDonation,
      // this.prefPickupTimeCharge,
      // this.prefDeliveryTimeCharge,
      // this.hasPrefPickupTime,
      // this.hasPrefDeliveryTime,
      // this.needsVerification,
      // this.verifiedBy,
      // this.verifiedOn,
      // this.verifiedByResponsiblePerson,
      // this.isLf,
      // this.isQuicklyPickedup,
      // this.createdOn,
      // this.lastModifiedOn,
      // this.additionalCbRedeemed,
      // this.additionalCbRedeemedOn,
      // this.additionalCbRedeemedFor,
      // this.orderTaxableAmount,
      // this.relatedCenterId,
      // this.isReturnedOrder,
      // this.returnOrderId,
      // this.totalReturnedCount,
      // this.deliveryPackId,
      this.deliveryPackPrice,
      this.deliveryPackExtraIncluded,
      this.isRegular,
      this.isSeniorCitizens,
      this.isCovidPatients,
      this.covidPatientAmount,
      this.isCovidCenters,
      this.cancellationCharges,
      this.cancellationChargesPay,
      this.rescheduleCharges,
      this.holdAmount,
      this.payOnPickup,
      this.deliveryCharges,
      this.name,
      this.startsOn,
      this.endsOn,
      this.username,
      this.typeName,
      this.orderTaskId,
      this.orderDate,
      this.deliveryPincodes,
      this.service,
      this.customer,
      this.deliveryTimeSlot,
      this.orderType,
      this.signIn,
      // this.orderStages,
      // this.isPickedUp,
      // this.isProcessed,
      // this.isDelivered,
      // this.orderBookedBy,
      // this.pickupPincodes,
      // this.pickupCities,
      // this.pickupStates,
      // this.timeSlot,
      this.formattedPickupAddress,
      // this.deliveryCities,
      // this.deliveryStates,
      this.formattedDeliveryAddress,
      // this.taxes,
      // this.offer,
      // this.orderWiseStages,
      // this.deliveryPersonInfo,
      // this.pickupPersonInfo
      });

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderDisplayId = json['order_display_id'];
    customerId = json['customer_id'];
    serviceId = json['service_id'];
    pickupDate = json['pickup_date'];
    pickupSlotId = json['pickup_slot_id'];
    // prefPickupTime = json['pref_pickup_time'];
    deliveryDate = json['delivery_date'];
    deliverySlotId = json['delivery_slot_id'];
    // prefDeliveryTime = json['pref_delivery_time'];
    ordertypeId = json['ordertype_id'];
    orderTotal = json['order_total'];
    orderSubTotal = json['order_sub_total'];
    orderAmount = json['order_amount'];
    orderTaxes = json['order_taxes'];
    orderOutstandingAmount = json['order_outstanding_amount'];
    totalItems = json['total_items'];
    // totalRcvdItems = json['total_rcvd_items'];
    // totalDlvrdItems = json['total_dlvrd_items'];
    // comments = json['comments'];
    pickupaddressId = json['pickupaddress_id'];
    deliveryaddressId = json['deliveryaddress_id'];
    // sameAs = json['same_as'];
    pickupFlatNo = json['pickup_flat_no'];
    pickupStreet = json['pickup_street'];
    pickupLandmark = json['pickup_landmark'];
    pickupStateId = json['pickup_state_id'];
    pickupCityId = json['pickup_city_id'];
    pickupPincodeId = json['pickup_pincode_id'];
    // pickupLat = json['pickup_lat'];
    // pickupLng = json['pickup_lng'];
    deliveryFlatNo = json['delivery_flat_no'];
    deliveryStreet = json['delivery_street'];
    deliveryLandmark = json['delivery_landmark'];
    deliveryStateId = json['delivery_state_id'];
    deliveryCityId = json['delivery_city_id'];
    deliveryPincodeId = json['delivery_pincode_id'];
    // deliveryLat = json['delivery_lat'];
    // deliveryLng = json['delivery_lng'];
    // orderBookedBy = json['order_booked_by'];
    // atPlace = json['at_place'];
    status = json['status'];
    // cancelled = json['cancelled'];
    // cancellationReason = json['cancellation_reason'];
    // cancelledOn = json['cancelled_on'];
    // cancelledBy = json['cancelled_by'];
    // cancelledById = json['cancelled_by_id'];
    // initialAssignedTo = json['initial_assigned_to'];
    // deliveryAssignedTo = json['delivery_assigned_to'];
    // extraPay = json['extra_pay'];
    // extraPaidAmount = json['extra_paid_amount'];
    // extraPaidOn = json['extra_paid_on'];
    // extraPaidBy = json['extra_paid_by'];
    // isFeedbackRcvd = json['is_feedback_rcvd'];
    // isMarkedAsAutoFeedback = json['is_marked_as_auto_feedback'];
    // feedbackRcvdOn = json['feedback_rcvd_on'];
    // isPickedup = json['is_pickedup'];
    // isProcessed = json['is_processed'];
    // isDelivered = json['is_delivered'];
    // isCollectedInPerson = json['is_collected_in_person'];
    // isAutoRouted = json['is_auto_routed'];
    // isRefunded = json['is_refunded'];
    // refundedAmount = json['refunded_amount'];
    // refundedOn = json['refunded_on'];
    // refundedBy = json['refunded_by'];
    // refundComment = json['refund_comment'];
    // submitTo = json['submit_to'];
    // submittedBy = json['submitted_by'];
    // isSubmitted = json['is_submitted'];
    // submittedOn = json['submitted_on'];
    // isRepeated = json['is_repeated'];
    // rateMultiplier = json['rate_multiplier'];
    // isPaidToVendor = json['is_paid_to_vendor'];
    // isPayableCalculated = json['is_payable_calculated'];
    deliveryAttempts = json['delivery_attempts'].toString();
    // pickupAttempts = json['pickup_attempts'];
    // isInvoiceGenerated = json['is_invoice_generated'];
    // invoiceNum = json['invoice_num'];
    // invoiceFile = json['invoice_file'];
    // invoicedOn = json['invoiced_on'];
    // additionalCharges = json['additional_charges'];
    // isProformaInvoiceGenerated = json['is_proforma_invoice_generated'];
    // proformaInvoiceNum = json['proforma_invoice_num'];
    // proformaInvoiceFile = json['proforma_invoice_file'];
    // proformaInvoicedOn = json['proforma_invoiced_on'];
    // originSource = json['origin_source'];
    // orderBookedByStaff = json['order_booked_by_staff'];
    // paymentMethod = json['payment_method'];
    // refDiscount = json['ref_discount'];
    // refDiscountMsg = json['ref_discount_msg'];
    // isBillGenerated = json['is_bill_generated'];
    // feedbackFollowupRequestStatus = json['feedback_followup_request_status'];
    // scheduleDate = json['schedule_date'];
    modeOfPayment = json['mode_of_payment'];
    // closedOn = json['closed_on'];
    // corporateId = json['corporate_id'];
    // corporateLocationId = json['corporate_location_id'];
    // corporateUnitId = json['corporate_unit_id'];
    // isGeneratedByScheduler = json['is_generated_by_scheduler'];
    // monthlySubscription = json['monthly_subscription'];
    // parentOrderId = json['parent_order_id'];
    // additionalDiscount = json['additional_discount'];
    // additionalDiscountType = json['additional_discount_type'];
    // additionalDiscountAmount = json['additional_discount_amount'];
    // specialDiscount = json['special_discount'];
    // additionalCb = json['additional_cb'];
    // additionalCbType = json['additional_cb_type'];
    // additionalCbAmount = json['additional_cb_amount'];
    // specialDiscountType = json['special_discount_type'];
    // specialDiscountAmount = json['special_discount_amount'];
    // specialComment = json['special_comment'];
    // isDonation = json['is_donation'];
    // prefPickupTimeCharge = json['pref_pickup_time_charge'];
    // prefDeliveryTimeCharge = json['pref_delivery_time_charge'];
    // hasPrefPickupTime = json['has_pref_pickup_time'];
    // hasPrefDeliveryTime = json['has_pref_delivery_time'];
    // needsVerification = json['needs_verification'];
    // verifiedBy = json['verified_by'];
    // verifiedOn = json['verified_on'];
    // verifiedByResponsiblePerson = json['verified_by_responsible_person'];
    // isLf = json['is_lf'];
    // isQuicklyPickedup = json['is_quickly_pickedup'];
    // createdOn = json['created_on'];
    // lastModifiedOn = json['last_modified_on'];
    // additionalCbRedeemed = json['additional_cb_redeemed'];
    // additionalCbRedeemedOn = json['additional_cb_redeemed_on'];
    // additionalCbRedeemedFor = json['additional_cb_redeemed_for'];
    // orderTaxableAmount = json['order_taxable_amount'];
    // relatedCenterId = json['related_center_id'];
    // isReturnedOrder = json['is_returned_order'];
    // returnOrderId = json['return_order_id'];
    // totalReturnedCount = json['total_returned_count'];
    // deliveryPackId = json['delivery_pack_id'];
    deliveryPackPrice = json['delivery_pack_price'];
    deliveryPackExtraIncluded = json['delivery_pack_extra_included'];
    isRegular = json['is_regular'];
    isSeniorCitizens = json['is_senior_citizens'];
    isCovidPatients = json['is_covid_patients'];
    covidPatientAmount = json['covid_patient_amount'];
    isCovidCenters = json['is_covid_centers'];
    cancellationCharges = json['cancellation_charges'];
    cancellationChargesPay = json['cancellation_charges_pay'];
    rescheduleCharges = json['reschedule_charges'];
    holdAmount = json['hold_amount'];
    payOnPickup = json['pay_on_pickup'];
    deliveryCharges = json['delivery_charges'];
    name = json['name'];
    startsOn = json['starts_on'];
    endsOn = json['ends_on'];
    username = json['username'];
    typeName = json['type_name'];
    orderTaskId = json['order_task_id'];
    orderDate = json['order_date'];
    deliveryPincodes = json['deliveryPincodes'] != null
        ? new DeliveryPincodes.fromJson(json['deliveryPincodes'])
        : null;
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    deliveryTimeSlot = json['deliveryTimeSlot'] != null
        ? new DeliveryTimeSlot.fromJson(json['deliveryTimeSlot'])
        : null;
    orderType = json['orderType'] != null
        ? new OrderType.fromJson(json['orderType'])
        : null;
    signIn =
        json['signIn'] != null ?  SignIn.fromJson(json['signIn']) : null;
    // if (json['order_stages'] != null) {
    //   orderStages = <OrderStages>[];
    //   json['order_stages'].forEach((v) {
    //     orderStages!.add(new OrderStages.fromJson(v));
    //   });
    // }
    // // isPickedUp = json['isPickedUp'];
    // // isProcessed = json['isProcessed'];
    // // isDelivered = json['isDelivered'];
    // orderBookedBy = json['orderBookedBy'] != null
    //     ? new OrderBookedBy.fromJson(json['orderBookedBy'])
    //     : null;
    // pickupPincodes = json['pickupPincodes'] != null
    //     ? new DeliveryPincodes.fromJson(json['pickupPincodes'])
    //     : null;
    // pickupCities = json['pickupCities'] != null
    //     ? new PickupCities.fromJson(json['pickupCities'])
    //     : null;
    // pickupStates = json['pickupStates'] != null
    //     ? new PickupStates.fromJson(json['pickupStates'])
    //     : null;
    // timeSlot = json['timeSlot'] != null
    //     ? new DeliveryTimeSlot.fromJson(json['timeSlot'])
    //     : null;
    formattedPickupAddress = json['formatted_pickup_address'];
    // deliveryCities = json['deliveryCities'] != null
    //     ? new PickupCities.fromJson(json['deliveryCities'])
    //     : null;
    // deliveryStates = json['deliveryStates'] != null
    //     ? new PickupStates.fromJson(json['deliveryStates'])
    //     : null;
    formattedDeliveryAddress = json['formatted_delivery_address'];
    // if (json['taxes'] != null) {
    //   taxes = <Null>[];
    //   json['taxes'].forEach((v) {
    //     taxes!.add(new Null.fromJson(v));
    //   });
    // }
    // offer = json['offer'];
    // if (json['orderWiseStages'] != null) {
    //   orderWiseStages = <OrderWiseStages>[];
    //   json['orderWiseStages'].forEach((v) {
    //     orderWiseStages!.add(new OrderWiseStages.fromJson(v));
    //   });
    // }
    // deliveryPersonInfo = json['DeliveryPersonInfo'] != null
    //     ? new DeliveryPersonInfo.fromJson(json['DeliveryPersonInfo'])
    //     : null;
    // pickupPersonInfo = json['PickupPersonInfo'] != null
    //     ? new DeliveryPersonInfo.fromJson(json['PickupPersonInfo'])
    //     : null;
  }


}

class DeliveryPincodes {
  String? areaName;
  String? pincode;

  DeliveryPincodes({this.areaName, this.pincode});

  DeliveryPincodes.fromJson(Map<String, dynamic> json) {
    areaName = json['area_name'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area_name'] = this.areaName;
    data['pincode'] = this.pincode;
    return data;
  }
}

class Service {
  String? name;
  String? banner;

  Service({this.name, this.banner});

  Service.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['banner'] = this.banner;
    return data;
  }
}

class Customer {
  String? customerId;
  String? firstname;
  String? lastname;
  String? email;
  String? mobile;
  String? status;
  String? availBalance;
  String? accountType;
  String? emailVerified;
  String? emailVerifiedOn;
  String? emailVerificationCode;
  String? mobileVerified;
  String? mobileVerifiedOn;
  String? mobileVerificationCode;
  String? regSource;
  String? fromIp;
  String? noMinWalletCheck;
  String? bypassOrderLimitCheck;
  String? totalMembers;
  String? pickupFreq;
  String? customerOf;
  String? generalComments;
  String? companyName;
  String? gstNo;
  String? createdBy;
  String? customerInstructions;
  String? isCorporateCustomer;
  String? optForAutoDebit;
  String? createdOn;
  String? lastModifiedOn;

  Customer(
      {this.customerId,
      this.firstname,
      this.lastname,
      this.email,
      this.mobile,
      this.status,
      this.availBalance,
      this.accountType,
      this.emailVerified,
      this.emailVerifiedOn,
      this.emailVerificationCode,
      this.mobileVerified,
      this.mobileVerifiedOn,
      this.mobileVerificationCode,
      this.regSource,
      this.fromIp,
      this.noMinWalletCheck,
      this.bypassOrderLimitCheck,
      this.totalMembers,
      this.pickupFreq,
      this.customerOf,
      this.generalComments,
      this.companyName,
      this.gstNo,
      this.createdBy,
      this.customerInstructions,
      this.isCorporateCustomer,
      this.optForAutoDebit,
      this.createdOn,
      this.lastModifiedOn});

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    firstname = json['firstname'].toString() ?? '';
    lastname = json['lastname'].toString() ?? '';
    email = json['email'];
    mobile = json['mobile'];
    status = json['status'];
    availBalance = json['avail_balance'];
    accountType = json['account_type'].toString();
    emailVerified = json['email_verified'];
    emailVerifiedOn = json['email_verified_on'].toString();
    emailVerificationCode = json['email_verification_code'];
    mobileVerified = json['mobile_verified'].toString();
    mobileVerifiedOn = json['mobile_verified_on'].toString();
    mobileVerificationCode = json['mobile_verification_code'].toString();
    regSource = json['reg_source'];
    fromIp = json['from_ip'];
    noMinWalletCheck = json['no_min_wallet_check'];
    bypassOrderLimitCheck = json['bypass_order_limit_check'];
    totalMembers = json['total_members'];
    pickupFreq = json['pickup_freq'];
    customerOf = json['customer_of'].toString();
    generalComments = json['general_comments'].toString();
    companyName = json['company_name'];
    gstNo = json['gst_no'];
    createdBy = json['created_by'];
    customerInstructions = json['customer_instructions'];
    isCorporateCustomer = json['is_corporate_customer'];
    optForAutoDebit = json['opt_for_auto_debit'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['status'] = this.status;
    data['avail_balance'] = this.availBalance;
    data['account_type'] = this.accountType;
    data['email_verified'] = this.emailVerified;
    data['email_verified_on'] = this.emailVerifiedOn;
    data['email_verification_code'] = this.emailVerificationCode;
    data['mobile_verified'] = this.mobileVerified;
    data['mobile_verified_on'] = this.mobileVerifiedOn;
    data['mobile_verification_code'] = this.mobileVerificationCode;
    data['reg_source'] = this.regSource;
    data['from_ip'] = this.fromIp;
    data['no_min_wallet_check'] = this.noMinWalletCheck;
    data['bypass_order_limit_check'] = this.bypassOrderLimitCheck;
    data['total_members'] = this.totalMembers;
    data['pickup_freq'] = this.pickupFreq;
    data['customer_of'] = this.customerOf;
    data['general_comments'] = this.generalComments;
    data['company_name'] = this.companyName;
    data['gst_no'] = this.gstNo;
    data['created_by'] = this.createdBy;
    data['customer_instructions'] = this.customerInstructions;
    data['is_corporate_customer'] = this.isCorporateCustomer;
    data['opt_for_auto_debit'] = this.optForAutoDebit;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    return data;
  }
}

class DeliveryTimeSlot {
  int? startsOn;
  int? endsOn;

  DeliveryTimeSlot({this.startsOn, this.endsOn});

  DeliveryTimeSlot.fromJson(Map<String, dynamic> json) {
    startsOn = json['starts_on'];
    endsOn = json['ends_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['starts_on'] = this.startsOn;
    data['ends_on'] = this.endsOn;
    return data;
  }
}

class OrderType {
  String? typeName;
  int? allowUserToChooseGarments;
  String? minOrdVal;
  int? isInstant;

  OrderType(
      {this.typeName,
      this.allowUserToChooseGarments,
      this.minOrdVal,
      this.isInstant});

  OrderType.fromJson(Map<String, dynamic> json) {
    typeName = json['type_name'];
    allowUserToChooseGarments = json['allow_user_to_choose_garments'];
    minOrdVal = json['min_ord_val'];
    isInstant = json['is_instant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_name'] = this.typeName;
    data['allow_user_to_choose_garments'] = this.allowUserToChooseGarments;
    data['min_ord_val'] = this.minOrdVal;
    data['is_instant'] = this.isInstant;
    return data;
  }
}

class SignIn {
  String? loginId;
  String? customerId;
  String? username;
  String? password;
  String? accessToken;
  String? accessTokenStatus;
  String? verificationCode;
  String? verified;
  String? verifiedOn;
  String? requestCount;
  String? gatewayResponse;
  String? pushId;
  String? device;
  String? isMain;
  String? profileIcon;
  String? externalLogin;
  String? externalSource;
  String? externalId;
  String? createdOn;
  String? lastModifiedOn;
  String? pwdLastModifiedOn;
  String? resetAfter;
  String? optForSmspush;
  String? refCode;
  String? refBy;
  String? currentStateId;
  String? currentCityId;
  String? currentAreaId;
  String? currentVersion;
  String? dob;
  String? anniversary;

  SignIn(
      {this.loginId,
      this.customerId,
      this.username,
      this.password,
      this.accessToken,
      this.accessTokenStatus,
      this.verificationCode,
      this.verified,
      this.verifiedOn,
      this.requestCount,
      this.gatewayResponse,
      this.pushId,
      this.device,
      this.isMain,
      this.profileIcon,
      this.externalLogin,
      this.externalSource,
      this.externalId,
      this.createdOn,
      this.lastModifiedOn,
      this.pwdLastModifiedOn,
      this.resetAfter,
      this.optForSmspush,
      this.refCode,
      this.refBy,
      this.currentStateId,
      this.currentCityId,
      this.currentAreaId,
      this.currentVersion,
      this.dob,
      this.anniversary});

  SignIn.fromJson(Map<String, dynamic> json) {
    loginId = json['login_id'];
    customerId = json['customer_id'];
    username = json['username'];
    password = json['password'];
    accessToken = json['access_token'];
    accessTokenStatus = json['access_token_status'];
    verificationCode = json['verification_code'];
    verified = json['verified'];
    verifiedOn = json['verified_on'];
    requestCount = json['request_count'];
    gatewayResponse = json['gateway_response'];
    pushId = json['push_id'];
    device = json['device'];
    isMain = json['is_main'];
    profileIcon = json['profile_icon'];
    externalLogin = json['external_login'];
    externalSource = json['external_source'].toString();
    externalId = json['external_id'].toString();
    createdOn = json['created_on'].toString();
    lastModifiedOn = json['last_modified_on'].toString();
    pwdLastModifiedOn = json['pwd_last_modified_on'].toString();
    resetAfter = json['reset_after'];
    optForSmspush = json['opt_for_smspush'];
    refCode = json['ref_code'];
    refBy = json['ref_by'];
    currentStateId = json['current_state_id'];
    currentCityId = json['current_city_id'];
    currentAreaId = json['current_area_id'];
    currentVersion = json['current_version'];
    dob = json['dob'].toString();
    anniversary = json['anniversary'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login_id'] = this.loginId;
    data['customer_id'] = this.customerId;
    data['username'] = this.username;
    data['password'] = this.password;
    data['access_token'] = this.accessToken;
    data['access_token_status'] = this.accessTokenStatus;
    data['verification_code'] = this.verificationCode;
    data['verified'] = this.verified;
    data['verified_on'] = this.verifiedOn;
    data['request_count'] = this.requestCount;
    data['gateway_response'] = this.gatewayResponse;
    data['push_id'] = this.pushId;
    data['device'] = this.device;
    data['is_main'] = this.isMain;
    data['profile_icon'] = this.profileIcon;
    data['external_login'] = this.externalLogin;
    data['external_source'] = this.externalSource;
    data['external_id'] = this.externalId;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    data['pwd_last_modified_on'] = this.pwdLastModifiedOn;
    data['reset_after'] = this.resetAfter;
    data['opt_for_smspush'] = this.optForSmspush;
    data['ref_code'] = this.refCode;
    data['ref_by'] = this.refBy;
    data['current_state_id'] = this.currentStateId;
    data['current_city_id'] = this.currentCityId;
    data['current_area_id'] = this.currentAreaId;
    data['current_version'] = this.currentVersion;
    data['dob'] = this.dob;
    data['anniversary'] = this.anniversary;
    return data;
  }
}

class OrderStages {
  int? stageOrder;
  int? orderstageId;
  String? stageTitle;
  String? stageStatus;
  int? assignedToId;
  String? assignedTo;
  String? stagedBy;
  String? stageComments;
  String? stagedOn;
  String? stagedLaston;
  int? customerFeedbackRating;
  String? customerFeedbackComment;
  Null? customerFeedbackReceivedOn;
  String? stageBySepName;
  String? stageBySepPhone;

  OrderStages(
      {this.stageOrder,
      this.orderstageId,
      this.stageTitle,
      this.stageStatus,
      this.assignedToId,
      this.assignedTo,
      this.stagedBy,
      this.stageComments,
      this.stagedOn,
      this.stagedLaston,
      this.customerFeedbackRating,
      this.customerFeedbackComment,
      this.customerFeedbackReceivedOn,
      this.stageBySepName,
      this.stageBySepPhone});

  OrderStages.fromJson(Map<String, dynamic> json) {
    stageOrder = json['stage_order'];
    orderstageId = json['orderstage_id'];
    stageTitle = json['stage_title'];
    stageStatus = json['stage_status'];
    assignedToId = json['assigned_to_id'];
    assignedTo = json['assigned_to'];
    stagedBy = json['staged_by'];
    stageComments = json['stage_comments'];
    stagedOn = json['staged_on'];
    stagedLaston = json['staged_laston'];
    customerFeedbackRating = json['customer_feedback_rating'];
    customerFeedbackComment = json['customer_feedback_comment'];
    customerFeedbackReceivedOn = json['customer_feedback_received_on'];
    stageBySepName = json['stage_by_sep_name'];
    stageBySepPhone = json['stage_by_sep_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stage_order'] = this.stageOrder;
    data['orderstage_id'] = this.orderstageId;
    data['stage_title'] = this.stageTitle;
    data['stage_status'] = this.stageStatus;
    data['assigned_to_id'] = this.assignedToId;
    data['assigned_to'] = this.assignedTo;
    data['staged_by'] = this.stagedBy;
    data['stage_comments'] = this.stageComments;
    data['staged_on'] = this.stagedOn;
    data['staged_laston'] = this.stagedLaston;
    data['customer_feedback_rating'] = this.customerFeedbackRating;
    data['customer_feedback_comment'] = this.customerFeedbackComment;
    data['customer_feedback_received_on'] = this.customerFeedbackReceivedOn;
    data['stage_by_sep_name'] = this.stageBySepName;
    data['stage_by_sep_phone'] = this.stageBySepPhone;
    return data;
  }
}

class OrderBookedBy {
  String? mobile;
  String? name;
  int? id;
  String? pushId;

  OrderBookedBy({this.mobile, this.name, this.id, this.pushId});

  OrderBookedBy.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    name = json['name'];
    id = json['id'];
    pushId = json['push_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['id'] = this.id;
    data['push_id'] = this.pushId;
    return data;
  }
}

class PickupCities {
  String? cityName;

  PickupCities({this.cityName});

  PickupCities.fromJson(Map<String, dynamic> json) {
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_name'] = this.cityName;
    return data;
  }
}

class PickupStates {
  String? stateName;

  PickupStates({this.stateName});

  PickupStates.fromJson(Map<String, dynamic> json) {
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state_name'] = this.stateName;
    return data;
  }
}

class OrderWiseStages {
  int? orderstageId;
  int? orderId;
  int? stageId;
  int? stageStatus;
  String? stageComments;
  int? stagedBy;
  String? barcode;
  int? nextStageId;
  String? lastModifiedOn;
  String? createdOn;
  String? title;
  int? displayOrder;

  OrderWiseStages(
      {this.orderstageId,
      this.orderId,
      this.stageId,
      this.stageStatus,
      this.stageComments,
      this.stagedBy,
      this.barcode,
      this.nextStageId,
      this.lastModifiedOn,
      this.createdOn,
      this.title,
      this.displayOrder});

  OrderWiseStages.fromJson(Map<String, dynamic> json) {
    orderstageId = json['orderstage_id'];
    orderId = json['order_id'];
    stageId = json['stage_id'];
    stageStatus = json['stage_status'];
    stageComments = json['stage_comments'];
    stagedBy = json['staged_by'];
    barcode = json['barcode'];
    nextStageId = json['next_stage_id'];
    lastModifiedOn = json['last_modified_on'];
    createdOn = json['created_on'];
    title = json['title'];
    displayOrder = json['display_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderstage_id'] = this.orderstageId;
    data['order_id'] = this.orderId;
    data['stage_id'] = this.stageId;
    data['stage_status'] = this.stageStatus;
    data['stage_comments'] = this.stageComments;
    data['staged_by'] = this.stagedBy;
    data['barcode'] = this.barcode;
    data['next_stage_id'] = this.nextStageId;
    data['last_modified_on'] = this.lastModifiedOn;
    data['created_on'] = this.createdOn;
    data['title'] = this.title;
    data['display_order'] = this.displayOrder;
    return data;
  }
}

class DeliveryPersonInfo {
  int? personId;
  String? person;
  String? number;
  String? away;
  String? lat;
  String? lon;

  DeliveryPersonInfo(
      {this.personId, this.person, this.number, this.away, this.lat, this.lon});

  DeliveryPersonInfo.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    person = json['person'];
    number = json['number'];
    away = json['away'];
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['person_id'] = this.personId;
    data['person'] = this.person;
    data['number'] = this.number;
    data['away'] = this.away;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}