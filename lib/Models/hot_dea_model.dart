// To parse this JSON data, do
//
//     final offercoupons = offercouponsFromJson(jsonString);

import 'dart:convert';

HotDeal offercouponsFromJson(String str) => HotDeal.fromJson(json.decode(str));

String offercouponsToJson(HotDeal data) => json.encode(data.toJson());

class HotDeal {
  HotDeal({
    required this.error,
    required this.statuscode,
    required this.total,
    required this.oferlst,
  });

  String error;
  String statuscode;
  String total;
  List<Oferlst> oferlst;

  factory HotDeal.fromJson(Map<String, dynamic> json) => HotDeal(
        error: json["error"],
        statuscode: json["statuscode"],
        total: json["Total"],
        oferlst:
            List<Oferlst>.from(json["oferlst"].map((x) => Oferlst.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "statuscode": statuscode,
        "Total": total,
        "oferlst": List<dynamic>.from(oferlst.map((x) => x.toJson())),
      };
}

class Oferlst {
  Oferlst({
    required this.offerId,
    required this.couponType,
    required this.offerName,
    required this.saleAmount,
    required this.offerAmount,
    required this.couponCode,
    required this.entryDate,
    required this.validity,
    required this.terms,
    required this.image,
    required this.todayStatus,
    required this.offerStatus,
    required this.offerBalance,
  });

  int offerId;
  String couponType;
  String offerName;
  String saleAmount;
  String offerAmount;
  String couponCode;
  String entryDate;
  String validity;
  String terms;
  String image;
  String todayStatus;
  String offerStatus;
  String offerBalance;

  factory Oferlst.fromJson(Map<String, dynamic> json) => Oferlst(
        offerId: json["OfferID"],
        couponType: json["CouponType"],
        offerName: json["OfferName"],
        saleAmount: json["SaleAmount"],
        offerAmount: json["OfferAmount"],
        couponCode: json["CouponCode"],
        entryDate: json["EntryDate"],
        validity: json["Validity"],
        terms: json["Terms"],
        image: json["Image"],
        todayStatus: json["TodayStatus"],
        offerStatus: json["OfferStatus"],
        offerBalance: json["OfferBalance"],
      );

  Map<String, dynamic> toJson() => {
        "OfferID": offerId,
        "CouponType": couponType,
        "OfferName": offerName,
        "SaleAmount": saleAmount,
        "OfferAmount": offerAmount,
        "CouponCode": couponCode,
        "EntryDate": entryDate,
        "Validity": validity,
        "Terms": terms,
        "Image": image,
        "TodayStatus": todayStatus,
        "OfferStatus": offerStatus,
        "OfferBalance": offerBalance,
      };
}
