// ignore_for_file: unnecessary_string_interpolations, unrelated_type_equality_checks

import 'package:country_list_pick/country_list_pick.dart';
import 'package:dilivirya/Pages/Authorization/Verfication/verfication_view.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:dilivirya/services/signup_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupController extends GetxController with BaseController {
  var firstnameController = TextEditingController().obs;
  var lastnameController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var colorbutton = orangeColor.obs;
  var name = ''.obs;
  var lastname = ''.obs;
  var phone = ''.obs;
  var opacity = 0.0.obs;
  var formkey = GlobalKey<FormState>();
  var group = 0.obs;
  final String _initialCountryCode = "+1";
  var countryCode = "+1".obs;
  SignupService signupService = SignupService();
  var checkbox = false.obs;
  postsignup() async {
    showLoading('Get data');
    var gender = group == 0
        ? 'Male'
        : group == 1
            ? 'Female'
            : 'Other';
    var body = {
      'phone': '${countryCode + phone.value}',
      'firstName': firstnameController.value.text,
      'lastName': lastnameController.value.text,
      'gender': gender
    };
    var signup = await signupService.postData(body);
    if (signup != null) {
      code = await signup.code;
      phonenumber = countryCode + phone.value;
      await hideLoading();
      Get.to(VerficationPage(false));
    }
  }

  //! widget countrycode
  showCountryCode2() {
    return CountryListPick(
      pickerBuilder: (context, CountryCode? countryCode) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  countryCode!.flagUri!,
                  package: 'country_list_pick',
                  fit: BoxFit.contain,
                  width: 35,
                ),
                const SizedBox(
                  width: 22,
                ),
                Text(
                  countryCode.code!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: textColor),
                ),
              ],
            ),
            SizedBox(
              width: 170.w,
            ),
            const Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: textColor,
            ),
          ],
        );
      },
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
        isShowTitle: true,
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
