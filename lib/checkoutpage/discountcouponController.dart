
import '../Models/couponmodel.dart';
import 'package:get/get.dart';

class DiscountCouponController extends GetxController {
  RxList<Lstincno> coupons = <Lstincno>[].obs;
  RxInt stackindex = 0.obs;

  RxBool isloading = true.obs;
  @override
  void onInit() {
    getOffers();
    super.onInit();
  }

  void getOffers() async {

    try {

      if (true) {
        //TODO Add Coupons
        coupons.value = [];
      }
      // log('Coupon list ${coupons.length}');
    } catch (e) {
      //   log("Error $e");
    } finally {
      isloading(false);
    }
  }

  void changeValue(int i) {
    stackindex.value = i;
    update();
  }
}
