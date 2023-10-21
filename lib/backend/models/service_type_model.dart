class ServiceTypeModel {
  bool? success;
  Data? data;

  ServiceTypeModel({this.success, this.data});

  ServiceTypeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? status;
  List<DataList>? list;

  Data({this.status, this.list});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['list'] != null) {
      list = <DataList>[];
      json['list'].forEach((v) {
        list!.add(DataList.fromJson(v));
      });
    }
  }
}

class DataList {
  int? ordertypeId;
  int? serviceId;
  String? typeName;
  int? typeStatus;
  String? typeIcon;
  int? deliverInHrs;
  int? allowUserToChooseGarments;
  String? charges;
  String? minOrdVal;
  int? minGarments;
  int? maxGarments;
  String? fixCharge;
  int? applyFixChargeForLessThanQty;
  int? sortingOrder;
  int? isInstant;
  int? otSun;
  int? otMon;
  int? otTue;
  int? otWed;
  int? otThu;
  int? otFri;
  int? otSat;
  String? allowPayOnDeliveryUpto;
  String? createdOn;
  String? lastModifiedOn;

  DataList(
      {this.ordertypeId,
      this.serviceId,
      this.typeName,
      this.typeStatus,
      this.typeIcon,
      this.deliverInHrs,
      this.allowUserToChooseGarments,
      this.charges,
      this.minOrdVal,
      this.minGarments,
      this.maxGarments,
      this.fixCharge,
      this.applyFixChargeForLessThanQty,
      this.sortingOrder,
      this.isInstant,
      this.otSun,
      this.otMon,
      this.otTue,
      this.otWed,
      this.otThu,
      this.otFri,
      this.otSat,
      this.allowPayOnDeliveryUpto,
      this.createdOn,
      this.lastModifiedOn});

  DataList.fromJson(Map<String, dynamic> json) {
    ordertypeId = json['ordertype_id'];
    serviceId = json['service_id'];
    typeName = json['type_name'];
    typeStatus = json['type_status'];
    typeIcon = json['type_icon'];
    deliverInHrs = json['deliver_in_hrs'];
    allowUserToChooseGarments = json['allow_user_to_choose_garments'];
    charges = json['charges'];
    minOrdVal = json['min_ord_val'];
    minGarments = json['min_garments'];
    maxGarments = json['max_garments'];
    fixCharge = json['fix_charge'];
    applyFixChargeForLessThanQty = json['apply_fix_charge_for_less_than_qty'];
    sortingOrder = json['sorting_order'];
    isInstant = json['is_instant'];
    otSun = json['ot_sun'];
    otMon = json['ot_mon'];
    otTue = json['ot_tue'];
    otWed = json['ot_wed'];
    otThu = json['ot_thu'];
    otFri = json['ot_fri'];
    otSat = json['ot_sat'];
    allowPayOnDeliveryUpto = json['allow_pay_on_delivery_upto'];
    createdOn = json['created_on'];
    lastModifiedOn = json['last_modified_on'];
  }
}
