import 'dart:async';
import 'package:get/get.dart';
import 'package:untitled1/homepage/homepageView2.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    checkLOgin();
    super.onReady();
  }

  void checkLOgin() async {
    await Future.delayed(const Duration(
      seconds: 3,
    ));

    Get.off(() => HomePage2());
  }
}
