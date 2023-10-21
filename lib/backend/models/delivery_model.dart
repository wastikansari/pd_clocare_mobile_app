class DeliveryModel {
  bool? success;
  Data? data;

  DeliveryModel({this.success, this.data});

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    if (mMeta != null) {
      data['_meta'] = mMeta!.toJson();
    }
    return data;
  }
}

class Items {
  int? orderId;
  String? orderDisplayId;
  int? customerId;
  int? serviceId;
  String? pickupDate;
  int? pickupSlotId;
  // Null? prefPickupTime;
  String? deliveryDate;
  int? deliverySlotId;
  // Null? prefDeliveryTime;
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
  // Null? pickupLat;
  // Null? pickupLng;
  String? deliveryFlatNo;
  String? deliveryStreet;
  String? deliveryLandmark;
  int? deliveryStateId;
  int? deliveryCityId;
  int? deliveryPincodeId;
  // Null? deliveryLat;
  // Null? deliveryLng;
  int? orderBookedBy;
  // Null? atPlace;
  int? status;
  int? cancelled;
  // Null? cancellationReason;
  // Null? cancelledOn;
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
  // Null? feedbackRcvdOn;
  int? isPickedup;
  int? isProcessed;
  int? isDelivered;
  int? isCollectedInPerson;
  int? isAutoRouted;
  int? isRefunded;
  String? refundedAmount;
  // Null? refundedOn;
  // Null? refundedBy;
  // Null? refundComment;
  // Null? submitTo;
  // Null? submittedBy;
  // Null? isSubmitted;
  // Null? submittedOn;
  int? isRepeated;
  String? rateMultiplier;
  int? isPaidToVendor;
  int? isPayableCalculated;
  int? deliveryAttempts;
  int? pickupAttempts;
  int? isInvoiceGenerated;
  // Null? invoiceNum;
  // Null? invoiceFile;
  // Null? invoicedOn;
  String? additionalCharges;
  int? isProformaInvoiceGenerated;
  // Null? proformaInvoiceNum;
  // Null? proformaInvoiceFile;
  // Null? proformaInvoicedOn;
  String? originSource;
  // Null? orderBookedByStaff;
  // Null? paymentMethod;
  String? refDiscount;
  // Null? refDiscountMsg;
  int? isBillGenerated;
  // Null? feedbackFollowupRequestStatus;
  // Null? scheduleDate;
  Null? modeOfPayment;
  // Null? closedOn;
  // Null? corporateId;
  // Null? corporateLocationId;
  // Null? corporateUnitId;
  int? isGeneratedByScheduler;
  int? monthlySubscription;
  int? parentOrderId;
  String? additionalDiscount;
  // Null? additionalDiscountType;
  String? additionalDiscountAmount;
  int? specialDiscount;
  String? additionalCb;
  // Null? additionalCbType;
  String? additionalCbAmount;
  // Null? specialDiscountType;
  String? specialDiscountAmount;
  // Null? specialComment;
  int? isDonation;
  String? prefPickupTimeCharge;
  String? prefDeliveryTimeCharge;
  int? hasPrefPickupTime;
  int? hasPrefDeliveryTime;
  int? needsVerification;
  // Null? verifiedBy;
  // Null? verifiedOn;
  // Null? verifiedByResponsiblePerson;
  int? isLf;
  int? isQuicklyPickedup;
  String? createdOn;
  String? lastModifiedOn;
  // Null? additionalCbRedeemed;
  // Null? additionalCbRedeemedOn;
  // Null? additionalCbRedeemedFor;
  String? orderTaxableAmount;
  int? relatedCenterId;
  int? isReturnedOrder;
  // Null? returnOrderId;
  int? totalReturnedCount;
  // Null? deliveryPackId;
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
  bool? isPickedUp;
  // bool? isProcessed;
  // bool? isDelivered;
  int? processedPercentage;
  String? ordCurrentStgStatus;
  // Null? startDtTime;
  // Null? startDtTimeStamp;
  // Null? endDtTime;
  // Null? endDtTimeStamp;
  // Null? assignedForIroningTo;
  // Null? assignedForIroningOn;
  // Null? totalTimeTakenInMins;
  // Null? markedAsNotOk;
  // Null? markedAsNotOkOn;
  // Null? taskProcessStatus;
  // Null? taskProcessStatusId;
  // Null? tXNID;
  // Null? tXNTITLE;
  // Null? tXNDESCRIPTION;
  // Null? tXNLOGO;
  // Null? tXNSTATUS;
  // Null? tXNDATE;

