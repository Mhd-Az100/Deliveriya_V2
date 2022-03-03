import 'package:country_list_pick/country_list_pick.dart';
import 'package:dilivirya/Pages/Authorization/Login/done.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:dilivirya/services/login_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartController extends GetxController with BaseController {
  var colorbutton = orangeColor.obs;
  var Choose = 0.obs;
  final passController = TextEditingController();
  var ispass1 = false.obs;
  var pass = ''.obs;
  var checkbox = 0.obs;
  var firstnameController = TextEditingController();
}
