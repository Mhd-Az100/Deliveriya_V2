import 'package:country_list_pick/country_list_pick.dart';
import 'package:dilivirya/Pages/Authorization/Login/done.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:dilivirya/services/login_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with BaseController {
  var passController = TextEditingController();
  var phoneController = TextEditingController().obs;
  var colorbutton = orangeColor.obs;
  var pass = ''.obs;
  var phone = ''.obs;
  var ispass = false.obs;
  var opacity = 0.0.obs;

//===============widget country code================
  final String _initialCountryCode = "+1";
  var countryCode = "+1".obs;

  LoginService loginService = LoginService();
  postlogin() async {
    showLoading('Get data');

    var body = {
      'phone': '${countryCode + phone.value}',
      'password': passController.value.text,
    };
    var login = await loginService.postData(body);
    if (login != null) {
      postStorageToken(login.accessToken, login.refreshToken);
      accessToken = login.accessToken;
      refreshToken = login.refreshToken;
      await hideLoading();
      Get.to(DonePage());
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
