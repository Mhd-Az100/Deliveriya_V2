import 'package:dilivirya/Pages/Authorization/Login/login_view.dart';
import 'package:dilivirya/Pages/Authorization/SinUp/done.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:dilivirya/services/password_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController with BaseController {
  var pass = ''.obs;
  var passconfirm = ''.obs;
  var ispass1 = false.obs;
  var ispass2 = false.obs;
  var colorbutton = orangeColor.obs;
  var formkey = GlobalKey<FormState>();
  final confirmPassController = TextEditingController();
  final passController = TextEditingController();

  PasswordService passwordService = PasswordService();

  postsignup() async {
    showLoading('Get data');

    var body = {
      'code': code,
      'phone': phonenumber,
      'password': confirmPassController.value.text
    };
    var password = await passwordService.postDatasignup(body);
    if (password != null) {
      postStorageToken(password.accessToken, password.refreshToken);
      accessToken = password.accessToken;
      refreshToken = password.refreshToken;
      await hideLoading();
      Get.to(DonePage());
    }
  }

  postforget() async {
    showLoading('Get data');

    var body = {
      'code': code,
      'phone': phonenumber,
      'password': confirmPassController.value.text
    };
    var password = await passwordService.postDataforget(body);
    if (password != null) {
      await hideLoading();
      Get.offAll(LoginPage());
    }
  }
}
