import '../cartpage/cartcontroller.dart';
import '../favorites/favoritesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../responsiveclass.dart';
import 'splashController.dart';

class SplashPageView extends StatelessWidget {
  SplashPageView({Key? key}) : super(key: key);

  final SplashController _splashController = Get.put(SplashController());
  final CartController _cartController = Get.put(CartController());
  final FavoriteController _favoriteController = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Container(
    //     margin: const EdgeInsets.only(left: 40.0, right: 40.0),
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: <Widget>[
    //           SizedBox(
    //             width: Responsive.safeBlockHorizontal * 75,
    //             child: Center(
    //               child: FittedBox(
    //                 child: Text(
    //                   'Allen Canteen',
    //                   style: TextStyle(
    //                       fontFamily: 'Justice Story',
    //                       fontSize: Responsive.safeBlockVerticalWAB * 80,
    //                       color: Colors.green),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           const SizedBox(width: 40.0),
    //           Container(
    //               alignment: Alignment.center,
    //               margin: const EdgeInsets.only(
    //                 top: 15.0,
    //               ),
    //               child: Text(
    //                 "",
    //                 style: TextStyle(
    //                   fontSize: 20.0,
    //                   fontWeight: FontWeight.w700,
    //                   color: Colors.green,
    //                 ),
    //               )),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(

      body: Container(
        margin: const EdgeInsets.only(left: 40.0, right: 40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "E-Shop",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 40.0),
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: const Text(
                    "Your Ecommerce Flutter App",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

//    return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         margin: const EdgeInsets.only(left: 40.0, right: 40.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Image.asset(
//                 'assets/images/srivarilogo.png',
//                 // color: Theme.of(context).accentColor,
//               ),
//               const SizedBox(width: 40.0),
//               Container(
//                   alignment: Alignment.center,
//                   margin: const EdgeInsets.only(
//                     top: 15.0,
//                   ),
//                   child: Text(
//                     "Pure veg Restaurant",
//                     style: TextStyle(
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.w700,
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
