// class OrderModel {
//   bool? success;
//   Data? data;

//   OrderModel({this.success, this.data});

//   OrderModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
// }

// class Data {
//   String? status;
//   OrderInfo? orderInfo;

//   Data({this.status, this.orderInfo});

//   Data.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     orderInfo = json['orderInfo'] != null
//         ? OrderInfo.fromJson(json['orderInfo'])
//         : null;
//   }
// }

// class OrderInfo {
//   int? orderId;
//   String? orderDisplayId;
//   int? customerId;
//   int? serviceId;
//   String? pickupDate;
//   int? pickupSlotId;
//   // Null? prefPickupTime;
//   String? deliveryDate;
//   int? deliverySlotId;
//   // Null? prefDeliveryTime;
//   int? ordertypeId;
//   String? orderTotal;
//   String? orderSubTotal;
//   String? orderAmount;
//   String? orderTaxes;
//   String? orderOutstandingAmount;
//   int? totalItems;
//   int? totalRcvdItems;
//   int? totalDlvrdItems;
//   // Null? comments;
//   int? pickupaddressId;
//   int? deliveryaddressId;
//   String? sameAs;
//   String? pickupFlatNo;
//   String? pickupStreet;
//   String? pickupLandmark;
//   int? pickupStateId;
//   int? pickupCityId;
//   int? pickupPincodeId;
//   // Null? pickupLat;
//   // Null? pickupLng;
//   String? deliveryFlatNo;
//   String? deliveryStreet;
//   String? deliveryLandmark;
//   int? deliveryStateId;
//   int? deliveryCityId;
//   int? deliveryPincodeId;
//   // Null? deliveryLat;
//   // Null? deliveryLng;
//   OrderBookedBy? orderBookedBy;
//   // Null? atPlace;
//   String? status;
//   int? cancelled;
//   // Null? cancellationReason;
//   // Null? cancelledOn;
//   String? cancelledBy;
//   int? cancelledById;
//   int? initialAssignedTo;
//   int? deliveryAssignedTo;
//   int? extraPay;
//   int? extraPaidAmount;
//   String? extraPaidOn;
//   int? extraPaidBy;
//   int? isFeedbackRcvd;
//   int? isMarkedAsAutoFeedback;
//   // Null? feedbackRcvdOn;
//   int? isPickedup;
//   int? isProcessed;
//   int? isDelivered;
//   int? isCollectedInPerson;
//   int? isAutoRouted;
//   int? isRefunded;
//   String? refundedAmount;
//   // Null? refundedOn;
//   // Null? refundedBy;
//   // Null? refundComment;
//   // Null? submitTo;
//   // Null? submittedBy;
//   // Null? isSubmitted;
//   // Null? submittedOn;
//   int? isRepeated;
//   String? rateMultiplier;
//   int? isPaidToVendor;
//   int? isPayableCalculated;
//   int? deliveryAttempts;
//   int? pickupAttempts;
//   int? isInvoiceGenerated;
//   // Null? invoiceNum;
//   // Null? invoiceFile;
//   // Null? invoicedOn;
//   String? additionalCharges;
//   int? isProformaInvoiceGenerated;
//   // Null? proformaInvoiceNum;
//   // Null? proformaInvoiceFile;
//   // Null? proformaInvoicedOn;
//   String? originSource;
//   // Null? orderBookedByStaff;
//   // Null? paymentMethod;
//   String? refDiscount;
//   // Null? refDiscountMsg;
//   int? isBillGenerated;
//   // Null? feedbackFollowupRequestStatus;
//   // Null? scheduleDate;
//   // Null? modeOfPayment;
//   // Null? closedOn;
//   // Null? corporateId;
//   // Null? corporateLocationId;
//   // Null? corporateUnitId;
//   int? isGeneratedByScheduler;
//   int? monthlySubscription;
//   int? parentOrderId;
//   String? additionalDiscount;
//   // Null? additionalDiscountType;
//   String? additionalDiscountAmount;
//   int? specialDiscount;
//   String? additionalCb;
//   // Null? additionalCbType;
//   String? additionalCbAmount;
//   // Null? specialDiscountType;
//   String? specialDiscountAmount;
//   // Null? specialComment;
//   int? isDonation;
//   String? prefPickupTimeCharge;
//   String? prefDeliveryTimeCharge;
//   int? hasPrefPickupTime;
//   int? hasPrefDeliveryTime;
//   int? needsVerification;
//   // Null? verifiedBy;
//   // Null? verifiedOn;
//   // Null? verifiedByResponsiblePerson;
//   int? isLf;
//   int? isQuicklyPickedup;
//   String? createdOn;
//   String? lastModifiedOn;
//   // Null? additionalCbRedeemed;
//   // Null? additionalCbRedeemedOn;
//   // Null? additionalCbRedeemedFor;
//   String? orderTaxableAmount;
//   int? relatedCenterId;
//   int? isReturnedOrder;
//   // Null? returnOrderId;
//   int? totalReturnedCount;
//   // Null? deliveryPackId;
//   String? deliveryPackPrice;
//   int? deliveryPackExtraIncluded;
//   int? isRegular;
//   int? isSeniorCitizens;
//   int? isCovidPatients;
//   String? covidPatientAmount;
//   int? isCovidCenters;
//   String? cancellationCharges;
//   int? cancellationChargesPay;
//   String? rescheduleCharges;
//   int? holdAmount;
//   int? payOnPickup;
//   String? deliveryCharges;
//   List<OrderStages>? orderStages;
//   bool? isPickedUp;
//   // bool? isProcessed;
//   // bool? isDelivered;
//   Service? service;
//   OrderType? orderType;
//   // OrderBookedBy? orderBookedBy;
//   PickupPincodes? pickupPincodes;
//   PickupCities? pickupCities;
//   PickupStates? pickupStates;
//   TimeSlot? timeSlot;
//   String? formattedPickupAddress;
//   PickupPincodes? deliveryPincodes;
//   PickupCities? deliveryCities;
//   PickupStates? deliveryStates;
//   TimeSlot? deliveryTimeSlot;
//   String? formattedDeliveryAddress;
//   // List<Null>? taxes;
//   // Null? offer;
//   List<OrderWiseStages>? orderWiseStages;
//   PickupPersonInfo? pickupPersonInfo;
//   PickupPersonInfo? deliveryPersonInfo;
//   List<OrderItems>? orderItems;

