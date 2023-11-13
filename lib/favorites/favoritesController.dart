import 'package:get/get.dart';

import '../Models/productmodel.dart';

class FavoriteController extends GetxController {
  RxList<Product> favoriteitems = <Product>[].obs;
  int get leng => favoriteitems.length;

  void addToCart(Product product) {
    favoriteitems.add(product);
    update();
  }

  bool hasProduct(Product e) {
    if (favoriteitems.indexWhere((element) => element.itemId == e.itemId) >=
        0) {
      return true;
    }
    return false;
  }

  toggle(Product prd) {
    int index =
        favoriteitems.indexWhere((element) => element.itemId == prd.itemId);
    if (index >= 0) {
      favoriteitems.removeAt(index);
    } else {
      favoriteitems.add(prd);
    }
    favoriteitems.refresh();
  }

  void delete(int index) {
    favoriteitems.removeAt(index);
    favoriteitems.refresh();
    Get.snackbar('Success', 'Product removed from favorites',
        snackPosition: SnackPosition.BOTTOM);
  }
}
