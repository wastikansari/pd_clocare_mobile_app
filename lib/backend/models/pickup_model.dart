class PickupModel {
  bool? success;
  Data? data;

  PickupModel({this.success, this.data});

  PickupModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Items>? items;
  Links? lLinks;
  Meta? mMeta;

  Data({this.items, this.lLinks, this.mMeta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
    mMeta = json['_meta'] != null ? Meta.fromJson(json['_meta']) : null;
  }
}

class Items {
  int? orderId;
  String? orderDisplayId;
  int? customerId;
  int? serviceId;
  String? pickupDate;
  int? pickupSlotId;
  String? deliveryDate;
  int? deliverySlotId;
  int? ordertypeId;
  String? orderTotal;
  String? orderSubTotal;
  String? orderAmount;
  String? orderTaxes;
  String? orderOutstandingAmount;
  int? totalItems;
  int? totalRcvdItems;
  int? totalDlvrdItems;
  String? comments;
  int? pickupaddressId;
  int? deliveryaddressId;
  String? sameAs;
  String? pickupFlatNo;
  String? pickupStreet;
  String? pickupLandmark;
  int? pickupStateId;
  int? pickupCityId;
  int? pickupPincodeId;
  String? deliveryFlatNo;
  String? deliveryStreet;
  String? deliveryLandmark;
  int? deliveryStateId;
  int? deliveryCityId;
  int? deliveryPincodeId;

  int? orderBookedBy;

  int? status;
  int? cancelled;

  String? cancelledBy;
  int? cancelledById;
  int? initialAssignedTo;
  int? deliveryAssignedTo;
  int? extraPay;
  int? extraPaidAmount;
  String? extraPaidOn;
  int? extraPaidBy;
  int? isFeedbackRcvd;
  int? isMarkedAsAutoFeedback;
  // int? isPickedup;
  // int? isProcessed;
  // int? isDelivered;
  int? isCollectedInPerson;
  int? isAutoRouted;
  int? isRefunded;
  String? refundedAmount;
  int? isRepeated;
  String? rateMultiplier;
  int? isPaidToVendor;
  int? isPayableCalculated;
  int? deliveryAttempts;
  int? pickupAttempts;
  int? isInvoiceGenerated;
  String? additionalCharges;
  int? isProformaInvoiceGenerated;
  String? originSource;
  String? refDiscount;
  int? isBillGenerated;
  int? isGeneratedByScheduler;
  int? monthlySubscription;
  int? parentOrderId;
  String? additionalDiscount;
  String? additionalDiscountAmount;
  int? specialDiscount;
  String? additionalCb;
  String? additionalCbAmount;
  String? specialDiscountAmount;
  String? specialComment;
  int? isDonation;
  String? prefPickupTimeCharge;
  String? prefDeliveryTimeCharge;
  int? hasPrefPickupTime;
  int? hasPrefDeliveryTime;
  int? needsVerification;
  int? verifiedBy;
  String? verifiedOn;
  int? verifiedByResponsiblePerson;
  int? isLf;
  int? isQuicklyPickedup;
  String? createdOn;
  String? lastModifiedOn;
  String? orderTaxableAmount;
  int? relatedCenterId;
  int? isReturnedOrder;
  int? totalReturnedCount;
  String? deliveryPackPrice;
  int? deliveryPackExtraIncluded;
  int? isRegular;
  int? isSeniorCitizens;
  int? isCovidPatients;
  String? covidPatientAmount;
  int? isCovidCenters;
  String? cancellationCharges;
  int? cancellationChargesPay;
  String? rescheduleCharges;
  int? holdAmount;
  int? payOnPickup;
  String? deliveryCharges;
  String? formattedPickupAddress;
  String? formattedDeliveryAddress;
  List<OrderStages>? orderStages;
  // bool? isPickedUp;
  int? processedPercentage;
  String? ordCurrentStgStatus;
  String? markedAsNotOk;

  Items({
    this.orderId,
    this.orderDisplayId,
    this.customerId,
    this.serviceId,
    this.pickupDate,
    this.pickupSlotId,
    this.deliveryDate,
    this.deliverySlotId,
    this.ordertypeId,
    this.orderTotal,
    this.orderSubTotal,
    this.orderAmount,
    this.orderTaxes,
    this.orderOutstandingAmount,
    this.totalItems,
    this.totalRcvdItems,
    this.totalDlvrdItems,
    this.comments,
    this.pickupaddressId,
    this.deliveryaddressId,
    this.sameAs,
    this.pickupFlatNo,
    this.pickupStreet,
    this.pickupLandmark,
    this.pickupStateId,
    this.pickupCityId,
    this.pickupPincodeId,
    this.deliveryFlatNo,
    this.deliveryStreet,
    this.deliveryLandmark,
    this.deliveryStateId,
    this.deliveryCityId,
    this.deliveryPincodeId,
    this.orderBookedBy,
    this.status,
    this.cancelled,
    this.cancelledBy,
    this.cancelledById,
    this.initialAssignedTo,
    this.deliveryAssignedTo,
    this.extraPay,
    this.extraPaidAmount,
    this.extraPaidOn,
    this.extraPaidBy,
    this.isFeedbackRcvd,
    this.isMarkedAsAutoFeedback,
    // this.isPickedup,
    // this.isProcessed,
    // this.isDelivered,
    this.isCollectedInPerson,
    this.isAutoRouted,
    this.isRefunded,
    this.refundedAmount,
    this.isRepeated,
    this.rateMultiplier,
    this.isPaidToVendor,
    this.isPayableCalculated,
    this.deliveryAttempts,
    this.pickupAttempts,
    this.isInvoiceGenerated,
    this.additionalCharges,
    this.isProformaInvoiceGenerated,
    this.originSource,
    this.refDiscount,
    this.isBillGenerated,
    this.isGeneratedByScheduler,
    this.monthlySubscription,
    this.parentOrderId,
    this.additionalDiscount,
    this.additionalDiscountAmount,
    this.specialDiscount,
    this.additionalCb,
    this.additionalCbAmount,
    this.specialDiscountAmount,
    this.specialComment,
    this.isDonation,
    this.prefPickupTimeCharge,
    this.prefDeliveryTimeCharge,
    this.hasPrefPickupTime,
    this.hasPrefDeliveryTime,
    this.needsVerification,
    this.verifiedBy,
    this.verifiedOn,
    this.verifiedByResponsiblePerson,
    this.isLf,
    this.isQuicklyPickedup,
    this.createdOn,
    this.lastModifiedOn,
    this.orderTaxableAmount,
    this.relatedCenterId,
    this.isReturnedOrder,
    this.totalReturnedCount,
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
    this.formattedPickupAddress,
    this.formattedDeliveryAddress,
    this.orderStages,
    // this.isPickedUp,
    this.processedPercentage,
    this.ordCurrentStgStatus,
    this.markedAsNotOk,
  });

  Items.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderDisplayId = json['order_display_id'];
    customerId = json['customer_id'];
    serviceId = json['service_id'];
    pickupDate = json['pickup_date'];
    pickupSlotId = json['pickup_slot_id'];

    deliveryDate = json['delivery_date'];
    deliverySlotId = json['delivery_slot_id'];

    ordertypeId = json['ordertype_id'];
    orderTotal = json['order_total'];
    orderSubTotal = json['order_sub_total'];
    orderAmount = json['order_amount'];
    orderTaxes = json['order_taxes'];
    orderOutstandingAmount = json['order_outstanding_amount'];
    totalItems = json['total_items'];
    totalRcvdItems = json['total_rcvd_items'];
    totalDlvrdItems = json['total_dlvrd_items'];
    comments = json['comments'];
    pickupaddressId = json['pickupaddress_id'];
    deliveryaddressId = json['deliveryaddress_id'];
    sameAs = json['same_as'];
    pickupFlatNo = json['pickup_flat_no'];
    pickupStreet = json['pickup_street'];
    pickupLandmark = json['pickup_landmark'];
    pickupStateId = json['pickup_state_id'];
    pickupCityId = json['pickup_city_id'];
    pickupPincodeId = json['pickup_pincode_id'];

    deliveryFlatNo = json['delivery_flat_no'];
    deliveryStreet = json['delivery_street'];
    deliveryLandmark = json['delivery_landmark'];
    deliveryStateId = json['delivery_state_id'];
    deliveryCityId = json['delivery_city_id'];
    deliveryPincodeId = json['delivery_pincode_id'];

    orderBookedBy = json['order_booked_by'];

    status = json['status'];
    cancelled = json['cancelled'];

    cancelledBy = json['cancelled_by'];
    cancelledById = json['cancelled_by_id'];
    initialAssignedTo = json['initial_assigned_to'];
    deliveryAssignedTo = json['delivery_assigned_to'];
    extraPay = json['extra_pay'];
    extraPaidAmount = json['extra_paid_amount'];
    extraPaidOn = json['extra_paid_on'];
    extraPaidBy = json['extra_paid_by'];
    isFeedbackRcvd = json['is_feedback_rcvd'];
    isMarkedAsAutoFeedback = json['is_marked_as_auto_feedback'];

    // isPickedup = json['is_pickedup'];
    // isProcessed = json['is_processed'];
    // isDelivered = json['is_delivered'];
    isCollectedInPerson = json['is_collected_in_person'];
    isAutoRouted = json['is_auto_routed'];
    isRefunded = json['is_refunded'];
    refundedAmount = json['refunded_amount'];

    isRepeated = json['is_repeated'];
    rateMultiplier = json['rate_multiplier'];
    isPaidToVendor = json['is_paid_to_vendor'];
    isPayableCalculated = json['is_payable_calculated'];
    deliveryAttempts = json['delivery_attempts'];
    pickupAttempts = json['pickup_attempts'];
    isInvoiceGenerated = json['is_invoice_generated'];

    additionalCharges = json['additional_charges'];
    isProformaInvoiceGenerated = json['is_proforma_invoice_generated'];

    originSource = json['origin_source'];

    refDiscount = json['ref_discount'];

    isBillGenerated = json['is_bill_generated'];

    isGeneratedByScheduler = json['is_generated_by_scheduler'];
    monthlySubscription = json['monthly_subscription'];
    parentOrderId = json['parent_order_id'];
    additionalDiscount = json['additional_discount'];

    additionalDiscountAmount = json['additional_discount_amount'];
    specialDiscount = json['special_discount'];
    additionalCb = json['additional_cb'];

    additionalCbAmount = json['additional_cb_amount'];

    specialDiscountAmount = json['special_discount_amount'];
    specialComment = json['special_comment'];
    isDonation = json['is_donation'];
    prefPickupTimeCharge = json['pref_pickup_time_charge'];
    prefDeliveryTimeCharge = json['pref_delivery_time_charge'];
    hasPrefPickupTime = json['has_pref_pickup_time'];
    hasPrefDeliveryTime = json['has_pref_delivery_time'];
    needsVerification = json['needs_verification'];
    verifiedBy = json['verified_by'];
    verifiedOn = json['verified_on'];
    verifiedByResponsiblePerson = json['verified_by_responsible_person'];
    isLf = json['is_lf'];
    isQuicklyPickedup = json['is_quickly_pickedup'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];

    orderTaxableAmount = json['order_taxable_amount'];
    relatedCenterId = json['related_center_id'];
    isReturnedOrder = json['is_returned_order'];

    totalReturnedCount = json['total_returned_count'];

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
    formattedPickupAddress = json['formatted_pickup_address'];
    formattedDeliveryAddress = json['formatted_delivery_address'];
    if (json['order_stages'] != null) {
      orderStages = <OrderStages>[];
      json['order_stages'].forEach((v) {
        orderStages!.add(new OrderStages.fromJson(v));
      });
    }
    // // isPickedUp = json['isPickedUp'];
    // // isProcessed = json['isProcessed'];
    // // isDelivered = json['isDelivered'];
    processedPercentage = json['processed_percentage'];
    ordCurrentStgStatus = json['ord_current_stg_status'];

    markedAsNotOk = json['marked_as_not_ok'];
  }
}

