import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import '../Models/categorymodel.dart';
import '../Models/productmodel.dart';
import 'package:get/get.dart';

enum sort {
  priceHighToLow,
  priceLowToHigh,
  highestRated,
  lowestRated,
}

class ItemListController extends GetxController {
  List<Map<String, dynamic>> srotlist = [
    {'name': 'Price High to low', 'value': sort.priceHighToLow},
    {'name': 'Price Low to high', 'value': sort.priceLowToHigh},
    {'name': 'Highest Rated First', 'value': sort.highestRated},
    {'name': 'Lowest Rated First', 'value': sort.lowestRated},
  ];

  ItemListController({this.cateid});
  Ctgrylst? cateid;

  RxList<Product> productlisrt = <Product>[].obs;
  RxList<Product> productlisrtsearch = <Product>[].obs;

  RxBool isloading = true.obs;
  RxBool isSearch = false.obs;
  RxBool isSearchWidget = false.obs;

  @override
  void onInit() {
    getProducts('Default'); // TODO: implement onInit

    super.onInit();
  }

  void getProducts(String sortVal) async {
    try {
      CollectionReference cats =
          FirebaseFirestore.instance.collection('products');

      final data = await cats.get();
      if (data.docs.isNotEmpty) {
        for (var element in data.docs) {
          if (cateid != null) if (element['catID'] == cateid!.cateId) {
            productlisrt.add(Product(
                itemId: '${element['itemID']}',
                itemName: element['itemName'],
                itemDesc: element['itemDesc'],
                image: [
                  'assets/items/${element['itemID']}/1.jpg',
                  'assets/items/${element['itemID']}/2.jpg',
                  'assets/items/${element['itemID']}/3.jpg'
                ],
                price: '${element['price']}',
                thumb: '${element['thumb']}', rating: '${element['rating']}'));
          } else {
            productlisrt.add(Product(
                itemId: '${element['itemID']}',
                itemName: element['itemName'],
                itemDesc: element['itemDesc'],
                image: [
                  'assets/items/${element['itemID']}/1.jpg',
                  'assets/items/${element['itemID']}/2.jpg',
                  'assets/items/${element['itemID']}/3.jpg'
                ],
                price: '${element['price']}',
                thumb: '${element['thumb']}', rating: '${element['rating']}'));
          }
        }
      } else {
        Get.snackbar('Error', 'Something went wrong,please try again',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong,please try again',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      productlisrt.refresh();
      isloading(false);
    }
  }

  void searchItem(String data) {
    productlisrtsearch.clear();
    if (data.isEmpty) {
      isSearch(false);
      return;
    }
    isSearch(true);
    for (var element in productlisrt) {
      if (element.toJson().toString().contains(data)) {
        productlisrtsearch.add(element);
      }
    }
  }

  void showOrHideSearchWidget(bool value) {
    isSearchWidget(value);
    if (!value) isSearch(false);
  }

  void sortList(Map sortingId) {
    sort val = sortingId['value'];
    switch (val) {
      case sort.priceHighToLow:
        productlisrt.sort((a, b) {
          return double.parse(b.price).compareTo(double.parse(a.price));
        });
        productlisrtsearch.sort((a, b) {
          return double.parse(b.price).compareTo(double.parse(a.price));
        });
        break;
      case sort.priceLowToHigh:
        productlisrt.sort((a, b) {
          return double.parse(a.price).compareTo(double.parse(b.price));
        });
        productlisrtsearch.sort((a, b) {
          return double.parse(a.price).compareTo(double.parse(b.price));
        });
        break;
      case sort.highestRated:
        productlisrt.sort((a,b){
          return  double.parse(b.rating).compareTo(double.parse(a.rating));
        });
        productlisrtsearch.sort((a,b){
          return  double.parse(b.rating).compareTo(double.parse(a.rating));
        });
        break;
      case sort.lowestRated:
        productlisrt.sort((a, b) {
          return double.parse(a.rating).compareTo(double.parse(b.rating));
        });
        productlisrtsearch.sort((a, b) {
          return double.parse(a.rating).compareTo(double.parse(b.rating));
        });
    }
  }
}
