import '../cartpage/cartcontroller.dart';
import '../cartpage/cartpageview.dart';
import '../favorites/favoritesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/productmodel.dart';
import '../responsiveclass.dart';
import '../variables.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails({required this.product, Key? key}) : super(key: key);

  final Product product;
  final CartController _cartController = Get.find();
  final FavoriteController _favoriteController = Get.find();
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Scaffold(
      appBar: AppBar(


        title: Text(
          'Product details',
          style: TextStyle(
            fontSize: Responsive.safeBlockVertical * 2.5,

          ),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                // Container(
                //   height: MediaQuery.of(context).size.width,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: new BoxDecoration(
                //     image: new DecorationImage(
                //       image: new NetworkImage("$mainurl/${product.image}"),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                //   child: BackdropFilter(
                //       child: new Container(
                //         decoration: new BoxDecoration(
                //             color: Colors.white.withOpacity(0.0)),
                //       ),
                //       filter: ImageFilter.blur(
                //         sigmaX: 10,
                //         sigmaY: 10,
                //       )),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      product.thumb,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Obx(() {
                  return Positioned(
                    right: -10.0,
                    bottom: 3.0,
                    child: RawMaterialButton(
                      onPressed: () {
                        _favoriteController.toggle(product);
                      },
                      fillColor: Colors.white,
                      shape: const CircleBorder(),
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: _favoriteController.hasProduct(product)
                            ? const Icon(
                                Icons.favorite, // : Icons.favorite_border,
                                color: Colors.red,
                                size: 17,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                                size: 17,
                              ),
                      ),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              product.itemName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
            //   child: Row(
            //     children: <Widget>[
            //       SmoothStarRating(
            //         starCount: 5,
            //         color: Constants.ratingBG,
            //         allowHalfRating: true,
            //         rating: 5.0,
            //         size: 10.0,
            //       ),
            //       SizedBox(width: 10.0),
            //       Text(
            //         "5.0 (23 Reviews)",
            //         style: TextStyle(
            //           fontSize: 11.0,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 2.0),
              child: Row(
                children: <Widget>[
                  const Text(
                    " ",
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    "\u20b9  ${product.price}",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Product Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 10.0),
            Text(
              product.itemDesc,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Reviews",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 20.0),
            // ListView.builder(
            //   shrinkWrap: true,
            //   primary: false,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: comments == null ? 0 : comments.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     Map comment = comments[index];
            //     return ListTile(
            //       leading: CircleAvatar(
            //         radius: 25.0,
            //         backgroundImage: AssetImage(
            //           "${comment['img']}",
            //         ),
            //       ),
            //       title: Text("${comment['name']}"),
            //       subtitle: Column(
            //         children: <Widget>[
            //           Row(
            //             children: <Widget>[
            //               SmoothStarRating(
            //                 starCount: 5,
            //                 color: Constants.ratingBG,
            //                 allowHalfRating: true,
            //                 rating: 5.0,
            //                 size: 12.0,
            //               ),
            //               SizedBox(width: 6.0),
            //               Text(
            //                 "February 14, 2020",
            //                 style: TextStyle(
            //                   fontSize: 12,
            //                   fontWeight: FontWeight.w300,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           SizedBox(height: 7.0),
            //           Text(
            //             "${comment["comment"]}",
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50.0,
        child: MaterialButton(
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            if (_cartController.cartitems.indexWhere(
                    (element) => element.itemId == product.itemId) !=
                -1) {
              Get.to(() => CartPage());
            } else {
              _cartController.addToCart(Product(
                  itemId: product.itemId,
                  image: product.image,
                  itemDesc: product.itemDesc,
                  itemName: product.itemName,
                  price: product.price,
                  quantity: 1, thumb: product.thumb, rating: product.rating));
            }
          },
          child: Obx(() {
            return Text(
              _cartController.cartitems.indexWhere(
                          (element) => element.itemId == product.itemId) !=
                      -1
                  ? "Go to cart"
                  : "ADD TO CART",
              style: const TextStyle(
                color: Colors.white,
              ),
            );
          }),
        ),
      ),
    );
  }
}