class OrderStages {
  int? stageOrder;
  int? orderstageId;
  String? stageTitle;
  String? stageStatus;
  // int? assignedToId;
  String? assignedTo;
  String? stagedBy;

  String? stagedOn;
  String? stagedLaston;
  // int? customerFeedbackRating;
  String? customerFeedbackComment;
  String? customerFeedbackReceivedOn;
  String? stageBySepName;
  String? stageBySepPhone;
  String? stageComment;

  OrderStages(
      {this.stageOrder,
      this.orderstageId,
      this.stageTitle,
      this.stageStatus,
      // this.assignedToId,
      this.assignedTo,
      this.stagedBy,
      this.stagedOn,
      this.stagedLaston,
      // this.customerFeedbackRating,
      this.customerFeedbackComment,
      this.customerFeedbackReceivedOn,
      this.stageBySepName,
      this.stageBySepPhone,
      this.stageComment});

  OrderStages.fromJson(Map<String, dynamic> json) {
    stageOrder = json['stage_order'];
    orderstageId = json['orderstage_id'];
    stageTitle = json['stage_title'];
    stageStatus = json['stage_status'];
    // assignedToId = json['assigned_to_id'];
    assignedTo = json['assigned_to'];
    stagedBy = json['staged_by'];

    stagedOn = json['staged_on'];
    stagedLaston = json['staged_laston'];
    // customerFeedbackRating = json['customer_feedback_rating'];
    customerFeedbackComment = json['customer_feedback_comment'];
    customerFeedbackReceivedOn = json['customer_feedback_received_on'];
    stageBySepName = json['stage_by_sep_name'];
    stageBySepPhone = json['stage_by_sep_phone'];
    stageComment = json['stage_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stage_order'] = this.stageOrder;
    data['orderstage_id'] = this.orderstageId;
    data['stage_title'] = this.stageTitle;
    data['stage_status'] = this.stageStatus;
    // data['assigned_to_id'] = this.assignedToId;
    data['assigned_to'] = this.assignedTo;
    data['staged_by'] = this.stagedBy;

    data['staged_on'] = this.stagedOn;
    data['staged_laston'] = this.stagedLaston;
    // data['customer_feedback_rating'] = this.customerFeedbackRating;
    data['customer_feedback_comment'] = this.customerFeedbackComment;
    data['customer_feedback_received_on'] = this.customerFeedbackReceivedOn;
    data['stage_by_sep_name'] = this.stageBySepName;
    data['stage_by_sep_phone'] = this.stageBySepPhone;
    data['stage_comment'] = this.stageComment;
    return data;
  }
}

class Links {
  Self? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.toJson();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Meta {
  int? totalCount;
  int? pageCount;
  int? currentPage;
  int? perPage;

  Meta({this.totalCount, this.pageCount, this.currentPage, this.perPage});

  Meta.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    pageCount = json['pageCount'];
    currentPage = json['currentPage'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['pageCount'] = this.pageCount;
    data['currentPage'] = this.currentPage;
    data['perPage'] = this.perPage;
    return data;
  }
}