//   OrderInfo(
//       {this.orderId,
//       this.orderDisplayId,
//       this.customerId,
//       this.serviceId,
//       this.pickupDate,
//       this.pickupSlotId,
//       // this.prefPickupTime,
//       this.deliveryDate,
//       this.deliverySlotId,
//       // this.prefDeliveryTime,
//       this.ordertypeId,
//       this.orderTotal,
//       this.orderSubTotal,
//       this.orderAmount,
//       this.orderTaxes,
//       this.orderOutstandingAmount,
//       this.totalItems,
//       this.totalRcvdItems,
//       this.totalDlvrdItems,
//       // this.comments,
//       this.pickupaddressId,
//       this.deliveryaddressId,
//       this.sameAs,
//       this.pickupFlatNo,
//       this.pickupStreet,
//       this.pickupLandmark,
//       this.pickupStateId,
//       this.pickupCityId,
//       this.pickupPincodeId,
//       //this.pickupLat,
//       //this.pickupLng,
//       this.deliveryFlatNo,
//       this.deliveryStreet,
//       this.deliveryLandmark,
//       this.deliveryStateId,
//       this.deliveryCityId,
//       this.deliveryPincodeId,
//       //this.deliveryLat,
//       //this.deliveryLng,
//       // this.orderBookedBy,
//       // this.atPlace,
//       this.status,
//       this.cancelled,
//       // this.cancellationReason,
//       // this.cancelledOn,
//       this.cancelledBy,
//       this.cancelledById,
//       this.initialAssignedTo,
//       this.deliveryAssignedTo,
//       this.extraPay,
//       this.extraPaidAmount,
//       this.extraPaidOn,
//       this.extraPaidBy,
//       this.isFeedbackRcvd,
//       this.isMarkedAsAutoFeedback,
//       // this.feedbackRcvdOn,
//       this.isPickedup,
//       this.isProcessed,
//       this.isDelivered,
//       this.isCollectedInPerson,
//       this.isAutoRouted,
//       this.isRefunded,
//       this.refundedAmount,
//       // this.refundedOn,
//       // this.refundedBy,
//       // this.refundComment,
//       // this.submitTo,
//       // this.submittedBy,
//       // this.isSubmitted,
//       // this.submittedOn,
//       this.isRepeated,
//       this.rateMultiplier,
//       this.isPaidToVendor,
//       this.isPayableCalculated,
//       this.deliveryAttempts,
//       this.pickupAttempts,
//       this.isInvoiceGenerated,
//       // this.invoiceNum,
//       // this.invoiceFile,
//       // this.invoicedOn,
//       this.additionalCharges,
//       this.isProformaInvoiceGenerated,
//       // this.proformaInvoiceNum,
//       // this.proformaInvoiceFile,
//       // this.proformaInvoicedOn,
//       this.originSource,
//       // this.orderBookedByStaff,
//       // this.paymentMethod,
//       this.refDiscount,
//       // this.refDiscountMsg,
//       this.isBillGenerated,
//       // this.feedbackFollowupRequestStatus,
//       // this.scheduleDate,
//       // this.modeOfPayment,
//       // this.closedOn,
//       // this.corporateId,
//       // this.corporateLocationId,
//       // this.corporateUnitId,
//       this.isGeneratedByScheduler,
//       this.monthlySubscription,
//       this.parentOrderId,
//       this.additionalDiscount,
//       // this.additionalDiscountType,
//       this.additionalDiscountAmount,
//       this.specialDiscount,
//       this.additionalCb,
//       // this.additionalCbType,
//       this.additionalCbAmount,
//       // this.specialDiscountType,
//       this.specialDiscountAmount,
//       // this.specialComment,
//       this.isDonation,
//       this.prefPickupTimeCharge,
//       this.prefDeliveryTimeCharge,
//       this.hasPrefPickupTime,
//       this.hasPrefDeliveryTime,
//       this.needsVerification,
//       // this.verifiedBy,
//       // this.verifiedOn,
//       // this.verifiedByResponsiblePerson,
//       this.isLf,
//       this.isQuicklyPickedup,
//       this.createdOn,
//       this.lastModifiedOn,
//       // this.additionalCbRedeemed,
//       // this.additionalCbRedeemedOn,
//       // this.additionalCbRedeemedFor,
//       this.orderTaxableAmount,
//       this.relatedCenterId,
//       this.isReturnedOrder,
//       // this.returnOrderId,
//       this.totalReturnedCount,
//       // this.deliveryPackId,
//       this.deliveryPackPrice,
//       this.deliveryPackExtraIncluded,
//       this.isRegular,
//       this.isSeniorCitizens,
//       this.isCovidPatients,
//       this.covidPatientAmount,
//       this.isCovidCenters,
//       this.cancellationCharges,
//       this.cancellationChargesPay,
//       this.rescheduleCharges,
//       this.holdAmount,
//       this.payOnPickup,
//       this.deliveryCharges,
//       this.orderStages,
//       this.isPickedUp,
//       // this.isProcessed,
//       // this.isDelivered,
//       this.service,
//       this.orderType,
//       this.orderBookedBy,
//       this.pickupPincodes,
//       this.pickupCities,
//       this.pickupStates,
//       this.timeSlot,
//       this.formattedPickupAddress,
//       this.deliveryPincodes,
//       this.deliveryCities,
//       this.deliveryStates,
//       this.deliveryTimeSlot,
//       this.formattedDeliveryAddress,
//       // this.taxes,
//       // this.offer,
//       this.orderWiseStages,
//       this.pickupPersonInfo,
//       this.deliveryPersonInfo,
//       this.orderItems});

//   OrderInfo.fromJson(Map<String, dynamic> json) {
//     orderId = json['order_id'];
//     orderDisplayId = json['order_display_id'];
//     customerId = json['customer_id'];
//     serviceId = json['service_id'];
//     pickupDate = json['pickup_date'];
//     pickupSlotId = json['pickup_slot_id'];
//     // prefPickupTime = json['pref_pickup_time'];
//     deliveryDate = json['delivery_date'];
//     deliverySlotId = json['delivery_slot_id'];
//     // prefDeliveryTime = json['pref_delivery_time'];
//     ordertypeId = json['ordertype_id'];
//     orderTotal = json['order_total'];
//     orderSubTotal = json['order_sub_total'];
//     orderAmount = json['order_amount'];
//     orderTaxes = json['order_taxes'];
//     orderOutstandingAmount = json['order_outstanding_amount'];
//     totalItems = json['total_items'];
//     totalRcvdItems = json['total_rcvd_items'];
//     totalDlvrdItems = json['total_dlvrd_items'];
//     // comments = json['comments'];
//     pickupaddressId = json['pickupaddress_id'];
//     deliveryaddressId = json['deliveryaddress_id'];
//     sameAs = json['same_as'];
//     pickupFlatNo = json['pickup_flat_no'];
//     pickupStreet = json['pickup_street'];
//     pickupLandmark = json['pickup_landmark'];
//     pickupStateId = json['pickup_state_id'];
//     pickupCityId = json['pickup_city_id'];
//     pickupPincodeId = json['pickup_pincode_id'];
//     // pickupLat = json['pickup_lat'];
//     // pickupLng = json['pickup_lng'];
//     deliveryFlatNo = json['delivery_flat_no'];
//     deliveryStreet = json['delivery_street'];
//     deliveryLandmark = json['delivery_landmark'];
//     deliveryStateId = json['delivery_state_id'];
//     deliveryCityId = json['delivery_city_id'];
//     deliveryPincodeId = json['delivery_pincode_id'];
//     // deliveryLat = json['delivery_lat'];
//     // deliveryLng = json['delivery_lng'];
//     // orderBookedBy = json['order_booked_by'];

