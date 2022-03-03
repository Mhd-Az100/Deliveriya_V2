import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/copon_model.dart';
import 'package:dilivirya/utils/Apis/base-http.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';

class CouponService extends BaseController {
  List<Responsecopon> copon = [];
  late Responsecopon coponid;

  getDataCopon() async {
    copon = [];
    try {
      var response = await BaseClient()
          .get(baseUrl: url, api: '/api/public/coupon', token: accessToken)
          .catchError((error) {
        handleError(error);
      });

      if (response['response'] != []) {
        for (var item in response['response']) {
          copon.add(Responsecopon.fromJson(item));
        }
      }
      if (response == null) return;
      return copon;
    } catch (e) {
      handleError(e);
    }
  }

  getDataCoponid(var id) async {
    try {
      var response = await BaseClient()
          .get(baseUrl: url, api: '/api/public/coupon/$id', token: accessToken)
          .catchError((error) {
        handleError(error);
      });

      if (response['response'] != []) {
        coponid = Responsecopon.fromJson(response['response']);
      }
      if (response == null) return;
      return coponid;
    } catch (e) {
      handleError(e);
    }
  }
}
