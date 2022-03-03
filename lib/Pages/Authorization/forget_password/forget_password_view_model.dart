import 'package:country_list_pick/country_list_pick.dart';
import 'package:dilivirya/Pages/Authorization/Verfication/verfication_view.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:dilivirya/services/forget_service.dart';
import 'package:dilivirya/services/signup_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetController extends GetxController with BaseController {
  var phoneController = TextEditingController().obs;
  var colorbutton = orangeColor.obs;
  var phone = ''.obs;
  var ispass = false.obs;
  var opacity = 0.0.obs;

  ForgetService forgetService = ForgetService();

  postforget() async {
    showLoading('Get data');
    var body = {
      'phone': '${countryCode + phone.value}',
    };
    var signup = await forgetService.postData(body);
    if (signup != null) {
      code = await signup.code;
      phonenumber = countryCode + phone.value;
      await hideLoading();
      Get.to(VerficationPage(true));
    }
  }

//===============widget country code================
  final String _initialCountryCode = "+1";
  var countryCode = "+1".obs;

  // LoginService loginService = LoginService();

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
