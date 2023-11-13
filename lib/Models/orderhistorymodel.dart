// To parse this JSON data, do
//
//     final orderHistory = orderHistoryFromJson(jsonString);

import 'dart:convert';

OrderHistory orderHistoryFromJson(String str) =>
    OrderHistory.fromJson(json.decode(str));

String orderHistoryToJson(OrderHistory data) => json.encode(data.toJson());

class OrderHistory {
  OrderHistory({
    required this.ordrlist,
  });

  List<Ordrlist> ordrlist;

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
        ordrlist: List<Ordrlist>.from(
            json["Ordrlist"].map((x) => Ordrlist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Ordrlist": List<dynamic>.from(ordrlist.map((x) => x.toJson())),
      };
}

class Ordrlist {
  Ordrlist({
    required this.orderId,
    required this.orderNo,
    required this.orderDate,
    required this.orderAmount,
    required this.orderStatus,
  });

  int orderId;
  String orderNo;
  String orderDate;
  String orderAmount;
  String orderStatus;

  factory Ordrlist.fromJson(Map<String, dynamic> json) => Ordrlist(
        orderId: json["OrderID"],
        orderNo: json["OrderNo"],
        orderDate: json["OrderDate"],
        orderAmount: json["OrderAmount"],
        orderStatus: json["OrderStatus"],
      );

  Map<String, dynamic> toJson() => {
        "OrderID": orderId,
        "OrderNo": orderNo,
        "OrderDate": orderDate,
        "OrderAmount": orderAmount,
        "OrderStatus": orderStatus,
      };
}
