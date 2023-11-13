import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../responsiveclass.dart';

class PopularproductLOading extends StatelessWidget {
  const PopularproductLOading({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      // itemCount: _homePageController.popularprd.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.safeBlockHorizontal * 2),
          child: SizedBox(
            width: Responsive.safeBlockHorizontal * 46,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: GestureDetector(
                // onTap: () => Get.to(() => ItemDetails(
                //     product: _homePageController.popularprd[index %
                //         _homePageController.popularprd.length])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: Responsive.safeBlockHorizontal * 46,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          height: Responsive.safeBlockHorizontal * 48,
                          width: Responsive.safeBlockHorizontal * 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 8.0),
                      child: Container(
                        height: Responsive.safeBlockVertical * 1.8,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 4.0),
                      child: Container(
                        height: Responsive.safeBlockVertical * 1.5,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class OfferLoading extends StatelessWidget {
  const OfferLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        padding: EdgeInsets.fromLTRB(
            Responsive.safeBlockHorizontal * 1.5,
            0,
            Responsive.safeBlockHorizontal * 1.5,
            Responsive.safeBlockHorizontal * 1.5),
        width: Responsive.safeBlockHorizontal * 100,
        height: 9 / 16 * Responsive.safeBlockHorizontal * 100,
        color: Colors.white,
      ),
    );
  }
}

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Responsive.safeBlockHorizontal * 2),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.15,
          mainAxisSpacing: Responsive.safeBlockVerticalWAB,
          crossAxisSpacing: Responsive.safeBlockVerticalWAB,
          // childAspectRatio: MediaQuery.of(context).size.width /
          //     (MediaQuery.of(context).size.height / 1.01),
        ),
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Container(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Container(
                height: 12,
                width: double.infinity,
                color: Colors.white,
              ),
              const Spacer(),
            ],
          ),
        ),
        itemCount: 50,
      ),
    );
  }
}

class ItemListLoading extends StatelessWidget {
  const ItemListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Responsive.safeBlockHorizontal * 2),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.15,
          mainAxisSpacing: Responsive.safeBlockVerticalWAB,
          crossAxisSpacing: Responsive.safeBlockVerticalWAB,
          // childAspectRatio: MediaQuery.of(context).size.width /
          //     (MediaQuery.of(context).size.height / 1.01),
        ),
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Container(
                height: 12,
                width: double.infinity,
                color: Colors.white,
              ),
              const Spacer(),
              Container(
                height: 10,
                width: double.infinity,
                color: Colors.white,
              ),
            ],
          ),
        ),
        itemCount: 50,
      ),
    );
  }
}