//     // atPlace = json['at_place'];
//     status = json['status'];
//     cancelled = json['cancelled'];
//     // cancellationReason = json['cancellation_reason'];
//     // cancelledOn = json['cancelled_on'];
//     // cancelledBy = json['cancelled_by'];
//     cancelledById = json['cancelled_by_id'];
//     initialAssignedTo = json['initial_assigned_to'];
//     deliveryAssignedTo = json['delivery_assigned_to'];
//     extraPay = json['extra_pay'];
//     extraPaidAmount = json['extra_paid_amount'];
//     extraPaidOn = json['extra_paid_on'];
//     extraPaidBy = json['extra_paid_by'];
//     isFeedbackRcvd = json['is_feedback_rcvd'];
//     isMarkedAsAutoFeedback = json['is_marked_as_auto_feedback'];
//     // feedbackRcvdOn = json['feedback_rcvd_on'];
//     isPickedup = json['is_pickedup'];
//     isProcessed = json['is_processed'];
//     isDelivered = json['is_delivered'];
//     isCollectedInPerson = json['is_collected_in_person'];
//     isAutoRouted = json['is_auto_routed'];
//     isRefunded = json['is_refunded'];
//     refundedAmount = json['refunded_amount'];
//     // refundedOn = json['refunded_on'];
//     // refundedBy = json['refunded_by'];
//     // refundComment = json['refund_comment'];
//     // submitTo = json['submit_to'];
//     // submittedBy = json['submitted_by'];
//     // isSubmitted = json['is_submitted'];
//     // submittedOn = json['submitted_on'];
//     isRepeated = json['is_repeated'];
//     rateMultiplier = json['rate_multiplier'];
//     isPaidToVendor = json['is_paid_to_vendor'];
//     isPayableCalculated = json['is_payable_calculated'];
//     deliveryAttempts = json['delivery_attempts'];
//     pickupAttempts = json['pickup_attempts'];
//     isInvoiceGenerated = json['is_invoice_generated'];
//     // invoiceNum = json['invoice_num'];
//     // invoiceFile = json['invoice_file'];
//     // invoicedOn = json['invoiced_on'];
//     additionalCharges = json['additional_charges'];
//     isProformaInvoiceGenerated = json['is_proforma_invoice_generated'];
//     // proformaInvoiceNum = json['proforma_invoice_num'];
//     // proformaInvoiceFile = json['proforma_invoice_file'];
//     // proformaInvoicedOn = json['proforma_invoiced_on'];
//     originSource = json['origin_source'];
//     // orderBookedByStaff = json['order_booked_by_staff'];
//     // paymentMethod = json['payment_method'];
//     refDiscount = json['ref_discount'];
//     // refDiscountMsg = json['ref_discount_msg'];
//     isBillGenerated = json['is_bill_generated'];
//     // feedbackFollowupRequestStatus = json['feedback_followup_request_status'];
//     // scheduleDate = json['schedule_date'];
//     // modeOfPayment = json['mode_of_payment'];
//     // closedOn = json['closed_on'];
//     // corporateId = json['corporate_id'];
//     // corporateLocationId = json['corporate_location_id'];
//     // corporateUnitId = json['corporate_unit_id'];
//     isGeneratedByScheduler = json['is_generated_by_scheduler'];
//     monthlySubscription = json['monthly_subscription'];
//     parentOrderId = json['parent_order_id'];
//     additionalDiscount = json['additional_discount'];
//     // additionalDiscountType = json['additional_discount_type'];
//     additionalDiscountAmount = json['additional_discount_amount'];
//     specialDiscount = json['special_discount'];
//     additionalCb = json['additional_cb'];
//     // additionalCbType = json['additional_cb_type'];
//     additionalCbAmount = json['additional_cb_amount'];
//     // specialDiscountType = json['special_discount_type'];
//     specialDiscountAmount = json['special_discount_amount'];
//     // specialComment = json['special_comment'];
//     isDonation = json['is_donation'];
//     prefPickupTimeCharge = json['pref_pickup_time_charge'];
//     prefDeliveryTimeCharge = json['pref_delivery_time_charge'];
//     hasPrefPickupTime = json['has_pref_pickup_time'];
//     hasPrefDeliveryTime = json['has_pref_delivery_time'];
//     needsVerification = json['needs_verification'];
//     // verifiedBy = json['verified_by'];
//     // verifiedOn = json['verified_on'];
//     // verifiedByResponsiblePerson = json['verified_by_responsible_person'];
//     isLf = json['is_lf'];
//     isQuicklyPickedup = json['is_quickly_pickedup'];
//     createdOn = json['created_on'];
//     lastModifiedOn = json['last_modified_on'];
//     // additionalCbRedeemed = json['additional_cb_redeemed'];
//     // additionalCbRedeemedOn = json['additional_cb_redeemed_on'];
//     // additionalCbRedeemedFor = json['additional_cb_redeemed_for'];
//     orderTaxableAmount = json['order_taxable_amount'];
//     relatedCenterId = json['related_center_id'];
//     isReturnedOrder = json['is_returned_order'];
//     // returnOrderId = json['return_order_id'];
//     totalReturnedCount = json['total_returned_count'];
//     // deliveryPackId = json['delivery_pack_id'];
//     deliveryPackPrice = json['delivery_pack_price'];
//     deliveryPackExtraIncluded = json['delivery_pack_extra_included'];
//     isRegular = json['is_regular'];
//     isSeniorCitizens = json['is_senior_citizens'];
//     isCovidPatients = json['is_covid_patients'];
//     covidPatientAmount = json['covid_patient_amount'];
//     isCovidCenters = json['is_covid_centers'];
//     cancellationCharges = json['cancellation_charges'];
//     cancellationChargesPay = json['cancellation_charges_pay'];
//     rescheduleCharges = json['reschedule_charges'];
//     holdAmount = json['hold_amount'];
//     payOnPickup = json['pay_on_pickup'];
//     deliveryCharges = json['delivery_charges'];
//     if (json['order_stages'] != null) {
//       orderStages = <OrderStages>[];
//       json['order_stages'].forEach((v) {
//         orderStages!.add(new OrderStages.fromJson(v));
//       });
//     }
//     isPickedUp = json['isPickedUp'];
//     // isProcessed = json['isProcessed'];
//     // isDelivered = json['isDelivered'];
//     service =
//         json['service'] != null ? new Service.fromJson(json['service']) : null;
//     orderType = json['orderType'] != null
//         ? OrderType.fromJson(json['orderType'])
//         : null;
//     orderBookedBy = json['orderBookedBy'] != null
//         ? OrderBookedBy.fromJson(json['orderBookedBy'])
//         : null;
//     pickupPincodes = json['pickupPincodes'] != null
//         ? PickupPincodes.fromJson(json['pickupPincodes'])
//         : null;
//     pickupCities = json['pickupCities'] != null
//         ? PickupCities.fromJson(json['pickupCities'])
//         : null;
//     pickupStates = json['pickupStates'] != null
//         ? PickupStates.fromJson(json['pickupStates'])
//         : null;
//     timeSlot =
//         json['timeSlot'] != null ? TimeSlot.fromJson(json['timeSlot']) : null;
//     formattedPickupAddress = json['formatted_pickup_address'];
//     deliveryPincodes = json['deliveryPincodes'] != null
//         ? PickupPincodes.fromJson(json['deliveryPincodes'])
//         : null;
//     deliveryCities = json['deliveryCities'] != null
//         ? PickupCities.fromJson(json['deliveryCities'])
//         : null;
//     deliveryStates = json['deliveryStates'] != null
//         ? PickupStates.fromJson(json['deliveryStates'])
//         : null;
//     deliveryTimeSlot = json['deliveryTimeSlot'] != null
//         ? TimeSlot.fromJson(json['deliveryTimeSlot'])
//         : null;
//     formattedDeliveryAddress = json['formatted_delivery_address'];
//     // if (json['taxes'] != null) {
//     //   taxes = <Null>[];
//     //   json['taxes'].forEach((v) {
//     //     taxes!.add(new Null.fromJson(v));
//     //   });
//     // }
//     // offer = json['offer'];
//     if (json['orderWiseStages'] != null) {
//       orderWiseStages = <OrderWiseStages>[];
//       json['orderWiseStages'].forEach((v) {
//         orderWiseStages!.add(OrderWiseStages.fromJson(v));
//       });
//     }
//     pickupPersonInfo = json['PickupPersonInfo'] != null
//         ? PickupPersonInfo.fromJson(json['PickupPersonInfo'])
//         : null;
//     deliveryPersonInfo = json['DeliveryPersonInfo'] != null
//         ? PickupPersonInfo.fromJson(json['DeliveryPersonInfo'])
//         : null;
//     if (json['orderItems'] != null) {
//       orderItems = <OrderItems>[];
//       json['orderItems'].forEach((v) {
//         orderItems!.add(OrderItems.fromJson(v));
//       });
//     }
//   }
// }

