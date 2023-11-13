
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/orderhistorymodel.dart';
import '../../responsiveclass.dart';
import '../../variables.dart';
import 'orderdetailcontroller.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage(
      {required this.orderDetailController, required this.order, Key? key})
      : super(key: key);
  final OrderDetailController orderDetailController;
  final Ordrlist order;

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Obx(() {
      return Scaffold(
        appBar: AppBar(

          elevation: 1,
          iconTheme: const IconThemeData(
              ),
          title: Text(
            "Order details",
            style: TextStyle(
              fontSize: Responsive.safeBlockVertical * 2.5,

            ),
          ),
        ),
        body: orderDetailController.isloading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Responsive.safeBlockHorizontal * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Responsive.safeBlockVertical * 2),
                    Text(
                      "",
                      style: TextStyle(
                          fontSize: Responsive.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: Responsive.safeBlockVertical),
                    Text(
                      '   Order no: ${order.orderNo}',
                      style: TextStyle(
                        fontSize: Responsive.safeBlockVertical * 2.5,
                      ),
                    ),
                    SizedBox(height: Responsive.safeBlockVertical * 2),
                    Text(
                      '   Order date: ${order.orderDate}',
                      style: TextStyle(
                        fontSize: Responsive.safeBlockVertical * 2.5,
                      ),
                    ),
                    SizedBox(height: Responsive.safeBlockVertical * 2),
                    Text(
                      "Product details",
                      style: TextStyle(
                          fontSize: Responsive.safeBlockVertical * 2.5,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Container(
                      constraints: BoxConstraints(
                          maxHeight: Responsive.safeBlockVerticalWAB * 45,
                          maxWidth: Responsive.safeBlockHorizontal * 100,
                          minHeight: 0,
                          minWidth: 0),
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                SizedBox(
                                  height: Responsive.safeBlockVerticalWAB * 6,
                                  child: Image.network(
                                      orderDetailController.orderHistoryDetail.value.itmlst[index].thumb),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height:
                                              Responsive.safeBlockVerticalWAB *
                                                  .75),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width:
                                                Responsive.safeBlockHorizontal *
                                                    65,
                                            child: Text(
                                              " ${orderDetailController.orderHistoryDetail.value.itmlst[index].itemName}",
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: Responsive
                                                          .safeBlockVerticalWAB *
                                                      2,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 2,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "\u{20B9}${((double.tryParse(orderDetailController.orderHistoryDetail.value.itmlst[index].price) ?? 0) * (orderDetailController.orderHistoryDetail.value.itmlst[index].quantity ?? 0)).toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontSize: Responsive
                                                        .safeBlockVerticalWAB *
                                                    2,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      // SizedBox(
                                      //     height: Responsive.safeBlockVerticalWAB * .5),
                                      // Text(
                                      //   orderDetailController.prdlist[index].itemDesc,
                                      //   overflow: TextOverflow.ellipsis,
                                      //   textAlign: TextAlign.left,
                                      //   style: TextStyle(
                                      //       fontSize:
                                      //           Responsive.safeBlockVerticalWAB * 1.8,
                                      //       color: Colors.indigo),
                                      // ),
                                      SizedBox(
                                          height:
                                              Responsive.safeBlockVerticalWAB *
                                                  .5),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "  Qty x Rate",
                                              style: TextStyle(
                                                  fontSize: Responsive
                                                          .safeBlockVerticalWAB *
                                                      1.8),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${orderDetailController.orderHistoryDetail.value.itmlst[index].quantity} x ${orderDetailController.orderHistoryDetail.value.itmlst[index].price}=${((orderDetailController.orderHistoryDetail.value.itmlst[index].quantity??0) * double.parse(orderDetailController.orderHistoryDetail.value.itmlst[index].price)).toStringAsFixed(2)}",
                                              style: TextStyle(
                                                  fontSize: Responsive
                                                          .safeBlockVerticalWAB *
                                                      1.8),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          const Spacer()
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                              height: Responsive.safeBlockVerticalWAB * 2),
                          padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                          itemCount: orderDetailController
                              .orderHistoryDetail.value.itmlst.length),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Responsive.safeBlockHorizontal * 3,
                          vertical: Responsive.blockSizeVertical * 1.5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.all(Responsive.safeBlockHorizontal * 3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Order amount",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  "\u20b9 ${orderDetailController.orderHistoryDetail.value.subTotal}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600),
                                )
                              ],
                            ),
                            SizedBox(
                                height: Responsive.safeBlockVertical * 1.5),
                            Row(
                              children: [
                                Text(
                                  "Coupon discount",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                    "\u20b9 ${double.tryParse(orderDetailController.orderHistoryDetail.value.discount) ?? 0}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade600))
                              ],
                            ),
                            SizedBox(
                                height: Responsive.safeBlockVertical * 1.5),
                            // const Divider(),
                            // Row(
                            //   children: [
                            //     Text(
                            //       "Subtotal",
                            //       style: TextStyle(
                            //           fontSize: 16,
                            //           color: Colors.grey.shade600),
                            //     ),
                            //     const Expanded(child: SizedBox()),
                            //     Text(
                            //         "\u20b9 ${orderDetailController.orderHistoryDetail.value.subTotal}")
                            //   ],
                            // ),
                            // SizedBox(
                            //     height: Responsive.safeBlockVertical * 1.5),
                            Row(
                              children: [
                                Text(
                                  "GST",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                    "\u20b9 ${double.tryParse(orderDetailController.orderHistoryDetail.value.tax) ?? 0}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade600))
                              ],
                            ),
                            SizedBox(
                                height: Responsive.safeBlockVertical * 1.5),
                            Row(
                              children: [
                                Text(
                                  "Delivery charges",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                    "\u20b9 ${(double.tryParse(orderDetailController.orderHistoryDetail.value.deliveryFee) ?? 0.00)}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade600))
                              ],
                            ),
                            SizedBox(
                                height: Responsive.safeBlockVertical * 1.5),
                            const Divider(),
                            Row(
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey.shade900),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  "\u20b9 ${orderDetailController.orderHistoryDetail.value.totalAmount}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey.shade900),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
