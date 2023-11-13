import 'dart:ui';
import '../orderhistory/orderdetails/orderdetailcontroller.dart';
import '../orderhistory/orderdetails/orderdetailview.dart';
import '../orderhistory/orderhistoryController.dart';
import '../responsiveclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListPage extends StatelessWidget {
  OrderListPage({Key? key}) : super(key: key);
  final OrderHistoryController _orderHistoryController =
      Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Obx(() {
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(

              elevation: 1,


              title: Text(
                "Your Order",
                style: TextStyle(
                  fontSize: Responsive.safeBlockVertical * 2.5,

                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: Responsive.safeBlockHorizontal * 3,
                ),
                Expanded(
                    child: RefreshIndicator(
                  onRefresh: _orderHistoryController.getOrderHistory,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Responsive.safeBlockHorizontal * 3,
                          horizontal: Responsive.safeBlockHorizontal * 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: '  Order ID: ',
                                    style: TextStyle(fontSize: 18)),
                                TextSpan(
                                    text: _orderHistoryController
                                        .orderlist[index].orderNo,
                                    style: const TextStyle(

                                        fontSize: 18)),
                              ]),
                            ),
                            SizedBox(
                              height: Responsive.safeBlockVertical * 1.5,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.grey.shade300,
                                          spreadRadius: 1)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: Responsive.safeBlockVerticalWAB * 3,
                                    backgroundColor: Colors.white,
                                    child: const Icon(Icons.history),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('  Order date: '),
                                    Text(
                                      "    ${_orderHistoryController.orderlist[index].orderDate}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Responsive.safeBlockVertical * 1.5,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.grey.shade300,
                                          spreadRadius: 1)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: Responsive.safeBlockVerticalWAB * 3,
                                    backgroundColor: Colors.white,
                                    child: const Icon(Icons.currency_rupee),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('  Order Amount:'),
                                    Text(
                                      '    \u20b9 ${_orderHistoryController.orderlist[index].orderAmount}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Responsive.safeBlockVertical * 1.5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.grey.shade300,
                                          spreadRadius: 1)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: Responsive.safeBlockVerticalWAB * 3,
                                    backgroundColor: Colors.white,
                                    child: const Icon(Icons.query_stats),
                                  ),
                                ),
                                Column(
                                  children: [
                                    const Text('  Order Status:'),
                                    Text(
                                      "   ${_orderHistoryController.orderlist[index].orderStatus}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Text(''),
                            const Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Get.to(() => OrderDetailsPage(
                                      order: _orderHistoryController
                                          .orderlist[index],
                                      orderDetailController: Get.put(
                                          OrderDetailController(
                                              orderid: _orderHistoryController
                                                  .orderlist[index].orderId
                                                  .toString()))));
                                },
                                child: const Text('View details'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    itemCount: _orderHistoryController.orderlist.length,
                  ),
                ))
              ],
            ),
          ),
          Visibility(
            visible: _orderHistoryController.isloading.value,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                color: Colors.black38,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