// class OrderStages {
//   int? stageOrder;
//   int? orderstageId;
//   String? stageTitle;
//   String? stageStatus;
//   // int? assignedToId;
//   String? assignedTo;
//   String? stagedBy;
//   String? stageComments;
//   String? stagedOn;
//   String? stagedLaston;
//   // int? customerFeedbackRating;
//   String? customerFeedbackComment;
//   // Null? customerFeedbackReceivedOn;
//   String? stageBySepName;
//   String? stageBySepPhone;

//   OrderStages(
//       {this.stageOrder,
//       this.orderstageId,
//       this.stageTitle,
//       this.stageStatus,
//       // this.assignedToId,
//       this.assignedTo,
//       this.stagedBy,
//       this.stageComments,
//       this.stagedOn,
//       this.stagedLaston,
//       // this.customerFeedbackRating,
//       this.customerFeedbackComment,
//       // this.customerFeedbackReceivedOn,
//       this.stageBySepName,
//       this.stageBySepPhone});

//   OrderStages.fromJson(Map<String, dynamic> json) {
//     stageOrder = json['stage_order'];
//     orderstageId = json['orderstage_id'];
//     stageTitle = json['stage_title'];
//     stageStatus = json['stage_status'];
//     // assignedToId = json['assigned_to_id'];
//     assignedTo = json['assigned_to'];
//     stagedBy = json['staged_by'];
//     stageComments = json['stage_comments'];
//     stagedOn = json['staged_on'];
//     stagedLaston = json['staged_laston'];
//     // customerFeedbackRating = json['customer_feedback_rating'];
//     customerFeedbackComment = json['customer_feedback_comment'];
//     // customerFeedbackReceivedOn = json['customer_feedback_received_on'];
//     stageBySepName = json['stage_by_sep_name'];
//     stageBySepPhone = json['stage_by_sep_phone'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['stage_order'] = this.stageOrder;
//     data['orderstage_id'] = this.orderstageId;
//     data['stage_title'] = this.stageTitle;
//     data['stage_status'] = this.stageStatus;
//     // data['assigned_to_id'] = this.assignedToId;
//     data['assigned_to'] = this.assignedTo;
//     data['staged_by'] = this.stagedBy;
//     data['stage_comments'] = this.stageComments;
//     data['staged_on'] = this.stagedOn;
//     data['staged_laston'] = this.stagedLaston;
//     // data['customer_feedback_rating'] = this.customerFeedbackRating;
//     data['customer_feedback_comment'] = this.customerFeedbackComment;
//     // data['customer_feedback_received_on'] = this.customerFeedbackReceivedOn;
//     data['stage_by_sep_name'] = this.stageBySepName;
//     data['stage_by_sep_phone'] = this.stageBySepPhone;
//     return data;
//   }
// }

// class Service {
//   String? name;
//   String? banner;

//   Service({this.name, this.banner});

//   Service.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     banner = json['banner'];
//   }
// }

// class OrderType {
//   String? typeName;
//   int? allowUserToChooseGarments;
//   String? minOrdVal;
//   int? isInstant;

//   OrderType(
//       {this.typeName,
//       this.allowUserToChooseGarments,
//       this.minOrdVal,
//       this.isInstant});

//   OrderType.fromJson(Map<String, dynamic> json) {
//     typeName = json['type_name'];
//     allowUserToChooseGarments = json['allow_user_to_choose_garments'];
//     minOrdVal = json['min_ord_val'];
//     isInstant = json['is_instant'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type_name'] = this.typeName;
//     data['allow_user_to_choose_garments'] = this.allowUserToChooseGarments;
//     data['min_ord_val'] = this.minOrdVal;
//     data['is_instant'] = this.isInstant;
//     return data;
//   }
// }

// class OrderBookedBy {
//   String? mobile;
//   String? name;
//   int? id;
//   String? pushId;

//   OrderBookedBy({this.mobile, this.name, this.id, this.pushId});

//   OrderBookedBy.fromJson(Map<String, dynamic> json) {
//     mobile = json['mobile'];
//     name = json['name'];
//     id = json['id'];
//     pushId = json['push_id'];
//   }
// }

// class PickupPincodes {
//   String? areaName;
//   String? pincode;

//   PickupPincodes({this.areaName, this.pincode});

//   PickupPincodes.fromJson(Map<String, dynamic> json) {
//     areaName = json['area_name'];
//     pincode = json['pincode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['area_name'] = this.areaName;
//     data['pincode'] = this.pincode;
//     return data;
//   }
// }

// class PickupCities {
//   String? cityName;

//   PickupCities({this.cityName});

//   PickupCities.fromJson(Map<String, dynamic> json) {
//     cityName = json['city_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['city_name'] = this.cityName;
//     return data;
//   }
// }

// class PickupStates {
//   String? stateName;

//   PickupStates({this.stateName});

//   PickupStates.fromJson(Map<String, dynamic> json) {
//     stateName = json['state_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['state_name'] = this.stateName;
//     return data;
//   }
// }

// class TimeSlot {
//   int? startsOn;
//   int? endsOn;

//   TimeSlot({this.startsOn, this.endsOn});

//   TimeSlot.fromJson(Map<String, dynamic> json) {
//     startsOn = json['starts_on'];
//     endsOn = json['ends_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['starts_on'] = this.startsOn;
//     data['ends_on'] = this.endsOn;
//     return data;
//   }
// }

// class OrderWiseStages {
//   int? orderstageId;
//   int? orderId;
//   int? stageId;
//   int? stageStatus;
//   String? stageComments;
//   int? stagedBy;
//   String? barcode;
//   int? nextStageId;
//   String? lastModifiedOn;
//   String? createdOn;
//   String? title;
//   int? displayOrder;

//   OrderWiseStages(
//       {this.orderstageId,
//       this.orderId,
//       this.stageId,
//       this.stageStatus,
//       this.stageComments,
//       this.stagedBy,
//       this.barcode,
//       this.nextStageId,
//       this.lastModifiedOn,
//       this.createdOn,
//       this.title,
//       this.displayOrder});

//   OrderWiseStages.fromJson(Map<String, dynamic> json) {
//     orderstageId = json['orderstage_id'];
//     orderId = json['order_id'];
//     stageId = json['stage_id'];
//     stageStatus = json['stage_status'];
//     stageComments = json['stage_comments'];
//     stagedBy = json['staged_by'];
//     barcode = json['barcode'];
//     nextStageId = json['next_stage_id'];
//     lastModifiedOn = json['last_modified_on'];
//     createdOn = json['created_on'];
//     title = json['title'];
//     displayOrder = json['display_order'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orderstage_id'] = this.orderstageId;
//     data['order_id'] = this.orderId;
//     data['stage_id'] = this.stageId;
//     data['stage_status'] = this.stageStatus;
//     data['stage_comments'] = this.stageComments;
//     data['staged_by'] = this.stagedBy;
//     data['barcode'] = this.barcode;
//     data['next_stage_id'] = this.nextStageId;
//     data['last_modified_on'] = this.lastModifiedOn;
//     data['created_on'] = this.createdOn;
//     data['title'] = this.title;
//     data['display_order'] = this.displayOrder;
//     return data;
//   }
// }

// class PickupPersonInfo {
//   int? personId;
//   String? person;
//   String? number;
//   String? away;
//   String? lat;
//   String? lon;

//   PickupPersonInfo(
//       {this.personId, this.person, this.number, this.away, this.lat, this.lon});

