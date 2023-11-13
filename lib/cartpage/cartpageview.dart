import '../cartpage/cartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../checkoutpage/checkoutpage.dart';
import '../loginpage/loginpageview.dart';
import '../responsiveclass.dart';
import '../variables.dart';

class CartPage extends StatelessWidget {
  final CartController _cartController = Get.find();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Scaffold(
      appBar: AppBar(

        title: Text(
          '  My Cart',
          style: TextStyle(
            fontSize: Responsive.safeBlockVertical * 2.50,

          ),
        ),
        elevation: 1,
      ),
      body: Obx(() {
        if (_cartController.cartitems.isEmpty) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Your Cart is empty'),
                // Text('Your Cart is empty'),
              ],
            ),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Responsive.safeBlockHorizontal * 2,
                      vertical: Responsive.safeBlockHorizontal * 2),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: Responsive.safeBlockHorizontal * 48,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0.0, right: 10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: Responsive.safeBlockHorizontal * 33,
                                    height: Responsive.safeBlockHorizontal * 33,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        _cartController.cartitems[index].thumb,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    width: Responsive.safeBlockHorizontal * 20,
                                    // width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.red),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                              onTap: () {
                                                _cartController
                                                    .decreaseQuantity(index);
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                                size: 20,
                                              )),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 3),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 2),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: Colors.white),
                                          child: Obx(() {
                                            return Text(
                                              '${_cartController.cartitems[index].quantity}',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            );
                                          }),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                              onTap: () {
                                                _cartController
                                                    .increaseQuantity(index);
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "\u20b9 ${_cartController.amount(index)}",
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    _cartController.cartitems[index].itemName,
                                    maxLines: 2,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize:
                                          Responsive.blockSizeVertical * 2.1,
//                    fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  // Spacer(),
                                  // SizedBox(height: 10.0),
                                  // Row(
                                  //   children: <Widget>[
                                  //     SmoothStarRating(
                                  //       starCount: 1,
                                  //       color: Constants.ratingBG,
                                  //       allowHalfRating: true,
                                  //       rating: 5.0,
                                  //       size: 12.0,
                                  //     ),
                                  //     SizedBox(width: 6.0),
                                  //     Text(
                                  //       "5.0 (23 Reviews)",
                                  //       style: TextStyle(
                                  //         fontSize: 12,
                                  //         fontWeight: FontWeight.w300,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),

                                  Row(
                                    children: <Widget>[
                                      // Text(
                                      //   "20 Pieces",
                                      //   style: TextStyle(
                                      //     fontSize: 11.0,
                                      //     fontWeight: FontWeight.w300,
                                      //   ),
                                      // ),
                                      // SizedBox(width: 10.0),
                                      Text(
                                        '\u20b9${_cartController.cartitems[index].price}',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w900,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Spacer(),

                                  Text(
                                    _cartController.cartitems[index].itemDesc,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 11.0, color: Colors.grey,
                                      // fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: _cartController.leng,
                  ),
                ),
              ),
              Visibility(
                visible: _cartController.cartitems.isNotEmpty,
                child: SizedBox(
                  height: AppBar().preferredSize.height * 1.2,
                  // color: Colors.red,
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total ${_cartController.totalItems()} items",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            Text("\u{20B9}${_cartController.totalAmount()}")
                          ],
                        ),
                        const Spacer(),
                        MaterialButton(
                          onPressed: () async {
                            // log('sddhsfd ${await checkedLogin()}');
                            if (await checkedLogin()) {
                              Get.to(() => CheckOutPage());
                            } else {
                              Get.to(() => LoginPage(
                                    replaceTo: loginReplaceTO.checkout,
                                  ));
                            }
                          },
                          color: Colors.green,
                          child: const Text("Checkout",
                              style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      }),
    );
  }
}
