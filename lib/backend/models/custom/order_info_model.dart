class OrderInfoModel {
  String? additionalCharges;
  String? additionalDiscount;
  String? additionalDiscountAmount;
  int? cancelled;
  String? cancelledBy;
  int? cancelledById;
  String? comments;
  String? createdOn;
  int? customerId;
  int? deliveryAssignedTo;
  int? deliveryAttempts;
  DeliveryCities? deliveryCities;
  int? deliveryCityId;
  String? deliveryDate;
  String? deliveryFlatNo;
  String? deliveryLandmark;
  int? deliveryPincodeId;
  DeliveryPincodes? deliveryPincodes;
  int? deliverySlotId;
  int? deliveryStateId;
  DeliveryStates? deliveryStates;
  String? deliveryStreet;
  DeliveryTimeSlot? deliveryTimeSlot;
  int? deliveryaddressId;
  int? extraPaidAmount;
  int? extraPaidBy;
  String? extraPaidOn;
  int? extraPay;
  String? formattedDeliveryAddress;
  String? formattedPickupAddress;
  int? hasPrefDeliveryTime;
  int? hasPrefPickupTime;
  int? initialAssignedTo;
  int? isAutoRouted;
  int? isBillGenerated;
  int? isCollectedInPerson;
  bool? isDelivered;
  int? isDonation;
  int? isFeedbackRcvd;
  int? isGeneratedByScheduler;
  int? isInvoiceGenerated;
  int? isLf;
  int? isMarkedAsAutoFeedback;
  int? isPaidToVendor;
  int? isPayableCalculated;
  bool? isPickedUp;
  bool? isProcessed;
  int? isProformaInvoiceGenerated;
  int? isQuicklyPickedup;
  int? isRefunded;
  int? isRepeated;
  int? isDelivereds;
  int? isPickedup;
  int? isProcesseds;
  int? isSubscribed;
  String? lastModifiedOn;
  int? monthlySubscription;
  int? needsVerification;
  String? orderAmount;
  OrderBookedBy? orderBookedBy;
  String? orderDisplayId;
  int? orderId;
  List? orderItems;
  String? orderOutstandingAmount;
  List<OrderStages>? orderStages;
  String? orderSubTotal;
  String? orderTaxes;
  String? orderTotal;
  OrderType? orderType;
  List<OrderWiseStages>? orderWiseStages;
  int? orderBookedBys;
  int? ordertypeId;
  String? originSource;
  int? parentOrderId;
  int? payLater;
  int? pickupAttempts;
  DeliveryCities? pickupCities;
  int? pickupCityId;
  String? pickupDate;
  String? pickupFlatNo;
  String? pickupLandmark;
  PickupPersonInfo? pickupPersonInfo;
  int? pickupPincodeId;
  DeliveryPincodes? pickupPincodes;
  int? pickupSlotId;
  int? pickupStateId;
  DeliveryStates? pickupStates;
  String? pickupStreet;
  int? pickupaddressId;
  String? prefPickupTimeCharge;
  String? rateMultiplier;
  String? refDiscount;
  String? refundedAmount;
  String? sameAs;
  Service? service;
  int? serviceId;
  String? specialComment;
  int? specialDiscount;
  String? specialDiscountAmount;
  String? stageComments;
  String? status;
  List<Null>? taxes;
  DeliveryTimeSlot? timeSlot;
  int? totalDlvrdItems;
  int? totalItems;
  int? totalRcvdItems;

  OrderInfoModel(
      {this.additionalCharges,
      this.additionalDiscount,
      this.additionalDiscountAmount,
      this.cancelled,
      this.cancelledBy,
      this.cancelledById,
      this.comments,
      this.createdOn,
      this.customerId,
      this.deliveryAssignedTo,
      this.deliveryAttempts,
      this.deliveryCities,
      this.deliveryCityId,
      this.deliveryDate,
      this.deliveryFlatNo,
      this.deliveryLandmark,
      this.deliveryPincodeId,
      this.deliveryPincodes,
      this.deliverySlotId,
      this.deliveryStateId,
      this.deliveryStates,
      this.deliveryStreet,
      this.deliveryTimeSlot,
      this.deliveryaddressId,
      this.extraPaidAmount,
      this.extraPaidBy,
      this.extraPaidOn,
      this.extraPay,
      this.formattedDeliveryAddress,
      this.formattedPickupAddress,
      this.hasPrefDeliveryTime,
      this.hasPrefPickupTime,
      this.initialAssignedTo,
      this.isAutoRouted,
      this.isBillGenerated,
      this.isCollectedInPerson,
      this.isDelivered,
      this.isDonation,
      this.isFeedbackRcvd,
      this.isGeneratedByScheduler,
      this.isInvoiceGenerated,
      this.isLf,
      this.isMarkedAsAutoFeedback,
      this.isPaidToVendor,
      this.isPayableCalculated,
      this.isPickedUp,
      this.isProcessed,
      this.isProformaInvoiceGenerated,
      this.isQuicklyPickedup,
      this.isRefunded,
      this.isRepeated,
      this.isDelivereds,
      this.isPickedup,
      this.isProcesseds,
      this.isSubscribed,
      this.lastModifiedOn,
      this.monthlySubscription,
      this.needsVerification,
      this.orderAmount,
      this.orderBookedBy,
      this.orderDisplayId,
      this.orderId,
      this.orderItems,
      this.orderOutstandingAmount,
      this.orderStages,
      this.orderSubTotal,
      this.orderTaxes,
      this.orderTotal,
      this.orderType,
      this.orderWiseStages,
      this.orderBookedBys,
      this.ordertypeId,
      this.originSource,
      this.parentOrderId,
      this.payLater,
      this.pickupAttempts,
      this.pickupCities,
      this.pickupCityId,
      this.pickupDate,
      this.pickupFlatNo,
      this.pickupLandmark,
      this.pickupPersonInfo,
      this.pickupPincodeId,
      this.pickupPincodes,
      this.pickupSlotId,
      this.pickupStateId,
      this.pickupStates,
      this.pickupStreet,
      this.pickupaddressId,
      this.prefPickupTimeCharge,
      this.rateMultiplier,
      this.refDiscount,
      this.refundedAmount,
      this.sameAs,
      this.service,
      this.serviceId,
      this.specialComment,
      this.specialDiscount,
      this.specialDiscountAmount,
      this.stageComments,
      this.status,
      this.taxes,
      this.timeSlot,
      this.totalDlvrdItems,
      this.totalItems,
      this.totalRcvdItems});

  OrderInfoModel.fromJson(Map<String, dynamic> json) {
    additionalCharges = json['additional_charges'];
    additionalDiscount = json['additional_discount'];
    additionalDiscountAmount = json['additional_discount_amount'];
    cancelled = json['cancelled'];
    cancelledBy = json['cancelled_by'];
    cancelledById = json['cancelled_by_id'];
    comments = json['comments'];
    createdOn = json['created_on'];
    customerId = json['customer_id'];
    deliveryAssignedTo = json['delivery_assigned_to'];
    deliveryAttempts = json['delivery_attempts'];
    deliveryCities = json['deliveryCities'] != null
        ? new DeliveryCities.fromJson(json['deliveryCities'])
        : null;
    deliveryCityId = json['delivery_city_id'];
    deliveryDate = json['delivery_date'];
    deliveryFlatNo = json['delivery_flat_no'];
    deliveryLandmark = json['delivery_landmark'];
    deliveryPincodeId = json['delivery_pincode_id'];
    deliveryPincodes = json['deliveryPincodes'] != null
        ? new DeliveryPincodes.fromJson(json['deliveryPincodes'])
        : null;
    deliverySlotId = json['delivery_slot_id'];
    deliveryStateId = json['delivery_state_id'];
    deliveryStates = json['deliveryStates'] != null
        ? new DeliveryStates.fromJson(json['deliveryStates'])
        : null;
    deliveryStreet = json['delivery_street'];
    deliveryTimeSlot = json['deliveryTimeSlot'] != null
        ? new DeliveryTimeSlot.fromJson(json['deliveryTimeSlot'])
        : null;
    deliveryaddressId = json['deliveryaddress_id'];
    extraPaidAmount = json['extra_paid_amount'];
    extraPaidBy = json['extra_paid_by'];
    extraPaidOn = json['extra_paid_on'];
    extraPay = json['extra_pay'];
    formattedDeliveryAddress = json['formatted_delivery_address'];
    formattedPickupAddress = json['formatted_pickup_address'];
    hasPrefDeliveryTime = json['has_pref_delivery_time'];
    hasPrefPickupTime = json['has_pref_pickup_time'];
    initialAssignedTo = json['initial_assigned_to'];
    isAutoRouted = json['is_auto_routed'];
    isBillGenerated = json['is_bill_generated'];
    isCollectedInPerson = json['is_collected_in_person'];
    isDelivered = json['isDelivered'];
    isDonation = json['is_donation'];
    isFeedbackRcvd = json['is_feedback_rcvd'];
    isGeneratedByScheduler = json['is_generated_by_scheduler'];
    isInvoiceGenerated = json['is_invoice_generated'];
    isLf = json['is_lf'];
    isMarkedAsAutoFeedback = json['is_marked_as_auto_feedback'];
    isPaidToVendor = json['is_paid_to_vendor'];
    isPayableCalculated = json['is_payable_calculated'];
    isPickedUp = json['isPickedUp'];
    isProcessed = json['isProcessed'];
    isProformaInvoiceGenerated = json['is_proforma_invoice_generated'];
    isQuicklyPickedup = json['is_quickly_pickedup'];
    isRefunded = json['is_refunded'];
    isRepeated = json['is_repeated'];
    isDelivered = json['is_delivered'];
    isPickedup = json['is_pickedup'];
    isProcessed = json['is_processed'];
    isSubscribed = json['is_subscribed'];
    lastModifiedOn = json['last_modified_on'];
    monthlySubscription = json['monthly_subscription'];
    needsVerification = json['needs_verification'];
    orderAmount = json['order_amount'];
    orderBookedBy = json['orderBookedBy'] != null
        ? new OrderBookedBy.fromJson(json['orderBookedBy'])
        : null;
    orderDisplayId = json['order_display_id'];
    orderId = json['order_id'];
    if (json['orderItems'] != null) {
      orderItems = <Null>[];
      // json['orderItems'].forEach((v) {
      //   orderItems!.add(new Null.fromJson(v));
      // });
    }
    orderOutstandingAmount = json['order_outstanding_amount'];
    if (json['order_stages'] != null) {
      orderStages = <OrderStages>[];
      json['order_stages'].forEach((v) {
        orderStages!.add(new OrderStages.fromJson(v));
      });
    }
    orderSubTotal = json['order_sub_total'];
    orderTaxes = json['order_taxes'];
    orderTotal = json['order_total'];
    orderType = json['orderType'] != null
        ? new OrderType.fromJson(json['orderType'])
        : null;
    if (json['orderWiseStages'] != null) {
      orderWiseStages = <OrderWiseStages>[];
      json['orderWiseStages'].forEach((v) {
        orderWiseStages!.add(new OrderWiseStages.fromJson(v));
      });
    }
    orderBookedBys = json['order_booked_by'];
    ordertypeId = json['ordertype_id'];
    originSource = json['origin_source'];
    parentOrderId = json['parent_order_id'];
    payLater = json['payLater'];
    pickupAttempts = json['pickup_attempts'];
    pickupCities = json['pickupCities'] != null
        ? new DeliveryCities.fromJson(json['pickupCities'])
        : null;
    pickupCityId = json['pickup_city_id'];
    pickupDate = json['pickup_date'];
    pickupFlatNo = json['pickup_flat_no'];
    pickupLandmark = json['pickup_landmark'];
    pickupPersonInfo = json['PickupPersonInfo'] != null
        ? new PickupPersonInfo.fromJson(json['PickupPersonInfo'])
        : null;
    pickupPincodeId = json['pickup_pincode_id'];
    pickupPincodes = json['pickupPincodes'] != null
        ? new DeliveryPincodes.fromJson(json['pickupPincodes'])
        : null;
    pickupSlotId = json['pickup_slot_id'];
    pickupStateId = json['pickup_state_id'];
    pickupStates = json['pickupStates'] != null
        ? new DeliveryStates.fromJson(json['pickupStates'])
        : null;
    pickupStreet = json['pickup_street'];
    pickupaddressId = json['pickupaddress_id'];
    prefPickupTimeCharge = json['pref_pickup_time_charge'];
    rateMultiplier = json['rate_multiplier'];
    refDiscount = json['ref_discount'];
    refundedAmount = json['refunded_amount'];
    sameAs = json['same_as'];
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    serviceId = json['service_id'];
    specialComment = json['special_comment'];
    specialDiscount = json['special_discount'];
    specialDiscountAmount = json['special_discount_amount'];
    stageComments = json['stage_comments'];
    status = json['status'];
    if (json['taxes'] != null) {
      taxes = <Null>[];
      // json['taxes'].forEach((v) {
      //   taxes!.add(new Null.fromJson(v));
      // });
    }
    timeSlot = json['timeSlot'] != null
        ? new DeliveryTimeSlot.fromJson(json['timeSlot'])
        : null;
    totalDlvrdItems = json['total_dlvrd_items'];
    totalItems = json['total_items'];
    totalRcvdItems = json['total_rcvd_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additional_charges'] = this.additionalCharges;
    data['additional_discount'] = this.additionalDiscount;
    data['additional_discount_amount'] = this.additionalDiscountAmount;
    data['cancelled'] = this.cancelled;
    data['cancelled_by'] = this.cancelledBy;
    data['cancelled_by_id'] = this.cancelledById;
    data['comments'] = this.comments;
    data['created_on'] = this.createdOn;
    data['customer_id'] = this.customerId;
    data['delivery_assigned_to'] = this.deliveryAssignedTo;
    data['delivery_attempts'] = this.deliveryAttempts;
    if (this.deliveryCities != null) {
      data['deliveryCities'] = this.deliveryCities!.toJson();
    }
    data['delivery_city_id'] = this.deliveryCityId;
    data['delivery_date'] = this.deliveryDate;
    data['delivery_flat_no'] = this.deliveryFlatNo;
    data['delivery_landmark'] = this.deliveryLandmark;
    data['delivery_pincode_id'] = this.deliveryPincodeId;
    if (this.deliveryPincodes != null) {
      data['deliveryPincodes'] = this.deliveryPincodes!.toJson();
    }
    data['delivery_slot_id'] = this.deliverySlotId;
    data['delivery_state_id'] = this.deliveryStateId;
    if (this.deliveryStates != null) {
      data['deliveryStates'] = this.deliveryStates!.toJson();
    }
    data['delivery_street'] = this.deliveryStreet;
    if (this.deliveryTimeSlot != null) {
      data['deliveryTimeSlot'] = this.deliveryTimeSlot!.toJson();
    }
    data['deliveryaddress_id'] = this.deliveryaddressId;
    data['extra_paid_amount'] = this.extraPaidAmount;
    data['extra_paid_by'] = this.extraPaidBy;
    data['extra_paid_on'] = this.extraPaidOn;
    data['extra_pay'] = this.extraPay;
    data['formatted_delivery_address'] = this.formattedDeliveryAddress;
    data['formatted_pickup_address'] = this.formattedPickupAddress;
    data['has_pref_delivery_time'] = this.hasPrefDeliveryTime;
    data['has_pref_pickup_time'] = this.hasPrefPickupTime;
    data['initial_assigned_to'] = this.initialAssignedTo;
    data['is_auto_routed'] = this.isAutoRouted;
    data['is_bill_generated'] = this.isBillGenerated;
    data['is_collected_in_person'] = this.isCollectedInPerson;
    data['isDelivered'] = this.isDelivered;
    data['is_donation'] = this.isDonation;
    data['is_feedback_rcvd'] = this.isFeedbackRcvd;
    data['is_generated_by_scheduler'] = this.isGeneratedByScheduler;
    data['is_invoice_generated'] = this.isInvoiceGenerated;
    data['is_lf'] = this.isLf;
    data['is_marked_as_auto_feedback'] = this.isMarkedAsAutoFeedback;
    data['is_paid_to_vendor'] = this.isPaidToVendor;
    data['is_payable_calculated'] = this.isPayableCalculated;
    data['isPickedUp'] = this.isPickedUp;
    data['isProcessed'] = this.isProcessed;
    data['is_proforma_invoice_generated'] = this.isProformaInvoiceGenerated;
    data['is_quickly_pickedup'] = this.isQuicklyPickedup;
    data['is_refunded'] = this.isRefunded;
    data['is_repeated'] = this.isRepeated;
    data['is_delivered'] = this.isDelivered;
    data['is_pickedup'] = this.isPickedup;
    data['is_processed'] = this.isProcessed;
    data['is_subscribed'] = this.isSubscribed;
    data['last_modified_on'] = this.lastModifiedOn;
    data['monthly_subscription'] = this.monthlySubscription;
    data['needs_verification'] = this.needsVerification;
    data['order_amount'] = this.orderAmount;
    if (this.orderBookedBy != null) {
      data['orderBookedBy'] = this.orderBookedBy!.toJson();
    }
    data['order_display_id'] = this.orderDisplayId;
    data['order_id'] = this.orderId;
    if (this.orderItems != null) {
      data['orderItems'] = orderItems!.map((v) => v!.toJson()).toList();
    }
    data['order_outstanding_amount'] = this.orderOutstandingAmount;
    if (this.orderStages != null) {
      data['order_stages'] = this.orderStages!.map((v) => v.toJson()).toList();
    }
    data['order_sub_total'] = this.orderSubTotal;
    data['order_taxes'] = this.orderTaxes;
    data['order_total'] = this.orderTotal;
    if (this.orderType != null) {
      data['orderType'] = this.orderType!.toJson();
    }
    if (this.orderWiseStages != null) {
      data['orderWiseStages'] =
          this.orderWiseStages!.map((v) => v.toJson()).toList();
    }
    data['order_booked_by'] = this.orderBookedBy;
    data['ordertype_id'] = this.ordertypeId;
    data['origin_source'] = this.originSource;
    data['parent_order_id'] = this.parentOrderId;
    data['payLater'] = this.payLater;
    data['pickup_attempts'] = this.pickupAttempts;
    if (this.pickupCities != null) {
      data['pickupCities'] = this.pickupCities!.toJson();
    }
    data['pickup_city_id'] = this.pickupCityId;
    data['pickup_date'] = this.pickupDate;
    data['pickup_flat_no'] = this.pickupFlatNo;
    data['pickup_landmark'] = this.pickupLandmark;
    if (this.pickupPersonInfo != null) {
      data['PickupPersonInfo'] = this.pickupPersonInfo!.toJson();
    }
    data['pickup_pincode_id'] = this.pickupPincodeId;
    if (this.pickupPincodes != null) {
      data['pickupPincodes'] = this.pickupPincodes!.toJson();
    }
    data['pickup_slot_id'] = this.pickupSlotId;
    data['pickup_state_id'] = this.pickupStateId;
    if (this.pickupStates != null) {
      data['pickupStates'] = this.pickupStates!.toJson();
    }
    data['pickup_street'] = this.pickupStreet;
    data['pickupaddress_id'] = this.pickupaddressId;
    data['pref_pickup_time_charge'] = this.prefPickupTimeCharge;
    data['rate_multiplier'] = this.rateMultiplier;
    data['ref_discount'] = this.refDiscount;
    data['refunded_amount'] = this.refundedAmount;
    data['same_as'] = this.sameAs;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    data['service_id'] = this.serviceId;
    data['special_comment'] = this.specialComment;
    data['special_discount'] = this.specialDiscount;
    data['special_discount_amount'] = this.specialDiscountAmount;
    data['stage_comments'] = this.stageComments;
    data['status'] = this.status;
    if (this.taxes != null) {
      // data['taxes'] = this.taxes!.map((v) => v!.toJson()).toList();
    }
    if (this.timeSlot != null) {
      data['timeSlot'] = this.timeSlot!.toJson();
    }
    data['total_dlvrd_items'] = this.totalDlvrdItems;
    data['total_items'] = this.totalItems;
    data['total_rcvd_items'] = this.totalRcvdItems;
    return data;
  }
}

