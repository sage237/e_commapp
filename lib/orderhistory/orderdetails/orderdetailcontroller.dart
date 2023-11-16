
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/orderhistorydetalmodel.dart';
import '../../Models/productmodel.dart';

class OrderDetailController extends GetxController {
  OrderDetailController({required this.orderid});

  String orderid;
  late Rx<OrderHistoryDetail> orderHistoryDetail;
  RxBool isloading = true.obs;

  @override
  void onInit() {
    getItemDetails();
    super.onInit();
 }

  void getItemDetails() async {
   try {
      CollectionReference cats =
          FirebaseFirestore.instance.collection('orders');
      var myOrder;
      List<Product> prdlist = [];
      final data = await cats.get();
      if (data.docs.isNotEmpty) {
        myOrder = data.docs
            .firstWhere((element) => '${element['orderid']}' == orderid);
        log('Items ${myOrder['items']}');
        for(int i=0;i<myOrder['items'].toString().split(',').length;i++) {
          var elemenx = myOrder['items'].toString().split(',')[i];
          var qty = myOrder['quantities'].toString().split(',')[i];
          try {
            CollectionReference cats =
            FirebaseFirestore.instance.collection('products');

            final data = await cats.get();
            if (data.docs.isNotEmpty) {
              for (var element in data.docs) {
                log('Element $elemenx ${element['itemID']}');
                if ('${element['itemID']}' == '$elemenx') {
                  prdlist.add(Product(
                      itemId: '${element['itemID']}',
                      itemName: element['itemName'],
                      itemDesc: element['itemDesc'],
                      quantity: int.tryParse('${qty}'),
                      image: [
                        'assets/items/${element['itemID']}/1.jpg',
                        'assets/items/${element['itemID']}/2.jpg',
                        'assets/items/${element['itemID']}/3.jpg'
                      ],
                      price: '${element['price']}',
                      thumb: '${element['thumb']}',
                      rating: '${element['rating']}'));
                }
              }
            }
          } catch (e) {
            log("Popular  Exception $e");
          }
        }
        orderHistoryDetail = OrderHistoryDetail(
            error: 'success',
            statuscode: '200',
            subTotal: '${myOrder['subAmount']}',
            discount: '${myOrder['totalDiscount']}',
            deliveryFee: '${myOrder['deliveryCharge']}',
            tax: '${myOrder['taxAmount']}',
            totalAmount: '${myOrder['totalAmount']}',
            itmlst: prdlist).obs;
      }
    }
    catch(e){
     log('Excepton $e');
      Get.snackbar(
        "Error",
        "$e",
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    finally{
     isloading(false);
    }
  }
}