  Items({
    this.orderId,
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
    this.orderBookedBy,
    // this.atPlace,
    this.status,
    this.cancelled,
    // this.cancellationReason,
    // this.cancelledOn,
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
    // this.feedbackRcvdOn,
    this.isPickedup,
    this.isProcessed,
    this.isDelivered,
    this.isCollectedInPerson,
    this.isAutoRouted,
    this.isRefunded,
    this.refundedAmount,
    // this.refundedOn,
    // this.refundedBy,
    // this.refundComment,
    // this.submitTo,
    // this.submittedBy,
    // this.isSubmitted,
    // this.submittedOn,
    this.isRepeated,
    this.rateMultiplier,
    this.isPaidToVendor,
    this.isPayableCalculated,
    this.deliveryAttempts,
    this.pickupAttempts,
    this.isInvoiceGenerated,
    // this.invoiceNum,
    // this.invoiceFile,
    // this.invoicedOn,
    this.additionalCharges,
    this.isProformaInvoiceGenerated,
    // this.proformaInvoiceNum,
    // this.proformaInvoiceFile,
    // this.proformaInvoicedOn,
    this.originSource,
    // this.orderBookedByStaff,
    // this.paymentMethod,
    this.refDiscount,
    // this.refDiscountMsg,
    this.isBillGenerated,
    // this.feedbackFollowupRequestStatus,
    // this.scheduleDate,
    // this.modeOfPayment,
    // this.closedOn,
    // this.corporateId,
    // this.corporateLocationId,
    // this.corporateUnitId,
    this.isGeneratedByScheduler,
    this.monthlySubscription,
    this.parentOrderId,
    this.additionalDiscount,
    // this.additionalDiscountType,
    this.additionalDiscountAmount,
    this.specialDiscount,
    this.additionalCb,
    // this.additionalCbType,
    this.additionalCbAmount,
    // this.specialDiscountType,
    this.specialDiscountAmount,
    // this.specialComment,
    this.isDonation,
    this.prefPickupTimeCharge,
    this.prefDeliveryTimeCharge,
    this.hasPrefPickupTime,
    this.hasPrefDeliveryTime,
    this.needsVerification,
    // this.verifiedBy,
    // this.verifiedOn,
    // this.verifiedByResponsiblePerson,
    this.isLf,
    this.isQuicklyPickedup,
    this.createdOn,
    this.lastModifiedOn,
    // this.additionalCbRedeemed,
    // this.additionalCbRedeemedOn,
    // this.additionalCbRedeemedFor,
    this.orderTaxableAmount,
    this.relatedCenterId,
    this.isReturnedOrder,
    // this.returnOrderId,
    this.totalReturnedCount,
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
    this.formattedPickupAddress,
    this.formattedDeliveryAddress,
    this.orderStages,
    this.isPickedUp,
    // this.isProcessed,
    // this.isDelivered,
    this.processedPercentage,
    this.ordCurrentStgStatus,
    // this.startDtTime,
    // this.startDtTimeStamp,
    // this.endDtTime,
    // this.endDtTimeStamp,
    // this.assignedForIroningTo,
    // this.assignedForIroningOn,
    // this.totalTimeTakenInMins,
    // this.markedAsNotOk,
    // this.markedAsNotOkOn,
    // this.taskProcessStatus,
    // this.taskProcessStatusId,
    // this.tXNID,
    // this.tXNTITLE,
    // this.tXNDESCRIPTION,
    // this.tXNLOGO,
    // this.tXNSTATUS,
    // this.tXNDATE
  });

