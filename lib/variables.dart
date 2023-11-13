
import 'package:shared_preferences/shared_preferences.dart';


Future<bool> checkedLogin() async {
var sp=await SharedPreferences.getInstance();
  return sp.getBool('logged') ?? false;

}

enum loginReplaceTO {
  checkout,
  hotdeals,
  coupons,
  profile,
}

