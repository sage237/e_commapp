
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Models/orderhistorymodel.dart';

class OrderHistoryController extends GetxController {
  RxList<Ordrlist> orderlist = <Ordrlist>[].obs;
  RxBool isloading = true.obs;
  @override
  void onInit() {
    getOrderHistory();
    super.onInit();
  }

  Future<void> getOrderHistory() async {


    try {
      CollectionReference cats= FirebaseFirestore.instance.collection('orders');

      final data =await cats.get();
      if(data.docs.isNotEmpty) {
        log('Data ${data.docs[0].data()}');
        for (var element in data.docs) {
          orderlist.add(Ordrlist(orderId: int.tryParse('${element['orderid']}')??0, orderNo: '${element['orderno']}', orderDate: element['orderDate'], orderAmount: '${element['orderamount']}', orderStatus: element['status']));
        }

      } else {
        Get.snackbar('Error', 'Data not found',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log('Exc $e');
      Get.snackbar('Error', 'Please try again',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isloading(false);
    }
  }
}
