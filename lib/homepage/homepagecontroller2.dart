import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/categorymodel.dart';
import '../Models/couponmodel.dart';
import '../Models/productmodel.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    getData();
    getOffers();

    super.onInit();
  }

  Rx<PageController> controller = PageController().obs;
  RxList<Lstincno> offerlist = <Lstincno>[].obs;
  RxList<Ctgrylst> categories = <Ctgrylst>[].obs;
  RxList<Product> popularprd = <Product>[].obs;
  RxList<Product> ourspclty = <Product>[].obs;
  RxBool isloading = true.obs;

  getData() async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    try {
      CollectionReference cats= fireStore.collection('categories');

      final data =await cats.get();
      if(data.docs.isNotEmpty) {
        for (var element in data.docs) {
        categories.add(Ctgrylst(cateId: element['id'], cateName: element['name'], cateImage: 'assets/cates/${element['id']}.jpg'));
      }
      }

    } catch (e) {
      log("Cat Exception $e");
    }
    try {
      CollectionReference cats= fireStore.collection('products');

      final data =await cats.get();
      if(data.docs.isNotEmpty) {
        for (var element in data.docs) {
          log('Element ${(element.data() as Map).toString()}');
          if(element['tags'].contains('popular')) {
            popularprd.add(Product(rating:'${element['rating']}' , itemId: '${element['itemID']}', itemName: element['itemName'], itemDesc: element['itemDesc'], image: ['assets/items/${element['itemID']}/1.jpg','assets/items/${element['itemID']}/2.jpg','assets/items/${element['itemID']}/3.jpg'], price: '${element['price']}', thumb: '${element['thumb']}'));
          }
      }
      }


    } catch (e) {
      log("Popular  Exception $e");
    }
    try {


        CollectionReference cats= fireStore.collection('products');

        final data =await cats.get();
        if(data.docs.isNotEmpty) {
          for (var element in data.docs) {
            log('Element ${(element.data() as Map)['tags'].toString()}');
            if(element['tags'].contains('special')) {
              ourspclty.add(Product(rating:'${element['rating']}',itemId: '${element['itemID']}', itemName: element['itemName'], itemDesc: element['itemDesc'], image: ['assets/items/${element['itemID']}/1.jpg','assets/items/${element['itemID']}/2.jpg','assets/items/${element['itemID']}/3.jpg'], price: '${element['price']}', thumb: '${element['thumb']}'));
            }
          }
        }

    } catch (e) {
      // log("Exception $e");
    } finally {
      categories.refresh();
      popularprd.refresh();
      ourspclty.refresh();
      isloading(false);
    }
  }

  void getOffers() async {

    try {

      if (true) {
        // offerlist.value = couponsFromJson(response.body).lstincno;  TODO OFFERLIST
      }
      // log('Coupon list ${coupons.length}');
    } catch (e) {
      // log("Error $e");
    } finally {
      offerlist.refresh();
    }
  }
}
