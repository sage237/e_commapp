// To parse this JSON data, do
//
//     final orderHistoryDetail = orderHistoryDetailFromJson(jsonString);


import '../Models/productmodel.dart';

class OrderHistoryDetail {
  OrderHistoryDetail({
    required this.error,
    required this.statuscode,
    required this.subTotal,
    required this.discount,
    required this.deliveryFee,
    required this.tax,
    required this.totalAmount,
    required this.itmlst,
  });

  String error;
  String statuscode;
  String subTotal;
  String discount;
  String deliveryFee;
  String tax;
  String totalAmount;
  List<Product> itmlst;

    Map<String, dynamic> toJson() => {
        "error": error,
        "statuscode": statuscode,
        "SubTotal": subTotal,
        "Discount": discount,
        "DeliveryFee": deliveryFee,
        "Tax": tax,
        "TotalAmount": totalAmount,
        "itmlst": List<dynamic>.from(itmlst.map((x) => x.toJson())),
      };
}
