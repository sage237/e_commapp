import '../Models/productmodel.dart';
import '../favorites/favoritesController.dart';
import '../homepage/loading_shimmer.dart';
import '../itemlist/itemlistController.dart';
import '../responsiveclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../itemdetails/itemdetailspage.dart';
import '../variables.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({required this.contorller, Key? key}) : super(key: key);
  final ItemListController contorller;
  final FavoriteController _favoriteController = Get.find();
  Map sortingId = {};
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            elevation: 1,



            title: Text(
              contorller.cateid != null
                  ? contorller.cateid!.cateName
                  : 'All products',
              style: TextStyle(
                  fontSize: Responsive.safeBlockVertical * 2.5,
                  ),
            ),
            // backgroundColor: Colors.white,
            // elevation: 1,
            actions: [
              Visibility(
                visible: contorller.isSearchWidget.isFalse,
                child: IconButton(
                    onPressed: () {
                      contorller.showOrHideSearchWidget(true);
                    },
                    icon: const Icon(Icons.search)),
              )
            ],
          ),

          // appBar: AppBar(
          //   title: Text(contorller.cateid != null
          //       ? contorller.cateid!.cateName
          //       : 'All products'),
          // ),
          body: contorller.isloading.value
              ? const ItemListLoading()
              : Column(
                  children: [
                    Visibility(
                      visible: contorller.isSearchWidget.value,
                      replacement: const SizedBox(height: 10),
                      child: SizedBox(
                        // color: Colors.grey.shade100,
                        height: Responsive.safeBlockVerticalWAB * 8,
                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                              onChanged: (value) =>
                                  contorller.searchItem(value),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                              decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.search, color: Colors.grey),
                                  hintText: "Search...",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            )),
                            TextButton(
                                onPressed: () async {
                                  await Get.dialog(
                                    barrierDismissible: false,
                                    WillPopScope(
                                      onWillPop: () async => false,
                                      child: StatefulBuilder(
                                          builder: (context, setState) {
                                        return AlertDialog(
                                          title: const Text('Sort list by'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: contorller.srotlist
                                                .map((element) => RadioListTile(
                                                      value: element,
                                                      groupValue: sortingId,
                                                      onChanged: (value) {
                                                        sortingId = value!;
                                                        setState(() {});
                                                      },
                                                      title: Text(
                                                          element['name']),
                                                    ))
                                                .toList(),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  // sortingId = '';
                                                  Get.back();
                                                },
                                                child: const Text('Cancel')),
                                            TextButton(
                                                onPressed: () {
                                                  // sortingId = '';
                                                  Get.back();
                                                },
                                                child: const Text('done')),
                                          ],
                                        );
                                      }),
                                    ),
                                  );
                                  // log('sor $sortingId');
                                  if (sortingId.isNotEmpty) {
                                    contorller.sortList(sortingId);
                                  }
                                },
                                child: Icon(
                                  Icons.sort_outlined,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .color,
                                  // color: Colors.black,
                                )),
                            TextButton(
                                onPressed: () {
                                  contorller.showOrHideSearchWidget(false);
                                },
                                child: Icon(
                                  Icons.cancel_outlined,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .color,
                                  // color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        // physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .82,
                                mainAxisSpacing: 10),
                        itemCount: contorller.isSearch.value
                            ? contorller.productlisrtsearch.length
                            : contorller.productlisrt.length,
                        itemBuilder: (context, index) {
                          List<Product> list = contorller.isSearch.value
                              ? contorller.productlisrtsearch
                              : contorller.productlisrt;

                          return GestureDetector(
                            onTap: () =>
                                Get.to(() => ItemDetails(product: list[index])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            list[index].thumb,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Obx(() {
                                        return Positioned(
                                          right:
                                              -Responsive.safeBlockHorizontal * 1,
                                          bottom: Responsive.safeBlockHorizontal,
                                          child: RawMaterialButton(
                                            onPressed: () {
                                              _favoriteController
                                                  .toggle(list[index]);
                                            },
                                            fillColor: Colors.white,
                                            shape: const CircleBorder(),
                                            elevation: 4.0,
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: _favoriteController
                                                      .hasProduct(list[index])
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
                                      })
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        list[index].rating,
                                        style:  TextStyle(
                                          fontSize: Responsive.safeBlockVertical*1.8,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Icon(Icons.star)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 8.0),
                                  child: Text(
                                    list[index].itemName,
                                    style:  TextStyle(
                                      fontSize: Responsive.safeBlockVertical*1.8,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 4.0),
                                  child: Text(
                                    '\u20b9 ${list[index].price}',
                                    overflow: TextOverflow.ellipsis,
                                    style:  TextStyle(
                                        fontSize: Responsive.safeBlockVertical*1.5,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blue),
                                    maxLines: 1,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 4.0),
                                  child: Text(
                                    list[index].itemDesc,
                                    overflow: TextOverflow.ellipsis,
                                    style:  TextStyle(
                                        fontSize: Responsive.safeBlockVertical*1.3,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ));
    });
  }
}
