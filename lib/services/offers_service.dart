import 'dart:async';
import 'dart:io';

import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/model/offers_model.dart';
import 'package:dilivirya/utils/Apis/base-http.dart';
import 'package:dilivirya/utils/Error/app_exceptions.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';

class OffersService extends BaseController {
  List<Responseoffers> offers = [];
  late Responseoffers offersid;
  getDataOffers() async {
    offers = [];
    try {
      var response = await BaseClient()
          .get(
              baseUrl: url,
              api: '/api/public/offer/?limit=50&offset=0',
              token: accessToken)
          .catchError((error) {
        handleError(error);
      });

      if (response['response'] != []) {
        for (var item in response['response']) {
          offers.add(Responseoffers.fromJson(item));
        }
      }
      if (response == null) return;
      return offers;
    } catch (e) {
      handleError(e);
    }
  }

  getDataOffersid(var id) async {
    try {
      var response = await BaseClient()
          .get(baseUrl: url, api: '/api/public/offer/$id', token: accessToken)
          .catchError((error) {
        handleError(error);
      });

      if (response['response'] != []) {
        offersid = Responseoffers.fromJson(response['response']);
      }
      if (response == null) return;
      return offersid;
    } catch (e) {
      handleError(e);
    }
  }
}