  Items.fromJson(Map<String, dynamic> json) {
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
    orderBookedBy = json['order_booked_by'];
    // atPlace = json['at_place'];
    status = json['status'];
    cancelled = json['cancelled'];
    // cancellationReason = json['cancellation_reason'];
    // cancelledOn = json['cancelled_on'];
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
    // feedbackRcvdOn = json['feedback_rcvd_on'];
    isPickedup = json['is_pickedup'];
    isProcessed = json['is_processed'];
    isDelivered = json['is_delivered'];
    isCollectedInPerson = json['is_collected_in_person'];
    isAutoRouted = json['is_auto_routed'];
    isRefunded = json['is_refunded'];
    refundedAmount = json['refunded_amount'];
    // refundedOn = json['refunded_on'];
    // refundedBy = json['refunded_by'];
    // refundComment = json['refund_comment'];
    // submitTo = json['submit_to'];
    // submittedBy = json['submitted_by'];
    // isSubmitted = json['is_submitted'];
    // submittedOn = json['submitted_on'];
    isRepeated = json['is_repeated'];
    rateMultiplier = json['rate_multiplier'];
    isPaidToVendor = json['is_paid_to_vendor'];
    isPayableCalculated = json['is_payable_calculated'];
    deliveryAttempts = json['delivery_attempts'];
    pickupAttempts = json['pickup_attempts'];
    isInvoiceGenerated = json['is_invoice_generated'];
    // invoiceNum = json['invoice_num'];
    // invoiceFile = json['invoice_file'];
    // invoicedOn = json['invoiced_on'];
    additionalCharges = json['additional_charges'];
    isProformaInvoiceGenerated = json['is_proforma_invoice_generated'];
    // proformaInvoiceNum = json['proforma_invoice_num'];
    // proformaInvoiceFile = json['proforma_invoice_file'];
    // proformaInvoicedOn = json['proforma_invoiced_on'];
    originSource = json['origin_source'];
    // orderBookedByStaff = json['order_booked_by_staff'];
    // paymentMethod = json['payment_method'];
    refDiscount = json['ref_discount'];
    // refDiscountMsg = json['ref_discount_msg'];
    isBillGenerated = json['is_bill_generated'];
    // feedbackFollowupRequestStatus = json['feedback_followup_request_status'];
    // scheduleDate = json['schedule_date'];
    // modeOfPayment = json['mode_of_payment'];
    // closedOn = json['closed_on'];
    // corporateId = json['corporate_id'];
    // corporateLocationId = json['corporate_location_id'];
    // corporateUnitId = json['corporate_unit_id'];
    isGeneratedByScheduler = json['is_generated_by_scheduler'];
    monthlySubscription = json['monthly_subscription'];
    parentOrderId = json['parent_order_id'];
    additionalDiscount = json['additional_discount'];
    // additionalDiscountType = json['additional_discount_type'];
    additionalDiscountAmount = json['additional_discount_amount'];
    specialDiscount = json['special_discount'];
    additionalCb = json['additional_cb'];
    // additionalCbType = json['additional_cb_type'];
    additionalCbAmount = json['additional_cb_amount'];
    // specialDiscountType = json['special_discount_type'];
    specialDiscountAmount = json['special_discount_amount'];
    // specialComment = json['special_comment'];
    isDonation = json['is_donation'];
    prefPickupTimeCharge = json['pref_pickup_time_charge'];
    prefDeliveryTimeCharge = json['pref_delivery_time_charge'];
    hasPrefPickupTime = json['has_pref_pickup_time'];
    hasPrefDeliveryTime = json['has_pref_delivery_time'];
    needsVerification = json['needs_verification'];
    // verifiedBy = json['verified_by'];
    // verifiedOn = json['verified_on'];
    // verifiedByResponsiblePerson = json['verified_by_responsible_person'];
    isLf = json['is_lf'];
    isQuicklyPickedup = json['is_quickly_pickedup'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
    // additionalCbRedeemed = json['additional_cb_redeemed'];
    // additionalCbRedeemedOn = json['additional_cb_redeemed_on'];
    // additionalCbRedeemedFor = json['additional_cb_redeemed_for'];
    orderTaxableAmount = json['order_taxable_amount'];
    relatedCenterId = json['related_center_id'];
    isReturnedOrder = json['is_returned_order'];
    // returnOrderId = json['return_order_id'];
    totalReturnedCount = json['total_returned_count'];
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
    formattedPickupAddress = json['formatted_pickup_address'];
    formattedDeliveryAddress = json['formatted_delivery_address'];
    if (json['order_stages'] != null) {
      orderStages = <OrderStages>[];
      json['order_stages'].forEach((v) {
        orderStages!.add(OrderStages.fromJson(v));
      });
    }
    // isPickedUp = json['isPickedUp'];
    // isProcessed = json['isProcessed'];
    // isDelivered = json['isDelivered'];
    processedPercentage = json['processed_percentage'];
    ordCurrentStgStatus = json['ord_current_stg_status'];
    // startDtTime = json['start_dt_time'];
    // startDtTimeStamp = json['start_dt_time_stamp'];
    // endDtTime = json['end_dt_time'];
    // endDtTimeStamp = json['end_dt_time_stamp'];
    // assignedForIroningTo = json['assigned_for_ironing_to'];
    // assignedForIroningOn = json['assigned_for_ironing_on'];
    // totalTimeTakenInMins = json['total_time_taken_in_mins'];
    // markedAsNotOk = json['marked_as_not_ok'];
    // markedAsNotOkOn = json['marked_as_not_ok_on'];
    // taskProcessStatus = json['task_process_status'];
    // taskProcessStatusId = json['task_process_status_id'];
    // tXNID = json['TXN_ID'];
    // tXNTITLE = json['TXN_TITLE'];
    // tXNDESCRIPTION = json['TXN_DESCRIPTION'];
    // tXNLOGO = json['TXN_LOGO'];
    // tXNSTATUS = json['TXN_STATUS'];
    // tXNDATE = json['TXN_DATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_display_id'] = this.orderDisplayId;
    data['customer_id'] = this.customerId;
    data['service_id'] = this.serviceId;
    data['pickup_date'] = this.pickupDate;
    data['pickup_slot_id'] = this.pickupSlotId;
    // data['pref_pickup_time'] = this.prefPickupTime;
    data['delivery_date'] = this.deliveryDate;
    data['delivery_slot_id'] = this.deliverySlotId;
    // data['pref_delivery_time'] = this.prefDeliveryTime;
    data['ordertype_id'] = this.ordertypeId;
    data['order_total'] = this.orderTotal;
    data['order_sub_total'] = this.orderSubTotal;
    data['order_amount'] = this.orderAmount;
    data['order_taxes'] = this.orderTaxes;
    data['order_outstanding_amount'] = this.orderOutstandingAmount;
    data['total_items'] = this.totalItems;
    data['total_rcvd_items'] = this.totalRcvdItems;
    data['total_dlvrd_items'] = this.totalDlvrdItems;
    data['comments'] = this.comments;
    data['pickupaddress_id'] = this.pickupaddressId;
    data['deliveryaddress_id'] = this.deliveryaddressId;
    data['same_as'] = this.sameAs;
    data['pickup_flat_no'] = this.pickupFlatNo;
    data['pickup_street'] = this.pickupStreet;
    data['pickup_landmark'] = this.pickupLandmark;
    data['pickup_state_id'] = this.pickupStateId;
    data['pickup_city_id'] = this.pickupCityId;
    data['pickup_pincode_id'] = this.pickupPincodeId;
    // data['pickup_lat'] = this.pickupLat;
    // data['pickup_lng'] = this.pickupLng;
    data['delivery_flat_no'] = this.deliveryFlatNo;
    data['delivery_street'] = this.deliveryStreet;
    data['delivery_landmark'] = this.deliveryLandmark;
    data['delivery_state_id'] = this.deliveryStateId;
    data['delivery_city_id'] = this.deliveryCityId;
    data['delivery_pincode_id'] = this.deliveryPincodeId;
    // data['delivery_lat'] = this.deliveryLat;
    // data['delivery_lng'] = this.deliveryLng;
    data['order_booked_by'] = this.orderBookedBy;
    // data['at_place'] = this.atPlace;
    data['status'] = this.status;
    data['cancelled'] = this.cancelled;
    // data['cancellation_reason'] = this.cancellationReason;
    // data['cancelled_on'] = this.cancelledOn;
    data['cancelled_by'] = this.cancelledBy;
    data['cancelled_by_id'] = this.cancelledById;
    data['initial_assigned_to'] = this.initialAssignedTo;
    data['delivery_assigned_to'] = this.deliveryAssignedTo;
    data['extra_pay'] = this.extraPay;
    data['extra_paid_amount'] = this.extraPaidAmount;
    data['extra_paid_on'] = this.extraPaidOn;
    data['extra_paid_by'] = this.extraPaidBy;
    data['is_feedback_rcvd'] = this.isFeedbackRcvd;
    data['is_marked_as_auto_feedback'] = this.isMarkedAsAutoFeedback;
    // data['feedback_rcvd_on'] = this.feedbackRcvdOn;
    data['is_pickedup'] = this.isPickedup;
    data['is_processed'] = this.isProcessed;
    data['is_delivered'] = this.isDelivered;
    data['is_collected_in_person'] = this.isCollectedInPerson;
    data['is_auto_routed'] = this.isAutoRouted;
    data['is_refunded'] = this.isRefunded;
    data['refunded_amount'] = this.refundedAmount;
    // data['refunded_on'] = this.refundedOn;
    // data['refunded_by'] = this.refundedBy;
    // data['refund_comment'] = this.refundComment;
    // data['submit_to'] = this.submitTo;
    // data['submitted_by'] = this.submittedBy;
    // data['is_submitted'] = this.isSubmitted;
    // data['submitted_on'] = this.submittedOn;
    data['is_repeated'] = this.isRepeated;
    data['rate_multiplier'] = this.rateMultiplier;
    data['is_paid_to_vendor'] = this.isPaidToVendor;
    data['is_payable_calculated'] = this.isPayableCalculated;
    data['delivery_attempts'] = this.deliveryAttempts;
    data['pickup_attempts'] = this.pickupAttempts;
    data['is_invoice_generated'] = this.isInvoiceGenerated;
    // data['invoice_num'] = this.invoiceNum;
    // data['invoice_file'] = this.invoiceFile;
    // data['invoiced_on'] = this.invoicedOn;
    data['additional_charges'] = this.additionalCharges;
    data['is_proforma_invoice_generated'] = this.isProformaInvoiceGenerated;
    // data['proforma_invoice_num'] = this.proformaInvoiceNum;
    // data['proforma_invoice_file'] = this.proformaInvoiceFile;
    // data['proforma_invoiced_on'] = this.proformaInvoicedOn;
    data['origin_source'] = this.originSource;
    // data['order_booked_by_staff'] = this.orderBookedByStaff;
    // data['payment_method'] = this.paymentMethod;
    data['ref_discount'] = this.refDiscount;
    // data['ref_discount_msg'] = this.refDiscountMsg;
    data['is_bill_generated'] = this.isBillGenerated;
    // data['feedback_followup_request_status'] =
    //     this.feedbackFollowupRequestStatus;
    // data['schedule_date'] = this.scheduleDate;
    // data['mode_of_payment'] = this.modeOfPayment;
    // data['closed_on'] = this.closedOn;
    // data['corporate_id'] = this.corporateId;
    // data['corporate_location_id'] = this.corporateLocationId;
    // data['corporate_unit_id'] = this.corporateUnitId;
    data['is_generated_by_scheduler'] = this.isGeneratedByScheduler;
    data['monthly_subscription'] = this.monthlySubscription;
    data['parent_order_id'] = this.parentOrderId;
    data['additional_discount'] = this.additionalDiscount;
    // data['additional_discount_type'] = this.additionalDiscountType;
    data['additional_discount_amount'] = this.additionalDiscountAmount;
    data['special_discount'] = this.specialDiscount;
    data['additional_cb'] = this.additionalCb;
    // data['additional_cb_type'] = this.additionalCbType;
    data['additional_cb_amount'] = this.additionalCbAmount;
    // data['special_discount_type'] = this.specialDiscountType;
    data['special_discount_amount'] = this.specialDiscountAmount;
    // data['special_comment'] = this.specialComment;
    data['is_donation'] = this.isDonation;
    data['pref_pickup_time_charge'] = this.prefPickupTimeCharge;
    data['pref_delivery_time_charge'] = this.prefDeliveryTimeCharge;
    data['has_pref_pickup_time'] = this.hasPrefPickupTime;
    data['has_pref_delivery_time'] = this.hasPrefDeliveryTime;
    data['needs_verification'] = this.needsVerification;
    // data['verified_by'] = this.verifiedBy;
    // data['verified_on'] = this.verifiedOn;
    // data['verified_by_responsible_person'] = this.verifiedByResponsiblePerson;
    data['is_lf'] = this.isLf;
    data['is_quickly_pickedup'] = this.isQuicklyPickedup;
    data['created_on'] = this.createdOn;
    data['last_modified_on'] = this.lastModifiedOn;
    // data['additional_cb_redeemed'] = this.additionalCbRedeemed;
    // data['additional_cb_redeemed_on'] = this.additionalCbRedeemedOn;
    // data['additional_cb_redeemed_for'] = this.additionalCbRedeemedFor;
    data['order_taxable_amount'] = this.orderTaxableAmount;
    data['related_center_id'] = this.relatedCenterId;
    data['is_returned_order'] = this.isReturnedOrder;
    // data['return_order_id'] = this.returnOrderId;
    data['total_returned_count'] = this.totalReturnedCount;
    // data['delivery_pack_id'] = this.delive
    //
    //
    //
    //
    // ryPackId;
    data['delivery_pack_price'] = this.deliveryPackPrice;
    data['delivery_pack_extra_included'] = this.deliveryPackExtraIncluded;
    data['is_regular'] = this.isRegular;
    data['is_senior_citizens'] = this.isSeniorCitizens;
    data['is_covid_patients'] = this.isCovidPatients;
    data['covid_patient_amount'] = this.covidPatientAmount;
    data['is_covid_centers'] = this.isCovidCenters;
    data['cancellation_charges'] = this.cancellationCharges;
    data['cancellation_charges_pay'] = this.cancellationChargesPay;
    data['reschedule_charges'] = this.rescheduleCharges;
    data['hold_amount'] = this.holdAmount;
    data['pay_on_pickup'] = this.payOnPickup;
    data['delivery_charges'] = this.deliveryCharges;
    data['formatted_pickup_address'] = this.formattedPickupAddress;
    data['formatted_delivery_address'] = this.formattedDeliveryAddress;
    if (this.orderStages != null) {
      data['order_stages'] = this.orderStages!.map((v) => v.toJson()).toList();
    }
    data['isPickedUp'] = this.isPickedUp;
    data['isProcessed'] = this.isProcessed;
    data['isDelivered'] = this.isDelivered;
    data['processed_percentage'] = this.processedPercentage;
    data['ord_current_stg_status'] = this.ordCurrentStgStatus;
    // data['start_dt_time'] = this.startDtTime;
    // data['start_dt_time_stamp'] = this.startDtTimeStamp;
    // data['end_dt_time'] = this.endDtTime;
    // data['end_dt_time_stamp'] = this.endDtTimeStamp;
    // data['assigned_for_ironing_to'] = this.assignedForIroningTo;
    // data['assigned_for_ironing_on'] = this.assignedForIroningOn;
    // data['total_time_taken_in_mins'] = this.totalTimeTakenInMins;
    // data['marked_as_not_ok'] = this.markedAsNotOk;
    // data['marked_as_not_ok_on'] = this.markedAsNotOkOn;
    // data['task_process_status'] = this.taskProcessStatus;
    // data['task_process_status_id'] = this.taskProcessStatusId;
    // data['TXN_ID'] = this.tXNID;
    // data['TXN_TITLE'] = this.tXNTITLE;
    // data['TXN_DESCRIPTION'] = this.tXNDESCRIPTION;
    // data['TXN_LOGO'] = this.tXNLOGO;
    // data['TXN_STATUS'] = this.tXNSTATUS;
    // data['TXN_DATE'] = this.tXNDATE;
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
