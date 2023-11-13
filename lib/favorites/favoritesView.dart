import '../Models/productmodel.dart';
import '../favorites/favoritesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cartpage/cartcontroller.dart';
import '../responsiveclass.dart';
import '../variables.dart';

class FavoritePage extends StatelessWidget {
  final FavoriteController _favoriteController = Get.find();
  final CartController _cartController = Get.find();

  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Scaffold(
      appBar: AppBar(


        title: Text(
          '  My favorites',
          style: TextStyle(

              // color: Colors.black,
              fontSize: Responsive.safeBlockVertical * 2.50),
          // style: TextStyle(color: Colors.black),
        ),
        // backgroundColor: Colors.white,
        // elevation: 1,
      ),
      body: Obx(() {
        if (_favoriteController.favoriteitems.isEmpty) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Your favorite list is empty'),
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
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          height: Responsive.safeBlockHorizontal * 35,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0, right: 10.0),
                                child: SizedBox(
                                  // width: Responsive.safeBlockHorizontal * 33,
                                  height: Responsive.safeBlockHorizontal * 33,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      _favoriteController.favoriteitems[index].thumb,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceEvenly,
                                  // mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Text(
                                      _favoriteController
                                          .favoriteitems[index].itemName,
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

                                    const Row(
                                      children: <Widget>[
                                        // Text(
                                        //   "20 Pieces",
                                        //   style: TextStyle(
                                        //     fontSize: 11.0,
                                        //     fontWeight: FontWeight.w300,
                                        //   ),
                                        // ),
                                        // SizedBox(width: 10.0),
                                        // Text(
                                        //   '\u20b9${_favoriteController.favoriteitems[index].price}',
                                        //   style: TextStyle(
                                        //     fontSize: 14.0,
                                        //     fontWeight: FontWeight.w900,
                                        //     color: Theme.of(context).accentColor,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    // Spacer(),
                                    const SizedBox(height: 10),

                                    Text(
                                      _favoriteController
                                          .favoriteitems[index].itemDesc,
                                      // maxLines: 2,
                                      style: TextStyle(
                                        // overflow: TextOverflow.ellipsis,
                                        fontSize:
                                            Responsive.blockSizeVertical * 1.5,
                                        color: Colors.grey,
                                        // fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const Spacer(),
                                    Obx(() {
                                      return Row(
                                        children: [
                                          const Spacer(
                                            flex: 3,
                                          ),
                                          _cartController.hasProduct(
                                                  _favoriteController
                                                      .favoriteitems[index])
                                              ? OutlinedButton(
                                                  onPressed: null,
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.grey.shade200,
                                                    side: BorderSide(
                                                        color: Colors
                                                            .grey.shade400),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(18),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Added to cart',
                                                    style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(.5),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: Responsive
                                                              .blockSizeVertical *
                                                          2,
//                    fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ))
                                              : OutlinedButton(
                                                  onPressed: () {
                                                    _cartController.addToCart(Product(
                                                      rating: _favoriteController
                                                          .favoriteitems[
                                                      index]
                                                          .rating,
                                                        itemId:
                                                            _favoriteController
                                                                .favoriteitems[
                                                                    index]
                                                                .itemId,
                                                        itemName:
                                                            _favoriteController
                                                                .favoriteitems[
                                                                    index]
                                                                .itemName,
                                                        itemDesc:
                                                            _favoriteController
                                                                .favoriteitems[
                                                                    index]
                                                                .itemDesc,
                                                        image:
                                                            _favoriteController
                                                                .favoriteitems[
                                                                    index]
                                                                .image,
                                                        price:
                                                            _favoriteController
                                                                .favoriteitems[
                                                                    index]
                                                                .price,
                                                        quantity: 1, thumb:_favoriteController
                                                        .favoriteitems[
                                                    index].thumb));
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.orange,
                                                    side: const BorderSide(
                                                        color: Colors.red),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(18),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Add to cart',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: Responsive
                                                              .blockSizeVertical *
                                                          2,
//                    fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  )),
                                          IconButton(
                                              onPressed: () {
                                                _favoriteController
                                                    .delete(index);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              )),
                                          const Spacer(),
                                        ],
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: _favoriteController.leng,
                  ),
                ),
              ),
              // Visibility(
              //   visible: _favoriteController.favoriteitems.isNotEmpty,
              //   child: SizedBox(
              //     height: AppBar().preferredSize.height * 1.2,
              //     // color: Colors.red,
              //     child: Center(
              //       child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           const SizedBox(width: 10),
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text("Total ${_cartController.totalItems()} items",
              //                   style: const TextStyle(
              //                       fontWeight: FontWeight.bold)),
              //               const SizedBox(height: 5),
              //               Text("\u{20B9}${_cartController.totalAmount()}")
              //             ],
              //           ),
              //           const Spacer(),
              //           MaterialButton(
              //             onPressed: () async {
              //               log('sddhsfd ${await checkedLogin()}');
              //               if (await checkedLogin()) {
              //                 Get.to(() => CheckOutPage());
              //               } else {
              //                 Get.to(() => LoginPage(
              //                       replaceTo: loginReplaceTO.checkout,
              //                     ));
              //               }
              //             },
              //             color: Colors.green,
              //             child: const Text("Checkout",
              //                 style: TextStyle(color: Colors.white)),
              //           ),
              //           const SizedBox(width: 10),
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            ],
          );
        }
      }),
    );
  }
}
