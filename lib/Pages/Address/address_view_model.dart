import 'package:bot_toast/bot_toast.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:dilivirya/Pages/Address/address_view.dart';
import 'package:dilivirya/Pages/Maps/googlemap_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:dilivirya/model/address_model.dart';
import 'package:dilivirya/services/address_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends GetxController with BaseController {
  var fullnameController = TextEditingController().obs;
  var cityController = TextEditingController().obs;
  var streetController = TextEditingController().obs;
  var detailesController = TextEditingController().obs;
  var formkey = GlobalKey<FormState>();
  var phoneController = TextEditingController().obs;
  var colorbutton = orangeColor.obs;
  var fullname = ''.obs;
  var street = ''.obs;
  var city = ''.obs;
  var detailes = ''.obs;
  var phone = ''.obs;
  final String _initialCountryCode = "+1";
  var countryCode = "+1".obs;

  //! widget countrycode
  showCountryCode2() {
    return CountryListPick(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      theme: CountryTheme(
        labelColor: textColor,
        alphabetTextColor: textColor,
        alphabetSelectedTextColor: textColor,
        alphabetSelectedBackgroundColor: orangeColor,
        isShowFlag: true,
        isShowTitle: false,
        isShowCode: false,
        isDownIcon: false,
        showEnglishName: true,
      ),
      onChanged: (v) {
        countryCode.value = v!.dialCode!;
      },
      initialSelection: _initialCountryCode,
      // alignLeft: true,
    );
  }

  List<ResponseAddress> responseAddress = <ResponseAddress>[].obs;
  AddressService addressService = AddressService();

  var isEmptyaddress = false.obs;
  getdataAddress() async {
    responseAddress = [];
    isEmptyaddress = false.obs;
    responseAddress = await addressService.getDataAddress();
    isEmptyaddress.value = true;
    update();
  }

  deleteAddress(String id) async {
    try {
      BotToast.showLoading();
      await addressService.deleteAddress(id);
      await getdataAddress();
      Get.back();
    } finally {
      BotToast.closeAllLoading();
    }
  }

  postAddress(var map) async {
    try {
      bool resbonse;
      BotToast.showLoading();
      resbonse = await addressService.postAddress(map);
      await getdataAddress();
      Get.find<MapController>().positionMarker.value = const LatLng(0, 0);
      resbonse ? Get.offAll(MyAddress()) : null;
    } finally {
      BotToast.closeAllLoading();
    }
  }

  editAddress(var map, String id) async {
    try {
      BotToast.showLoading();
      await addressService.editAddress(map, id);
      await getdataAddress();
      Get.find<MapController>().positionMarker.value = const LatLng(0, 0);
      Get.off(MyAddress());
    } finally {
      BotToast.closeAllLoading();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