//   PickupPersonInfo.fromJson(Map<String, dynamic> json) {
//     personId = json['person_id'];
//     person = json['person'];
//     number = json['number'];
//     away = json['away'];
//     lat = json['lat'];
//     lon = json['lon'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['person_id'] = this.personId;
//     data['person'] = this.person;
//     data['number'] = this.number;
//     data['away'] = this.away;
//     data['lat'] = this.lat;
//     data['lon'] = this.lon;
//     return data;
//   }
// }

// class OrderItems {
//   int? itemId;
//   int? gtypeId;
//   String? mainType;
//   String? gsubtypeId;
//   String? subType;
//   String? basePrice;
//   int? qty;
//   int? rcvdQty;
//   String? icon;

//   OrderItems(
//       {this.itemId,
//       this.gtypeId,
//       this.mainType,
//       this.gsubtypeId,
//       this.subType,
//       this.basePrice,
//       this.qty,
//       this.rcvdQty,
//       this.icon});

//   OrderItems.fromJson(Map<String, dynamic> json) {
//     itemId = json['item_id'];
//     gtypeId = json['gtype_id'];
//     mainType = json['main_type'];
//     gsubtypeId = json['gsubtype_id'];
//     subType = json['sub_type'];
//     basePrice = json['base_price'];
//     qty = json['qty'];
//     rcvdQty = json['rcvd_qty'];
//     icon = json['icon'];
//   }
// }

class OrderModel {
  bool? success;
  Data? data;

