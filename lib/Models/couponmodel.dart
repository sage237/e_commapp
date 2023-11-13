// To parse this JSON data, do
//
//     final coupons = couponsFromJson(jsonString);

//Discount coupon

import 'dart:convert';

Coupons couponsFromJson(String str) => Coupons.fromJson(json.decode(str));

String couponsToJson(Coupons data) => json.encode(data.toJson());

class Coupons {
  Coupons({
    required this.lstincno,
  });

  List<Lstincno> lstincno;

  factory Coupons.fromJson(Map<String, dynamic> json) => Coupons(
        lstincno: List<Lstincno>.from(
            json["lstincno"].map((x) => Lstincno.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lstincno": List<dynamic>.from(lstincno.map((x) => x.toJson())),
      };
}

class Lstincno {
  Lstincno({
    required this.id,
    required this.couponName,
    required this.couponCode,
    required this.startDate,
    required this.endDate,
    required this.couponTerms,
    required this.usedType,
    required this.offerType,
    required this.amount,
    required this.cStatus,
    required this.image,
  });

  int id;
  String couponName;
  String couponCode;
  String startDate;
  String endDate;
  String couponTerms;
  String usedType;
  String offerType;
  String amount;
  String cStatus;
  String image;

  factory Lstincno.fromJson(Map<String, dynamic> json) => Lstincno(
        id: json["Id"],
        couponName: json["Coupon_Name"],
        couponCode: json["CouponCode"],
        startDate: json["Start_date"],
        endDate: json["End_Date"],
        couponTerms: json["Coupon_Terms"],
        usedType: json["UsedType"],
        offerType: json["OfferType"],
        amount: json["Amount"],
        cStatus: json["CStatus"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Coupon_Name": couponName,
        "CouponCode": couponCode,
        "Start_date": startDate,
        "End_Date": endDate,
        "Coupon_Terms": couponTerms,
        "UsedType": usedType,
        "OfferType": offerType,
        "Amount": amount,
        "CStatus": cStatus,
        "Image": image,
      };
}

// To parse this JSON data, do
//
//     final couponss = couponssFromJson(jsonString);

//Main Coupon herer

Couponss couponssFromJson(String str) => Couponss.fromJson(json.decode(str));

String couponssToJson(Couponss data) => json.encode(data.toJson());

class Couponss {
  Couponss({
    required this.requsiotionCol,
    required this.statuscode,
    this.error,
    required this.total,
  });

  List<RequsiotionCol> requsiotionCol;
  String statuscode;
  dynamic error;
  String total;

  factory Couponss.fromJson(Map<String, dynamic> json) => Couponss(
        requsiotionCol: List<RequsiotionCol>.from(
            json["RequsiotionCol"].map((x) => RequsiotionCol.fromJson(x))),
        statuscode: json["statuscode"],
        error: json["error"],
        total: json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "RequsiotionCol":
            List<dynamic>.from(requsiotionCol.map((x) => x.toJson())),
        "statuscode": statuscode,
        "error": error,
        "Total": total,
      };
}

class RequsiotionCol {
  RequsiotionCol({
    required this.couponName,
    required this.couponCode,
    required this.offerShow,
    required this.startDate,
    required this.endDate,
    required this.usedType,
    required this.cStatus,
    required this.couponType,
    required this.couponId,
    required this.imgName,
    required this.qrImage,
    required this.shareDate,
    required this.avail,
    required this.saveId,
    required this.saveName,
    required this.qty,
    required this.terms,
    required this.totalRecQTy,
    required this.shareGiftId,
  });

  String couponName;
  String couponCode;
  String offerShow;
  String startDate;
  String endDate;
  String usedType;
  String cStatus;
  String couponType;
  String couponId;
  String imgName;
  String qrImage;
  String shareDate;
  String avail;
  String saveId;
  String saveName;
  String qty;
  String terms;
  String totalRecQTy;
  String shareGiftId;

  factory RequsiotionCol.fromJson(Map<String, dynamic> json) => RequsiotionCol(
        couponName: json["Coupon_Name"],
        couponCode: json["CouponCode"],
        offerShow: json["OfferShow"],
        startDate: json["Start_date"],
        endDate: json["End_Date"],
        usedType: json["UsedType"],
        cStatus: json["CStatus"],
        couponType: json["Coupon_Type"],
        couponId: json["CouponID"],
        imgName: json["ImgName"],
        qrImage: json["QRImage"],
        shareDate: json["ShareDate"],
        avail: json["avail"],
        saveId: json["SaveID"],
        saveName: json["SaveName"],
        qty: json["QTY"],
        terms: json["Terms"],
        totalRecQTy: json["TotalRecQTy"],
        shareGiftId: json["ShareGiftID"],
      );

  Map<String, dynamic> toJson() => {
        "Coupon_Name": couponName,
        "CouponCode": couponCode,
        "OfferShow": offerShow,
        "Start_date": startDate,
        "End_Date": endDate,
        "UsedType": usedType,
        "CStatus": cStatus,
        "Coupon_Type": couponType,
        "CouponID": couponId,
        "ImgName": imgName,
        "QRImage": qrImage,
        "ShareDate": shareDate,
        "avail": avail,
        "SaveID": saveId,
        "SaveName": saveName,
        "QTY": qty,
        "Terms": terms,
        "TotalRecQTy": totalRecQTy,
        "ShareGiftID": shareGiftId,
      };
}
