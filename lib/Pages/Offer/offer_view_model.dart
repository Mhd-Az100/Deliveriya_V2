import 'package:dilivirya/model/copon_model.dart';
import 'package:dilivirya/model/offers_model.dart';
import 'package:dilivirya/services/copon_service.dart';
import 'package:dilivirya/services/offers_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:get/get.dart';

class CouponAndOfferController extends GetxController with BaseController {
  List<Responsecopon> copon = <Responsecopon>[].obs;
  CouponService coponService = CouponService();
  var coponid = Responsecopon().obs;

  var isEmptycopon = false.obs;
  var isEmptycoponid = false.obs;

  var isEmptyoffer = false.obs;
  var isEmptyofferid = false.obs;

  List<Responseoffers> offer = <Responseoffers>[].obs;
  OffersService offerService = OffersService();

  var offerid = Responseoffers().obs;
  OffersService offerServiceid = OffersService();
  getdatacopon() async {
    copon = [];
    isEmptycopon = false.obs;
    copon = await coponService.getDataCopon();
    if (copon.isNotEmpty) {
      isEmptycopon.value = true;
    }
  }

  getdataoffer() async {
    offer = [];
    isEmptyoffer = false.obs;
    offer = await offerService.getDataOffers();

    if (offer.isNotEmpty) {
      isEmptyoffer.value = true;
    }
  }

  getdataofferid(var id) async {
    isEmptyofferid = false.obs;

    offerid.value = await offerServiceid.getDataOffersid(id);
    if (offerid.value != null) isEmptyofferid.value = true;
  }

  getdatacoponid(var id) async {
    isEmptycoponid = false.obs;

    coponid.value = await coponService.getDataCoponid(id);
    if (coponid.value != null) isEmptycoponid.value = true;
  }
}
