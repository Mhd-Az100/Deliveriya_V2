import 'dart:io';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:dilivirya/model/profile.dart';
import 'package:dilivirya/services/profile_service.dart';
import 'package:dilivirya/services/signup_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController with BaseController {
  var firstnameController = TextEditingController().obs;
  var lastnameController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var date = ''.obs;
  var day = ''.obs;
  var month = ''.obs;
  var year = ''.obs;
  var group = 0.obs;
  var formkey = GlobalKey<FormState>();
  final String _initialCountryCode = "+1";
  var countryCode = "+1".obs;
  SignupService signupService = SignupService();
  ProfileService profileService = ProfileService();
  Responseprofile? profile;

  @override
  void onInit() {
    // getprofile();

    super.onInit();
  }

  getprofile() async {
    //  showLoading('Get data');
    profile = await profileService.getDataprofile();
    if (profile != null) {
      print(profile);
      //   await hideLoading();
    }
  }

  //! image picker
  var file = File('');
  var filenull = true.obs;
  Future postImg(x) async {
    final pickedFile = await ImagePicker.platform.getImage(source: x);
    if (pickedFile != null) {
      filenull.value = false;
      file = File(pickedFile.path);

      Get.back();
      update();
      return;
    } else {
      print('No image selected.');
    }
  }

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
}
