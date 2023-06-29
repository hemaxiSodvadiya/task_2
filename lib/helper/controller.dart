import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/global.dart';
import '../model/model.dart';

class ProductController extends GetxController {
  int totalProductPrice = 0;
  RxInt amount = 0.obs;
  get totalPrice {
    for (SportsData cartProduct in Global.SportsDatad) {
      totalProductPrice = totalProductPrice + 1;
    }
    return totalProductPrice;
  }

  get removePrice {
    for (SportsData cartProduct in Global.SportsDatad) {
      totalProductPrice = totalProductPrice - 1;
    }
    return totalProductPrice;
  }
}
