import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled1/profile/profileView.dart';
import '../homepage/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cartpage/cartcontroller.dart';
import '../cartpage/cartpageview.dart';
import '../favorites/favoritesController.dart';
import '../homepage/homepagecontroller2.dart';
import '../itemdetails/itemdetailspage.dart';
import '../itemlist/itemlistController.dart';
import '../itemlist/itemlistView.dart';
import '../profile/profileController.dart';
import '../responsiveclass.dart';

class HomePage2 extends StatelessWidget {
  HomePage2({Key? key}) : super(key: key);
  final HomePageController _homePageController = Get.put(HomePageController());
  final FavoriteController _favoriteController = Get.find();
  final CartController _cartController = Get.find();
  // final FavoriteController _favoriteController = Get.find();
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Obx(() {
      return Scaffold(
        appBar: AppBar(

          elevation: 1,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ecommerce App',
                style: TextStyle(

                    fontSize: Responsive.safeBlockVertical * 2.50),
              ),
              Text(
                'appsubtitle',
                style: TextStyle(

                    fontSize: Responsive.safeBlockVertical * 2),
              )
            ],
          ),
          actions: [
            IconButton(
              icon: Stack(
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 24.0,
                  ),
                  Obx(() {
                    return Visibility(
                      visible: _cartController.leng > 0,
                      child: Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: Text(
                              '${_cartController.leng > 10 ? '10+' : _cartController.leng}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    );
                  })
                ],
              ),
              onPressed: () {
                Get.to(CartPage());
              },
            ),
            IconButton(
              icon: const Icon(
      Icons.person,
      size: 24.0,
      ),
              onPressed: () {
                Get.to(ProfilePage());
              },
            ),

            // IconButton(
            //   icon: const Icon(
            //     Icons.feedback_outlined,
            //     size: 24.0,
            //   ),
            //   onPressed: () {
            //     Get.to(FeedBackPage());
            //   },
            // ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.safeBlockHorizontal * 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Today's special just for you",
                    style: TextStyle(
                      fontSize: Responsive.safeBlockVertical * 2.2,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "",
                      style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) {
                      //       return DishesScreen();
                      //     },
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Responsive.safeBlockVertical * 31,
              child: _homePageController.isloading.value
                  ? const PopularproductLOading()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // itemCount: _homePageController.popularprd.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Responsive.safeBlockHorizontal * 2),
                          child: SizedBox(
                            width: Responsive.safeBlockHorizontal * 46,
                            child: GestureDetector(
                              onTap: () => Get.to(() => ItemDetails(
                                  product: _homePageController.popularprd[
                                      index %
                                          _homePageController
                                              .popularprd.length])),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: Responsive.safeBlockHorizontal * 46,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            _homePageController.popularprd[index % _homePageController.popularprd.length].thumb,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Obx(() {
                                          return Positioned(
                                            right: -Responsive
                                                    .safeBlockHorizontal *
                                                3,
                                            bottom:
                                                Responsive.safeBlockHorizontal /
                                                    3,
                                            child: RawMaterialButton(
                                              onPressed: () {
                                                _favoriteController.toggle(
                                                    _homePageController
                                                            .popularprd[
                                                        index %
                                                            _homePageController
                                                                .popularprd
                                                                .length]);
                                              },
                                              fillColor: Colors.white,
                                              shape: const CircleBorder(),
                                              elevation: 4.0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: _favoriteController.hasProduct(
                                                        _homePageController
                                                                .popularprd[
                                                            index %
                                                                _homePageController
                                                                    .popularprd
                                                                    .length])
                                                    ? const Icon(
                                                        Icons
                                                            .favorite, // : Icons.favorite_border,
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 8.0),
                                    child: Text(
                                      _homePageController
                                          .popularprd[index %
                                              _homePageController
                                                  .popularprd.length]
                                          .itemName,
                                      style: TextStyle(
                                        fontSize:
                                            Responsive.safeBlockVertical * 1.8,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 4.0),
                                    child: Text(
                                      _homePageController
                                          .popularprd[index %
                                              _homePageController
                                                  .popularprd.length]
                                          .itemDesc,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize:
                                              Responsive.safeBlockVertical *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Container(
              color: Colors.grey.shade300,
              height: Responsive.safeBlockVertical,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.safeBlockHorizontal * 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Offers",
                    style: TextStyle(
                      fontSize: Responsive.safeBlockVertical * 2.2,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "",
                      style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) {
                      //       return DishesScreen();
                      //     },
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.grey.shade300,
              height: Responsive.safeBlockVertical,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.safeBlockHorizontal * 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Our specialities",
                    style: TextStyle(
                      fontSize: Responsive.safeBlockVertical * 2.2,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "",
                      style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) {
                      //       return DishesScreen();
                      //     },
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Responsive.safeBlockVertical * 31,
              child: _homePageController.isloading.value
                  ? const PopularproductLOading()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Responsive.safeBlockHorizontal * 2),
                          child: SizedBox(
                            width: Responsive.safeBlockHorizontal * 46,
                            child: GestureDetector(
                              onTap: () => Get.to(() => ItemDetails(
                                  product: _homePageController.ourspclty[index %
                                      _homePageController.ourspclty.length])),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                              Expanded(
                              child: SizedBox(
                                    width: Responsive.safeBlockHorizontal * 46,
                                    child:  Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              _homePageController.ourspclty[index % _homePageController.ourspclty.length].thumb,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Obx(() {
                                            return Positioned(
                                              right: -Responsive
                                                      .safeBlockHorizontal *
                                                  3,
                                              bottom:
                                                  Responsive.safeBlockHorizontal /
                                                      3,
                                              child: RawMaterialButton(
                                                onPressed: () {
                                                  _favoriteController.toggle(
                                                      _homePageController
                                                              .ourspclty[
                                                          index %
                                                              _homePageController
                                                                  .ourspclty
                                                                  .length]);
                                                },
                                                fillColor: Colors.white,
                                                shape: const CircleBorder(),
                                                elevation: 4.0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: _favoriteController.hasProduct(
                                                          _homePageController
                                                                  .ourspclty[
                                                              index %
                                                                  _homePageController
                                                                      .ourspclty
                                                                      .length])
                                                      ? const Icon(
                                                          Icons
                                                              .favorite, // : Icons.favorite_border,
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 8.0),
                                    child: Text(
                                      _homePageController
                                          .ourspclty[index %
                                              _homePageController
                                                  .ourspclty.length]
                                          .itemName,
                                      style: TextStyle(
                                        fontSize:
                                            Responsive.safeBlockVertical * 1.8,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 4.0),
                                    child: Text(
                                      _homePageController
                                          .ourspclty[index %
                                              _homePageController
                                                  .ourspclty.length]
                                          .itemDesc,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize:
                                              Responsive.safeBlockVertical *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Container(
              color: Colors.grey.shade300,
              height: Responsive.safeBlockVertical,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.safeBlockHorizontal * 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(''),
                  )
                ],
              ),
            ),
            _homePageController.isloading.value
                ? const CategoryLoading()
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.safeBlockHorizontal * 2),
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.15,
                        mainAxisSpacing: Responsive.safeBlockVerticalWAB,
                        crossAxisSpacing: Responsive.safeBlockVerticalWAB,
                        // childAspectRatio: MediaQuery.of(context).size.width /
                        //     (MediaQuery.of(context).size.height / 1.01),
                      ),
                      itemCount: _homePageController.categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.to(() => ItemListPage(
                              contorller: Get.put(ItemListController(
                                  cateid:
                                      _homePageController.categories[index])))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        _homePageController.categories[index].cateImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 8.0),
                                child: Text(
                                  _homePageController
                                      .categories[index].cateName,
                                  style:  TextStyle(
                                    fontSize: Responsive.safeBlockVertical*2,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
