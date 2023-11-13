import 'dart:math';
import 'dart:ui';

import '../cartpage/cartcontroller.dart';
import '../checkoutpage/checkoutcontroller.dart';
import '../responsiveclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../profile/profileController.dart';
import '../variables.dart';
import 'discountcouponController.dart';

class CheckOutPage extends StatelessWidget {
  CheckOutPage({Key? key}) : super(key: key);
  final coupon = TextEditingController();
  final CartController _cartController = Get.find();
  final DiscountCouponController _offerController =
      Get.put(DiscountCouponController());
  final CheckoutController _checkoutController = Get.put(CheckoutController());
  final ProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return WillPopScope(
      onWillPop: () async {
        if (_offerController.stackindex.value == 1) {
          _offerController.changeValue(0);
          return false;
        }
        return true;
      },
      child: Obx(() {
        return IndexedStack(
          index: _offerController.stackindex.value,
          children: [
            Scaffold(
                appBar: AppBar(

                  title: Text(
                    "Your Order",
                    style: TextStyle(
                      fontSize: Responsive.safeBlockVertical * 2.5,

                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.wallet,
                                color: const Color(0xffC58C63),
                                size: Responsive.safeBlockHorizontal * 3.5,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Obx(() {
                                return Text(
                                  '${_profileController.walletpoints}',
                                  style: TextStyle(
                                      // color: Colors.black,
                                      fontSize:
                                          Responsive.safeBlockHorizontal * 3.5,
                                      fontWeight: FontWeight.bold),
                                );
                              }),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Responsive.safeBlockVertical * 3),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Responsive.safeBlockHorizontal * 3,
                                  ),
                                  child: Image.network(
                                    _cartController.cartitems[Random().nextInt(_cartController.cartitems.length)].thumb,
                                    height: Responsive.safeBlockHorizontal *
                                        100 /
                                        5,
                                    errorBuilder: (
                                      context,
                                      object,
                                      stackTrace,
                                    ) =>
                                        const Icon(Icons.add),
                                  )),
                              SizedBox(
                                  width: Responsive.safeBlockHorizontal * 5),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Total ${_cartController.totalItems()} items',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: Responsive.safeBlockVertical,
                                  ),
                                  Text(
                                      '\u20b9 ${_cartController.totalAmount()}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: Responsive.safeBlockVertical * 1.2),
                          const Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Responsive.safeBlockHorizontal * 3),
                            child: const Text("Coupons & discounts",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: Responsive.safeBlockVertical * 1.2),
                          ..._checkoutController.selectedcoupon != null
                              ? <Widget>[
                                  SizedBox(
                                    height: Responsive.safeBlockVertical * 5,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Responsive.safeBlockHorizontal *
                                                  3),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Saved \u20b9 ${_checkoutController.discount} with this code',
                                                style: TextStyle(
                                                    fontSize: Responsive
                                                            .safeBlockVertical *
                                                        2.3),
                                              ),
                                              Text(
                                                '${_checkoutController.selectedcoupon.couponCode}',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: Responsive
                                                            .safeBlockVertical *
                                                        1.8),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          TextButton(
                                            child: Text(
                                              'Remove'.toUpperCase(),
                                              style: const TextStyle(
                                                  color: Colors.red),
                                            ),
                                            onPressed: () {
                                              // dev.log("Youched remove");
                                              _checkoutController
                                                  .selectCoupon(null);
                                              _checkoutController
                                                  .calculateDiscount(
                                                      _cartController
                                                          .totalAmount());
                                              // _offerController.changeValue(0);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: TextButton(
                                      child: Text(
                                          'View all coupons'.toUpperCase()),
                                      onPressed: () {
                                        _offerController.changeValue(1);
                                      },
                                    ),
                                  ),
                                ]
                              : <Widget>[
                                  Card(
                                    elevation: 2,
                                    child: MaterialButton(
                                        onPressed: () {
                                          _offerController.changeValue(1);
                                        },
                                        child: const Row(
                                          children: [
                                            SizedBox(width: 10),
                                            Text('Apply discount coupons'),
                                            Spacer(),
                                            Icon(Icons.arrow_forward),
                                            SizedBox(width: 10),
                                          ],
                                        )),
                                  )
                                ],
                          Visibility(
                            visible: _checkoutController.ischecking.value,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          ),
                          Visibility(
                            visible: _checkoutController.isinvalid.value,
                            child: const Center(
                                child: Text(
                              "promo code is not valid",
                              style: TextStyle(color: Colors.red),
                            )),
                          ),
                          Visibility(
                            visible: _checkoutController.isvalid.value,
                            child: const Center(
                                child: Text(
                              "promo code applied successfully",
                              style: TextStyle(color: Colors.green),
                            )),
                          ),
                          SizedBox(height: Responsive.safeBlockVertical * 3),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Responsive.safeBlockHorizontal * 3,
                            ),
                            child: const Text("Order Summary",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Responsive.safeBlockHorizontal * 3,
                                vertical: Responsive.blockSizeVertical * 1.5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(
                                  Responsive.safeBlockHorizontal * 3),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Order amount",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text(
                                        "\u20b9 ${_cartController.totalAmount()}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          Responsive.safeBlockVertical * 1.5),
                                  Row(
                                    children: [
                                      Text(
                                        "Coupon discount",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text(
                                        "\u20b9 ${_checkoutController.discount}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          Responsive.safeBlockVertical * 1.5),
                                  const Divider(),
                                  Row(
                                    children: [
                                      Text(
                                        "Subtotal",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text(
                                        "\u20b9 ${_checkoutController.subTotal(_cartController.totalAmount())}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          Responsive.safeBlockVertical * 1.5),
                                  Row(
                                    children: [
                                      Text(
                                        "GST",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text(
                                        "\u20b9 ${_checkoutController.calculateGST(_checkoutController.subTotal(_cartController.totalAmount()))}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          Responsive.safeBlockVertical * 1.5),
                                  Row(
                                    children: [
                                      Text(
                                        "Delivery charges",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text(
                                        "\u20b9 ${_checkoutController.deliveryfee}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          Responsive.safeBlockVertical * 1.5),
                                  const Divider(),
                                  Row(
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.grey.shade900),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text(
                                        "\u20b9 ${_checkoutController.totalPayableAmount(_checkoutController.subTotal(_cartController.totalAmount()))}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.grey.shade900),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Responsive.safeBlockHorizontal * 3,
                            ),
                            child: const Text("Payment method",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),


                          Obx(() {
                            return RadioListTile(
                              value: 'Cash On Delivery',
                              groupValue: _checkoutController.paymode.value,
                              onChanged: _checkoutController.changePayMode,
                              title: const Text('Cash on delivery'),
                              contentPadding: EdgeInsets.only(
                                  left: Responsive.safeBlockHorizontal * 5),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    const Text("Place order",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        "Total: \u20b9 ${_checkoutController.totalPayableAmount(_checkoutController.subTotal(_cartController.totalAmount()))}")
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                FloatingActionButton(
                                  onPressed: () {




                                    _checkoutController.checkout(
                                        disamount: _checkoutController
                                            .discount.value,
                                        totalpaid: _checkoutController
                                            .totalPayableAmount(
                                                _checkoutController.subTotal(
                                                    _cartController
                                                        .totalAmount())),
                                        subamount: _checkoutController.subTotal(
                                            _cartController.totalAmount()),
                                        taxamount:
                                            _checkoutController.calculateGST(
                                                _checkoutController.subTotal(
                                                    _cartController
                                                        .totalAmount())),
                                        list: _cartController.cartitems);
                                  },
                                  backgroundColor: Colors.orange.shade200,
                                  child: const Icon(
                                    Icons.arrow_forward_sharp,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _checkoutController.isloading.value,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                        child: Container(
                          color: Colors.black38,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Scaffold(
                appBar: AppBar(

                  leading: IconButton(
                    onPressed: () {
                      _offerController.changeValue(0);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      // color: Colors.grey.shade600,
                    ),
                  ),
                  title: const Text(
                    "Coupons for you",

                  ),
                ),
                body: Stack(
                  children: [
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title: ListTile(
                              isThreeLine: true,
                              leading: Image.network(
                                  _offerController.coupons[index].image),
                              title: Text(
                                  _offerController.coupons[index].couponName),
                              subtitle: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text:
                                        '${_offerController.coupons[index].amount} ${_offerController.coupons[index].offerType} off\n',
                                  ),
                                  TextSpan(
                                      text: _offerController
                                          .coupons[index].couponCode,
                                      style: const TextStyle(
                                          color: Colors.red, fontSize: 12)),
                                ]),
                              )

                              // Text(
                              //     '${_offerController.coupons[index].amount} ${_offerController.coupons[index].offerType} off'),
                              ),
                          trailing: const Text('View details'),
                          subtitle: TextButton(
                              child: Text('Tap to apply'.toUpperCase()),
                              onPressed: () {
                                _checkoutController.selectCoupon(
                                    _offerController.coupons[index]);
                                _checkoutController.calculateDiscount(
                                    _cartController.totalAmount());
                                _offerController.changeValue(0);
                              }),
                          childrenPadding: EdgeInsets.symmetric(
                              horizontal: Responsive.safeBlockHorizontal * 1.5),
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: 'Availability: ',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text:
                                        _offerController.coupons[index].cStatus,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 12)),
                              ]),
                            ),
                            const Divider(),
                            const Text(
                              'Terms and conditions',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                                '\u2022 ${_offerController.coupons[index].couponTerms.replaceAll('\r\n', '\n\n\u2022 ')}')
                          ],
                        );
                      },
                      itemCount: _offerController.coupons.length,
                    ),
                    Visibility(
                      visible: _checkoutController.isloading.value,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                        child: Container(
                          color: Colors.black38,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        );
      }),
    );
  }
}
