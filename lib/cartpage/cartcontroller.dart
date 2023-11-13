import 'package:get/get.dart';

import '../Models/productmodel.dart';

class CartController extends GetxController {
  RxList<Product> cartitems = <Product>[].obs;
  int get leng => cartitems.length;

  ///Adds A product to cart
  void addToCart(Product product) {
    cartitems.add(product);
    update();
    cartitems.refresh();
  }

  ///Increase quantity of product in cart
  void increaseQuantity(int index) {
    int quantity = cartitems[index].quantity ?? 0;
    quantity += 1;
    cartitems[index].quantity = quantity;
    cartitems.refresh();
  }

  ///Decreases quantity of prodduct in cart, removes product from cart if value is zero
  void decreaseQuantity(int index) {
    int quantity = cartitems[index].quantity ?? 0;
    quantity -= 1;
    if (quantity <= 0) {
      cartitems.removeAt(index);
    } else {
      cartitems[index].quantity = quantity;
    }
    cartitems.refresh();
  }

  ///Get total amount of a product
  amount(int index) {
    int quantity = cartitems[index].quantity ?? 0;
    double price = double.tryParse(cartitems[index].price) ?? 0;
    return quantity * price;
  }

  totalItems() {
    int quantity = 0;
    for (var element in cartitems) {
      quantity += element.quantity ?? 0;
    }
    return quantity;
  }

  totalAmount() {
    double quantity = 0;
    for (var element in cartitems) {
      quantity += (element.quantity ?? 0) *
          (double.tryParse(element.price) ?? 0);
    }
    return quantity;
  }

  bool hasProduct(Product e) {
    if (cartitems.indexWhere((element) => element.itemId == e.itemId) >= 0) {
      return true;
    }
    return false;
  }
}
//