  OrderModel({this.success, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? status;
  OrderInfo? orderInfo;

  Data({this.status, this.orderInfo});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderInfo = json['orderInfo'] != null
        ?  OrderInfo.fromJson(json['orderInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    if (orderInfo != null) {
      data['orderInfo'] = orderInfo!.toJson();
    }
    return data;
  }
}

class OrderInfo {
  int? orderId;
  int? payLater;
  String? orderDisplayId;
  int? customerId;
  int? serviceId;
  String? pickupDate;
  int? pickupSlotId;
  String? prefPickupTime;
  String? deliveryDate;
  int? deliverySlotId;
  String? prefDeliveryTime;
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
  String? pickupLat;
  String? pickupLng;
  String? deliveryFlatNo;
  String? deliveryStreet;
  String? deliveryLandmark;
  int? deliveryStateId;
  int? deliveryCityId;
  int? deliveryPincodeId;
  String? deliveryLat;
  String? deliveryLng;
  int? orderBookedBy;
  String? atPlace;
  String? status;
  int? cancelled;
  String? cancellationReason;
  String? cancelledOn;
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
  String? feedbackRcvdOn;
  int? isPickedup;
  int? isProcessed;
  int? isDelivered;
  int? isCollectedInPerson;
  int? isAutoRouted;
  int? isRefunded;
  String? refundedAmount;
  String? refundedOn;
  String? refundedBy;
  String? refundComment;
  String? submitTo;
  String? submittedBy;
  String? isSubmitted;
  String? submittedOn;
  int? isRepeated;
  String? rateMultiplier;
  int? isPaidToVendor;
  int? isPayableCalculated;
  int? deliveryAttempts;
  int? pickupAttempts;
  int? isInvoiceGenerated;
  String? invoiceNum;
  String? invoiceFile;
  String? invoicedOn;
  String? additionalCharges;
  int? isProformaInvoiceGenerated;
  String? proformaInvoiceNum;
  String? proformaInvoiceFile;
  String? proformaInvoicedOn;
  String? originSource;
  String? orderBookedByStaff;
  String? paymentMethod;
  String? refDiscount;
  String? refDiscountMsg;
  int? isBillGenerated;
  String? feedbackFollowupRequestStatus;
  String? scheduleDate;
  String? modeOfPayment;
  String? closedOn;
  String? corporateId;
  String? corporateLocationId;
  String? corporateUnitId;
  int? isGeneratedByScheduler;
  int? monthlySubscription;
  int? parentOrderId;
  String? additionalDiscount;
  String? additionalDiscountType;
  String? additionalDiscountAmount;
  int? specialDiscount;
  String? additionalCb;
  String? additionalCbType;
  String? additionalCbAmount;
  String? specialDiscountType;
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
  String? additionalCbRedeemed;
  String? additionalCbRedeemedOn;
  String? additionalCbRedeemedFor;
  String? orderTaxableAmount;
  int? relatedCenterId;
  int? isReturnedOrder;
  String? returnOrderId;
  int? totalReturnedCount;
  String? deliveryPackId;
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
  List<OrderStages>? orderStages;
  bool? isPickedUp;
  bool? isProcesseds;
  bool? isDelivereds;
  Service? service;
  OrderType? orderType;
  OrderBookedBy? orderBookedBys;
  PickupPincodes? pickupPincodes;
  PickupCities? pickupCities;
  PickupStates? pickupStates;
  TimeSlot? timeSlot;
  String? formattedPickupAddress;
  PickupPincodes? deliveryPincodes;
  PickupCities? deliveryCities;
  PickupStates? deliveryStates;
  TimeSlot? deliveryTimeSlot;
  String? formattedDeliveryAddress;
  List<String>? taxes;
  Offer? offer;
  List<OrderWiseStages>? orderWiseStages;
  PickupPersonInfo? pickupPersonInfo;
  PickupPersonInfo? deliveryPersonInfo;
  List<OrderItems>? orderItems;


  OrderInfo(
      {this.orderId,
      this.payLater,
      this.orderDisplayId,
      this.customerId,
      this.serviceId,
      this.pickupDate,
      this.pickupSlotId,
      this.prefPickupTime,
      this.deliveryDate,
      this.deliverySlotId,
      this.prefDeliveryTime,
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
      this.pickupLat,
      this.pickupLng,
      this.deliveryFlatNo,
      this.deliveryStreet,
      this.deliveryLandmark,
      this.deliveryStateId,
      this.deliveryCityId,
      this.deliveryPincodeId,
      this.deliveryLat,
      this.deliveryLng,
      this.orderBookedBy,
      this.atPlace,
      this.status,
      this.cancelled,
      this.cancellationReason,
      this.cancelledOn,
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
      this.feedbackRcvdOn,
      this.isPickedup,
      this.isProcessed,
      this.isDelivered,
      this.isCollectedInPerson,
      this.isAutoRouted,
      this.isRefunded,
      this.refundedAmount,
      this.refundedOn,
      this.refundedBy,
      this.refundComment,
      this.submitTo,
      this.submittedBy,
      this.isSubmitted,
      this.submittedOn,
      this.isRepeated,
      this.rateMultiplier,
      this.isPaidToVendor,
      this.isPayableCalculated,
      this.deliveryAttempts,
      this.pickupAttempts,
      this.isInvoiceGenerated,
      this.invoiceNum,
      this.invoiceFile,
      this.invoicedOn,
      this.additionalCharges,
      this.isProformaInvoiceGenerated,
      this.proformaInvoiceNum,
      this.proformaInvoiceFile,
      this.proformaInvoicedOn,
      this.originSource,
      this.orderBookedByStaff,
      this.paymentMethod,
      this.refDiscount,
      this.refDiscountMsg,
      this.isBillGenerated,
      this.feedbackFollowupRequestStatus,
      this.scheduleDate,
      this.modeOfPayment,
      this.closedOn,
      this.corporateId,
      this.corporateLocationId,
      this.corporateUnitId,
      this.isGeneratedByScheduler,
      this.monthlySubscription,
      this.parentOrderId,
      this.additionalDiscount,
      this.additionalDiscountType,
      this.additionalDiscountAmount,
      this.specialDiscount,
      this.additionalCb,
      this.additionalCbType,
      this.additionalCbAmount,
      this.specialDiscountType,
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
      this.additionalCbRedeemed,
      this.additionalCbRedeemedOn,
      this.additionalCbRedeemedFor,
      this.orderTaxableAmount,
      this.relatedCenterId,
      this.isReturnedOrder,
      this.returnOrderId,
      this.totalReturnedCount,
      this.deliveryPackId,
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
      this.orderStages,
      this.isPickedUp,
      this.isProcesseds,
      this.isDelivereds,
      this.service,
      this.orderType,
      this.orderBookedBys,
      this.pickupPincodes,
      this.pickupCities,
      this.pickupStates,
      this.timeSlot,
      this.formattedPickupAddress,
      this.deliveryPincodes,
      this.deliveryCities,
      this.deliveryStates,
      this.deliveryTimeSlot,
      this.formattedDeliveryAddress,
      this.taxes,
      this.offer,
      this.orderWiseStages,
      this.pickupPersonInfo,
      this.deliveryPersonInfo,
      this.orderItems, });

  OrderInfo.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    payLater = json['payLater'];
    orderDisplayId = json['order_display_id'];
    customerId = json['customer_id'];
    serviceId = json['service_id'];
    pickupDate = json['pickup_date'];
    pickupSlotId = json['pickup_slot_id'];
    prefPickupTime = json['pref_pickup_time'].toString();
    deliveryDate = json['delivery_date'];
    deliverySlotId = json['delivery_slot_id'];
    prefDeliveryTime = json['pref_delivery_time'].toString();
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
    pickupLat = json['pickup_lat'].toString();
    pickupLng = json['pickup_lng'].toString();
    deliveryFlatNo = json['delivery_flat_no'];
    deliveryStreet = json['delivery_street'];
    deliveryLandmark = json['delivery_landmark'];
    deliveryStateId = json['delivery_state_id'];
    deliveryCityId = json['delivery_city_id'];
    deliveryPincodeId = json['delivery_pincode_id'];
    deliveryLat = json['delivery_lat'].toString();
    deliveryLng = json['delivery_lng'];
    orderBookedBy = json['order_booked_by'];
    atPlace = json['at_place'];
    status = json['status'];
    cancelled = json['cancelled'];
    cancellationReason = json['cancellation_reason'];
    cancelledOn = json['cancelled_on'];
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
    feedbackRcvdOn = json['feedback_rcvd_on'];
    isPickedup = json['is_pickedup'];
    isProcessed = json['is_processed'];
    isDelivered = json['is_delivered'];
    isCollectedInPerson = json['is_collected_in_person'];
    isAutoRouted = json['is_auto_routed'];
    isRefunded = json['is_refunded'];
    refundedAmount = json['refunded_amount'];
    refundedOn = json['refunded_on'];
    refundedBy = json['refunded_by'];
    refundComment = json['refund_comment'];
    submitTo = json['submit_to'];
    submittedBy = json['submitted_by'];
    isSubmitted = json['is_submitted'];
    submittedOn = json['submitted_on'];
    isRepeated = json['is_repeated'];
    rateMultiplier = json['rate_multiplier'];
    isPaidToVendor = json['is_paid_to_vendor'];
    isPayableCalculated = json['is_payable_calculated'];
    deliveryAttempts = json['delivery_attempts'];
    pickupAttempts = json['pickup_attempts'];
    isInvoiceGenerated = json['is_invoice_generated'];
    invoiceNum = json['invoice_num'];
    invoiceFile = json['invoice_file'];
    invoicedOn = json['invoiced_on'];
    additionalCharges = json['additional_charges'];
    isProformaInvoiceGenerated = json['is_proforma_invoice_generated'];
    proformaInvoiceNum = json['proforma_invoice_num'].toString();
    proformaInvoiceFile = json['proforma_invoice_file'].toString();
    proformaInvoicedOn = json['proforma_invoiced_on'].toString();
    originSource = json['origin_source'];
    orderBookedByStaff = json['order_booked_by_staff'].toString();
    paymentMethod = json['payment_method'].toString();
    refDiscount = json['ref_discount'];
    refDiscountMsg = json['ref_discount_msg'].toString();
    isBillGenerated = json['is_bill_generated'];
    feedbackFollowupRequestStatus = json['feedback_followup_request_status'].toString();
    scheduleDate = json['schedule_date'].toString();
    modeOfPayment = json['mode_of_payment'];
    closedOn = json['closed_on'];
    corporateId = json['corporate_id'];
    corporateLocationId = json['corporate_location_id'];
    corporateUnitId = json['corporate_unit_id'];
    isGeneratedByScheduler = json['is_generated_by_scheduler'];
    monthlySubscription = json['monthly_subscription'];
    parentOrderId = json['parent_order_id'];
    additionalDiscount = json['additional_discount'];
    additionalDiscountType = json['additional_discount_type'];
    additionalDiscountAmount = json['additional_discount_amount'];
    specialDiscount = json['special_discount'];
    additionalCb = json['additional_cb'];
    additionalCbType = json['additional_cb_type'];
    additionalCbAmount = json['additional_cb_amount'];
    specialDiscountType = json['special_discount_type'];
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
    additionalCbRedeemed = json['additional_cb_redeemed'];
    additionalCbRedeemedOn = json['additional_cb_redeemed_on'];
    additionalCbRedeemedFor = json['additional_cb_redeemed_for'];
    orderTaxableAmount = json['order_taxable_amount'];
    relatedCenterId = json['related_center_id'];
    isReturnedOrder = json['is_returned_order'];
    returnOrderId = json['return_order_id'];
    totalReturnedCount = json['total_returned_count'];
    deliveryPackId = json['delivery_pack_id'];
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
    if (json['order_stages'] != null) {
      orderStages = <OrderStages>[];
      json['order_stages'].forEach((v) {
        orderStages!.add( OrderStages.fromJson(v));
      });
    }
    isPickedUp = json['isPickedUp'];
    isProcesseds = json['isProcessed'];
    isDelivereds = json['isDelivered'];
    service =
        json['service'] != null ?  Service.fromJson(json['service']) : null;
    orderType = json['orderType'] != null
        ?  OrderType.fromJson(json['orderType'])
        : null;
    orderBookedBys = json['orderBookedBy'] != null
        ?  OrderBookedBy.fromJson(json['orderBookedBy'])
        : null;
    pickupPincodes = json['pickupPincodes'] != null
        ?  PickupPincodes.fromJson(json['pickupPincodes'])
        : null;
    pickupCities = json['pickupCities'] != null
        ?  PickupCities.fromJson(json['pickupCities'])
        : null;
    pickupStates = json['pickupStates'] != null
        ?  PickupStates.fromJson(json['pickupStates'])
        : null;
    timeSlot = json['timeSlot'] != null
        ?  TimeSlot.fromJson(json['timeSlot'])
        : null;
    formattedPickupAddress = json['formatted_pickup_address'];
    deliveryPincodes = json['deliveryPincodes'] != null
        ?  PickupPincodes.fromJson(json['deliveryPincodes'])
        : null;
    deliveryCities = json['deliveryCities'] != null
        ?  PickupCities.fromJson(json['deliveryCities'])
        : null;
    deliveryStates = json['deliveryStates'] != null
        ?  PickupStates.fromJson(json['deliveryStates'])
        : null;
    deliveryTimeSlot = json['deliveryTimeSlot'] != null
        ?  TimeSlot.fromJson(json['deliveryTimeSlot'])
        : null;
    formattedDeliveryAddress = json['formatted_delivery_address'];


    offer = json['offer'] != null  ?  Offer.fromJson(json['offer']) : null;


    if (json['orderWiseStages'] != null) {
      orderWiseStages = <OrderWiseStages>[];
      json['orderWiseStages'].forEach((v) {
        orderWiseStages!.add( OrderWiseStages.fromJson(v));
      });
    }
    pickupPersonInfo = json['PickupPersonInfo'] != null  ?  PickupPersonInfo.fromJson(json['PickupPersonInfo'])
        : null;
    deliveryPersonInfo = json['DeliveryPersonInfo'] != null
        ?  PickupPersonInfo.fromJson(json['DeliveryPersonInfo'])
        : null;
    if (json['orderItems'] != null) {
      orderItems = <OrderItems>[];
      json['orderItems'].forEach((v) {
        orderItems!.add( OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['order_id'] = orderId;
    data['payLater'] = payLater;
    data['order_display_id'] = orderDisplayId;
    data['customer_id'] = customerId;
    data['service_id'] = serviceId;
    data['pickup_date'] = pickupDate;
    data['pickup_slot_id'] = pickupSlotId;
    data['pref_pickup_time'] = prefPickupTime;
    data['delivery_date'] = deliveryDate;
    data['delivery_slot_id'] = deliverySlotId;
    data['pref_delivery_time'] = prefDeliveryTime;
    data['ordertype_id'] = ordertypeId;
    data['order_total'] = orderTotal;
    data['order_sub_total'] = orderSubTotal;
    data['order_amount'] = orderAmount;
    data['order_taxes'] = orderTaxes;
    data['order_outstanding_amount'] = orderOutstandingAmount;
    data['total_items'] = totalItems;
    data['total_rcvd_items'] = totalRcvdItems;
    data['total_dlvrd_items'] = totalDlvrdItems;
    data['comments'] = comments;
    data['pickupaddress_id'] = pickupaddressId;
    data['deliveryaddress_id'] = deliveryaddressId;
    data['same_as'] = sameAs;
    data['pickup_flat_no'] = pickupFlatNo;
    data['pickup_street'] = pickupStreet;
    data['pickup_landmark'] = pickupLandmark;
    data['pickup_state_id'] = pickupStateId;
    data['pickup_city_id'] = pickupCityId;
    data['pickup_pincode_id'] = pickupPincodeId;
    data['pickup_lat'] = pickupLat;
    data['pickup_lng'] = pickupLng;
    data['delivery_flat_no'] = deliveryFlatNo;
    data['delivery_street'] = deliveryStreet;
    data['delivery_landmark'] = deliveryLandmark;
    data['delivery_state_id'] = deliveryStateId;
    data['delivery_city_id'] = deliveryCityId;
    data['delivery_pincode_id'] = deliveryPincodeId;
    data['delivery_lat'] = deliveryLat;
    data['delivery_lng'] = deliveryLng;
    data['order_booked_by'] = orderBookedBy;
    data['at_place'] = atPlace;
    data['status'] = status;
    data['cancelled'] = cancelled;
    data['cancellation_reason'] = cancellationReason;
    data['cancelled_on'] = cancelledOn;
    data['cancelled_by'] = cancelledBy;
    data['cancelled_by_id'] = cancelledById;
    data['initial_assigned_to'] = initialAssignedTo;
    data['delivery_assigned_to'] = deliveryAssignedTo;
    data['extra_pay'] = extraPay;
    data['extra_paid_amount'] = extraPaidAmount;
    data['extra_paid_on'] = extraPaidOn;
    data['extra_paid_by'] = extraPaidBy;
    data['is_feedback_rcvd'] = isFeedbackRcvd;
    data['is_marked_as_auto_feedback'] = isMarkedAsAutoFeedback;
    data['feedback_rcvd_on'] = feedbackRcvdOn;
    data['is_pickedup'] = isPickedup;
    data['is_processed'] = isProcessed;
    data['is_delivered'] = isDelivered;
    data['is_collected_in_person'] = isCollectedInPerson;
    data['is_auto_routed'] = isAutoRouted;
    data['is_refunded'] = isRefunded;
    data['refunded_amount'] = refundedAmount;
    data['refunded_on'] = refundedOn;
    data['refunded_by'] = refundedBy;
    data['refund_comment'] = refundComment;
    data['submit_to'] = submitTo;
    data['submitted_by'] = submittedBy;
    data['is_submitted'] = isSubmitted;
    data['submitted_on'] = submittedOn;
    data['is_repeated'] = isRepeated;
    data['rate_multiplier'] = rateMultiplier;
    data['is_paid_to_vendor'] = isPaidToVendor;
    data['is_payable_calculated'] = isPayableCalculated;
    data['delivery_attempts'] = deliveryAttempts;
    data['pickup_attempts'] = pickupAttempts;
    data['is_invoice_generated'] = isInvoiceGenerated;
    data['invoice_num'] = invoiceNum;
    data['invoice_file'] = invoiceFile;
    data['invoiced_on'] = invoicedOn;
    data['additional_charges'] = additionalCharges;
    data['is_proforma_invoice_generated'] = isProformaInvoiceGenerated;
    data['proforma_invoice_num'] = proformaInvoiceNum;
    data['proforma_invoice_file'] = proformaInvoiceFile;
    data['proforma_invoiced_on'] = proformaInvoicedOn;
    data['origin_source'] = originSource;
    data['order_booked_by_staff'] = orderBookedByStaff;
    data['payment_method'] = paymentMethod;
    data['ref_discount'] = refDiscount;
    data['ref_discount_msg'] = refDiscountMsg;
    data['is_bill_generated'] = isBillGenerated;
    data['feedback_followup_request_status'] =
        feedbackFollowupRequestStatus;
    data['schedule_date'] = scheduleDate;
    data['mode_of_payment'] = modeOfPayment;
    data['closed_on'] = closedOn;
    data['corporate_id'] = corporateId;
    data['corporate_location_id'] = corporateLocationId;
    data['corporate_unit_id'] = corporateUnitId;
    data['is_generated_by_scheduler'] = isGeneratedByScheduler;
    data['monthly_subscription'] = monthlySubscription;
    data['parent_order_id'] = parentOrderId;
    data['additional_discount'] = additionalDiscount;
    data['additional_discount_type'] = additionalDiscountType;
    data['additional_discount_amount'] = additionalDiscountAmount;
    data['special_discount'] = specialDiscount;
    data['additional_cb'] = additionalCb;
    data['additional_cb_type'] = additionalCbType;
    data['additional_cb_amount'] = additionalCbAmount;
    data['special_discount_type'] = specialDiscountType;
    data['special_discount_amount'] = specialDiscountAmount;
    data['special_comment'] = specialComment;
    data['is_donation'] = isDonation;
    data['pref_pickup_time_charge'] = prefPickupTimeCharge;
    data['pref_delivery_time_charge'] = prefDeliveryTimeCharge;
    data['has_pref_pickup_time'] = hasPrefPickupTime;
    data['has_pref_delivery_time'] = hasPrefDeliveryTime;
    data['needs_verification'] = needsVerification;
    data['verified_by'] = verifiedBy;
    data['verified_on'] = verifiedOn;
    data['verified_by_responsible_person'] = verifiedByResponsiblePerson;
    data['is_lf'] = isLf;
    data['is_quickly_pickedup'] = isQuicklyPickedup;
    data['created_on'] = createdOn;
    data['last_modified_on'] = lastModifiedOn;
    data['additional_cb_redeemed'] = additionalCbRedeemed;
    data['additional_cb_redeemed_on'] = additionalCbRedeemedOn;
    data['additional_cb_redeemed_for'] = additionalCbRedeemedFor;
    data['order_taxable_amount'] = orderTaxableAmount;
    data['related_center_id'] = relatedCenterId;
    data['is_returned_order'] = isReturnedOrder;
    data['return_order_id'] = returnOrderId;
    data['total_returned_count'] = totalReturnedCount;
    data['delivery_pack_id'] = deliveryPackId;
    data['delivery_pack_price'] = deliveryPackPrice;
    data['delivery_pack_extra_included'] = deliveryPackExtraIncluded;
    data['is_regular'] = isRegular;
    data['is_senior_citizens'] = isSeniorCitizens;
    data['is_covid_patients'] = isCovidPatients;
    data['covid_patient_amount'] = covidPatientAmount;
    data['is_covid_centers'] = isCovidCenters;
    data['cancellation_charges'] = cancellationCharges;
    data['cancellation_charges_pay'] = cancellationChargesPay;
    data['reschedule_charges'] = rescheduleCharges;
    data['hold_amount'] = holdAmount;
    data['pay_on_pickup'] = payOnPickup;
    data['delivery_charges'] = deliveryCharges;
    if (orderStages != null) {
      data['order_stages'] = orderStages!.map((v) => v.toJson()).toList();
    }
    data['isPickedUp'] = isPickedUp;
    data['isProcessed'] = isProcessed;
    data['isDelivered'] = isDelivered;
    if (service != null) {
      data['service'] = service!.toJson();
    }
    if (orderType != null) {
      data['orderType'] = orderType!.toJson();
    }
    if (orderBookedBys != null) {
      data['orderBookedBy'] = orderBookedBys!.toJson();
    }
    if (pickupPincodes != null) {
      data['pickupPincodes'] = pickupPincodes!.toJson();
    }
    if (pickupCities != null) {
      data['pickupCities'] = pickupCities!.toJson();
    }
    if (pickupStates != null) {
      data['pickupStates'] = pickupStates!.toJson();
    }
    if (timeSlot != null) {
      data['timeSlot'] = timeSlot!.toJson();
    }
    data['formatted_pickup_address'] = formattedPickupAddress;
    if (deliveryPincodes != null) {
      data['deliveryPincodes'] = deliveryPincodes!.toJson();
    }
    if (deliveryCities != null) {
      data['deliveryCities'] = deliveryCities!.toJson();
    }
    if (deliveryStates != null) {
      data['deliveryStates'] = deliveryStates!.toJson();
    }
    if (deliveryTimeSlot != null) {
      data['deliveryTimeSlot'] = deliveryTimeSlot!.toJson();
    }
    data['formatted_delivery_address'] = formattedDeliveryAddress;
    // if (taxes != null) {
    //   data['taxes'] = taxes!.map((v) => v.toJson()).toList();
    // }
    data['offer'] = offer;
    if (orderWiseStages != null) {
      data['orderWiseStages'] =
          orderWiseStages!.map((v) => v.toJson()).toList();
    }
    if (pickupPersonInfo != null) {
      data['PickupPersonInfo'] = pickupPersonInfo!.toJson();
    }
    if (deliveryPersonInfo != null) {
      data['DeliveryPersonInfo'] = deliveryPersonInfo!.toJson();
    }
    if (orderItems != null) {
      data['orderItems'] = orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderStages {
  int? stageOrder;
  int? orderstageId;
  String? stageTitle;
  String? stageStatus;
  String? assignedToId;
  String? assignedTo;
  String? stagedBy;
  String? stageComments;
  String? stagedOn;
  String? stagedLaston;
  String? customerFeedbackRating;
  String? customerFeedbackComment;
  String? customerFeedbackReceivedOn;
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
    assignedToId = json['assigned_to_id'].toString();
    assignedTo = json['assigned_to'];
    stagedBy = json['staged_by'];
    stageComments = json['stage_comments'];
    stagedOn = json['staged_on'];
    stagedLaston = json['staged_laston'];
    customerFeedbackRating = json['customer_feedback_rating'].toString();
    customerFeedbackComment = json['customer_feedback_comment'];
    customerFeedbackReceivedOn = json['customer_feedback_received_on'] == null
        ? ''
        : json['customer_feedback_received_on'].toString();
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

class PickupPincodes {
  String? areaName;
  String? pincode;

  PickupPincodes({this.areaName, this.pincode});

  PickupPincodes.fromJson(Map<String, dynamic> json) {
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

class TimeSlot {
  int? startsOn;
  int? endsOn;

  TimeSlot({this.startsOn, this.endsOn});

  TimeSlot.fromJson(Map<String, dynamic> json) {
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

class Offer {
  int? redemptionId;
  int? customerId;
  int? withOrderId;
  String? createdOn;
  String? redeemedOn;
  String? offerMessage;
  int? offerId;
  String? withCode;
  String? offerType;
  String? offerSubType;
  String? offeredAmount;
  String? offeredMaxAmount;
  String? offeredTotalAmount;
  String? redemptionStatus;

  Offer(
      {this.redemptionId,
      this.customerId,
      this.withOrderId,
      this.createdOn,
      this.redeemedOn,
      this.offerMessage,
      this.offerId,
      this.withCode,
      this.offerType,
      this.offerSubType,
      this.offeredAmount,
      this.offeredMaxAmount,
      this.offeredTotalAmount,
      this.redemptionStatus});

  Offer.fromJson(Map<String, dynamic> json) {
    redemptionId = json['redemption_id'];
    customerId = json['customer_id'];
    withOrderId = json['with_order_id'];
    createdOn = json['created_on'];
    redeemedOn = json['redeemed_on'];
    offerMessage = json['offer_message'];
    offerId = json['offer_id'];
    withCode = json['with_code'];
    offerType = json['offer_type'];
    offerSubType = json['offer_sub_type'];
    offeredAmount = json['offered_amount'];
    offeredMaxAmount = json['offered_max_amount'];
    offeredTotalAmount = json['offered_total_amount'].toString();
    redemptionStatus = json['redemption_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['redemption_id'] = this.redemptionId;
    data['customer_id'] = this.customerId;
    data['with_order_id'] = this.withOrderId;
    data['created_on'] = this.createdOn;
    data['redeemed_on'] = this.redeemedOn;
    data['offer_message'] = this.offerMessage;
    data['offer_id'] = this.offerId;
    data['with_code'] = this.withCode;
    data['offer_type'] = this.offerType;
    data['offer_sub_type'] = this.offerSubType;
    data['offered_amount'] = this.offeredAmount;
    data['offered_max_amount'] = this.offeredMaxAmount;
    data['offered_total_amount'] = this.offeredTotalAmount;
    data['redemption_status'] = this.redemptionStatus;
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

class PickupPersonInfo {
  int? personId;
  String? person;
  String? number;
  String? away;
  String? lat;
  String? lon;

  PickupPersonInfo(
      {this.personId, this.person, this.number, this.away, this.lat, this.lon});

  PickupPersonInfo.fromJson(Map<String, dynamic> json) {
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

class OrderItems {
  int? itemId;
  int? gtypeId;
  String? mainType;
  String? gsubtypeId;
  String? subType;
  String? basePrice;
  int? qty;
  int? rcvdQty;
  String? icon;

  OrderItems(
      {this.itemId,
      this.gtypeId,
      this.mainType,
      this.gsubtypeId,
      this.subType,
      this.basePrice,
      this.qty,
      this.rcvdQty,
      this.icon});

  OrderItems.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    gtypeId = json['gtype_id'];
    mainType = json['main_type'];
    gsubtypeId = json['gsubtype_id'];
    subType = json['sub_type'];
    basePrice = json['base_price'];
    qty = json['qty'];
    rcvdQty = json['rcvd_qty'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['gtype_id'] = this.gtypeId;
    data['main_type'] = this.mainType;
    data['gsubtype_id'] = this.gsubtypeId;
    data['sub_type'] = this.subType;
    data['base_price'] = this.basePrice;
    data['qty'] = this.qty;
    data['rcvd_qty'] = this.rcvdQty;
    data['icon'] = this.icon;
    return data;
  }
}
