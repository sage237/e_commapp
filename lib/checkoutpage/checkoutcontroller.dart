import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/homepage/homepageView2.dart';
import 'package:intl/intl.dart';
import '../cartpage/cartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/productmodel.dart';

class CheckoutController extends GetxController {
  RxBool ischecking = false.obs;
  RxBool isloading = false.obs;
  RxBool isinvalid = false.obs;
  RxBool isvalid = false.obs;
  RxDouble gstpercent = 0.0.obs;
  RxDouble deliveryfee = 0.0.obs;
  RxDouble discount = 0.0.obs;
  dynamic selectedcoupon;
  final CartController _cartController = Get.find();

  RxString paymode = 'Cash On Delivery'.obs;

  @override
  void onInit() {
    getGSTCharge();
    //CouponList
    // log("OnInit");
    super.onInit();
  }

  getGSTCharge() async {
    try {
      gstpercent.value = 18;
      deliveryfee.value = 30;
    } catch (e) {}
  }

  calculateGST(double subtotal) {
    return (subtotal / 100) * gstpercent.value;
  }

  subTotal(double cartamount) {
    return cartamount - discount.value;
  }

  totalPayableAmount(double subtotal) {
    return subtotal + calculateGST(subtotal) + deliveryfee.value;
  }

  checkout(
      {required double subamount,
      required double disamount,
      required double taxamount,
      required double totalpaid,
      required List<Product> list}) async {

    var sp = await SharedPreferences.getInstance();
    var itemIDs=[];
    for (var element in list) {
      itemIDs.add("${element.itemId}");
    }

    isloading(true);
    try {
      final firebase = FirebaseFirestore.instance.collection('orders');
     final res= await firebase.add({
        'couponcode': selectedcoupon != null ? selectedcoupon.couponCode : '',
        'custid': sp.getString('memberid'),
        'deliveryCharge': '${deliveryfee.value}',
        'items': itemIDs.join(','),
        'orderDate': DateFormat('dd-MMM-yyyy hh:mm:ss aa').format(DateTime.now()),
        'orderamount': '$totalpaid',
        'orderid': '${DateTime.now().millisecondsSinceEpoch}',
        'orderno': '${DateTime.now().millisecondsSinceEpoch}',
        'payMode': paymode.value,
        'status': 'Order Placed',
        'subAmount': '$subamount',
        'taxAmount': '$taxamount',
        'totalAmount': '$totalpaid',
        'totalDiscount': '$disamount',
      }).then((value){
       _cartController.cartitems.clear();
       Get.dialog(WillPopScope(
         onWillPop: () async => false,
         child: Dialog(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(4.0)),
           child: Stack(
             clipBehavior: Clip.none,
             alignment: Alignment.topCenter,
             children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     const Text(
                       "Success",
                       style: TextStyle(
                           fontSize: 18, fontWeight: FontWeight.bold),
                     ),
                     const SizedBox(
                       height: 15,
                     ),
                     const Text("Ordered successfully"),
                     const SizedBox(
                       height: 5,
                     ),
                     const SizedBox(
                       height: 20,
                     ),
                     MaterialButton(
                       onPressed: () {
                         Get.offAll(() => HomePage2());
                       },
                       color: Colors.green.shade400,
                       child: const Text(
                         'Ok',
                         style: TextStyle(color: Colors.white),
                       ),
                     )
                   ],
                 ),
               ),
               const Positioned(
                   top: -30,
                   child: CircleAvatar(
                     backgroundColor: Colors.black,
                     radius: 30,
                     child: CircleAvatar(
                         backgroundColor: Colors.white,
                         radius: 29.0,
                         child: Icon(Icons.celebration)),
                   )),
             ],
           ),
         ),
       ));
     }).catchError((onError){
       Get.dialog(AlertDialog(
         alignment: Alignment.center,
         title: const Text(
           "Something went wrong",
           style: TextStyle(color: Colors.red),
         ),
         content: const Text(
           "Please try again",
           style: TextStyle(color: Colors.red),
         ),
         actions: [
           TextButton(
               onPressed: () {
                 Get.back();
               },
               child: const Text("Ok"))
         ],
       ));
     });


    } catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isloading.value = false;
    }
  }

  void selectCoupon(dynamic coupon) {
    selectedcoupon = coupon;
  }

  calculateDiscount(double cartamount) {
    if (selectedcoupon == null) {
      discount(0.0);
    } else if (selectedcoupon.offerType == 'Percent') {
      discount.value = cartamount -
          cartamount * (double.tryParse(selectedcoupon.amount) ?? 0.0) / 100;
    }
  }

  void changePayMode(String? value) {
    if (value != null) paymode.value = value;
  }
}