class DeliveryCities {
  String? cityName;

  DeliveryCities({this.cityName});

  DeliveryCities.fromJson(Map<String, dynamic> json) {
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_name'] = this.cityName;
    return data;
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

class DeliveryStates {
  String? stateName;

  DeliveryStates({this.stateName});

  DeliveryStates.fromJson(Map<String, dynamic> json) {
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state_name'] = this.stateName;
    return data;
  }
}

class DeliveryTimeSlot {
  int? endsOn;
  int? startsOn;

  DeliveryTimeSlot({this.endsOn, this.startsOn});

  DeliveryTimeSlot.fromJson(Map<String, dynamic> json) {
    endsOn = json['ends_on'];
    startsOn = json['starts_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ends_on'] = this.endsOn;
    data['starts_on'] = this.startsOn;
    return data;
  }
}

class OrderBookedBy {
  int? id;
  String? name;
  String? pushId;

  OrderBookedBy({this.id, this.name, this.pushId});

  OrderBookedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pushId = json['push_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['push_id'] = this.pushId;
    return data;
  }
}

class OrderStages {
  String? assignedTo;
  String? assignedToId;
  String? customerFeedbackComment;
  String? customerFeedbackRating;
  int? orderstageId;
  String? stageBySepName;
  String? stageBySepPhone;
  String? stageComments;
  int? stageOrder;
  String? stageStatus;
  String? stageTitle;
  String? stagedBy;
  String? stagedLaston;
  String? stagedOn;
  String? customerFeedbackReceivedOn;
  String? stageComment;

  OrderStages(
      {this.assignedTo,
      this.assignedToId,
      this.customerFeedbackComment,
      this.customerFeedbackRating,
      this.orderstageId,
      this.stageBySepName,
      this.stageBySepPhone,
      this.stageComments,
      this.stageOrder,
      this.stageStatus,
      this.stageTitle,
      this.stagedBy,
      this.stagedLaston,
      this.stagedOn,
      this.customerFeedbackReceivedOn,
      this.stageComment});

  OrderStages.fromJson(Map<String, dynamic> json) {
    assignedTo = json['assigned_to'];
    assignedToId = json['assigned_to_id'];
    customerFeedbackComment = json['customer_feedback_comment'];
    customerFeedbackRating = json['customer_feedback_rating'];
    orderstageId = json['orderstage_id'];
    stageBySepName = json['stage_by_sep_name'];
    stageBySepPhone = json['stage_by_sep_phone'];
    stageComments = json['stage_comments'];
    stageOrder = json['stage_order'];
    stageStatus = json['stage_status'];
    stageTitle = json['stage_title'];
    stagedBy = json['staged_by'];
    stagedLaston = json['staged_laston'];
    stagedOn = json['staged_on'];
    customerFeedbackReceivedOn = json['customer_feedback_received_on'];
    stageComment = json['stage_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assigned_to'] = this.assignedTo;
    data['assigned_to_id'] = this.assignedToId;
    data['customer_feedback_comment'] = this.customerFeedbackComment;
    data['customer_feedback_rating'] = this.customerFeedbackRating;
    data['orderstage_id'] = this.orderstageId;
    data['stage_by_sep_name'] = this.stageBySepName;
    data['stage_by_sep_phone'] = this.stageBySepPhone;
    data['stage_comments'] = this.stageComments;
    data['stage_order'] = this.stageOrder;
    data['stage_status'] = this.stageStatus;
    data['stage_title'] = this.stageTitle;
    data['staged_by'] = this.stagedBy;
    data['staged_laston'] = this.stagedLaston;
    data['staged_on'] = this.stagedOn;
    data['customer_feedback_received_on'] = this.customerFeedbackReceivedOn;
    data['stage_comment'] = this.stageComment;
    return data;
  }
}

class OrderType {
  int? allowUserToChooseGarments;
  int? isInstant;
  String? minOrdVal;
  String? typeName;

  OrderType(
      {this.allowUserToChooseGarments,
      this.isInstant,
      this.minOrdVal,
      this.typeName});

  OrderType.fromJson(Map<String, dynamic> json) {
    allowUserToChooseGarments = json['allow_user_to_choose_garments'];
    isInstant = json['is_instant'];
    minOrdVal = json['min_ord_val'];
    typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allow_user_to_choose_garments'] = this.allowUserToChooseGarments;
    data['is_instant'] = this.isInstant;
    data['min_ord_val'] = this.minOrdVal;
    data['type_name'] = this.typeName;
    return data;
  }
}

class OrderWiseStages {
  String? createdOn;
  int? displayOrder;
  String? lastModifiedOn;
  int? orderId;
  int? orderstageId;
  String? stageComments;
  int? stageId;
  int? stageStatus;
  String? title;

  OrderWiseStages(
      {this.createdOn,
      this.displayOrder,
      this.lastModifiedOn,
      this.orderId,
      this.orderstageId,
      this.stageComments,
      this.stageId,
      this.stageStatus,
      this.title});

  OrderWiseStages.fromJson(Map<String, dynamic> json) {
    createdOn = json['created_on'];
    displayOrder = json['display_order'];
    lastModifiedOn = json['last_modified_on'];
    orderId = json['order_id'];
    orderstageId = json['orderstage_id'];
    stageComments = json['stage_comments'];
    stageId = json['stage_id'];
    stageStatus = json['stage_status'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_on'] = this.createdOn;
    data['display_order'] = this.displayOrder;
    data['last_modified_on'] = this.lastModifiedOn;
    data['order_id'] = this.orderId;
    data['orderstage_id'] = this.orderstageId;
    data['stage_comments'] = this.stageComments;
    data['stage_id'] = this.stageId;
    data['stage_status'] = this.stageStatus;
    data['title'] = this.title;
    return data;
  }
}

class PickupPersonInfo {
  String? away;
  String? lat;
  String? lon;
  String? number;
  String? person;
  String? personId;

  PickupPersonInfo(
      {this.away, this.lat, this.lon, this.number, this.person, this.personId});

  PickupPersonInfo.fromJson(Map<String, dynamic> json) {
    away = json['away'];
    lat = json['lat'];
    lon = json['lon'];
    number = json['number'];
    person = json['person'];
    personId = json['person_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['away'] = this.away;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['number'] = this.number;
    data['person'] = this.person;
    data['person_id'] = this.personId;
    return data;
  }
}

class Service {
  String? banner;
  String? name;

  Service({this.banner, this.name});

  Service.fromJson(Map<String, dynamic> json) {
    banner = json['banner'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner'] = this.banner;
    data['name'] = this.name;
    return data;
  }
}