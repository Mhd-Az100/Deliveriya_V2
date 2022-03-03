import 'dart:developer';

import 'package:dilivirya/Pages/Authorization/Login/login_view.dart';
import 'package:dilivirya/Pages/Authorization/SinUp/sign_view.dart';
import 'package:dilivirya/Pages/Home/components/top_sheet.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:dilivirya/model/product_model.dart';
import 'package:dilivirya/services/home_service.dart';
import 'package:dilivirya/utils/Error/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with BaseController {
  getTopSheet(context) async {
    TopSheet.show(
        context: context,
        child: Container(
            decoration: BoxDecoration(
              color: purbleColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            height: 150.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Get.to(() => LoginPage());
                      },
                      child: Container(
                        width: 130.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          'Login',
                          style: text18400purb,
                        )),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Get.to(() => SignupPage());
                      },
                      child: Container(
                        width: 130.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          'Sign up',
                          style: text18400purb,
                        )),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35.h),
                  child: Container(
                    width: 90.w,
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                  ),
                )
              ],
            )),
        direction: YudizModalSheetDirection.TOP);
  }

  List<Responseproduct> responseproductnew = <Responseproduct>[].obs;
  List<Responseproduct> responseproductmost = <Responseproduct>[].obs;
  List<Responseproduct> responseproductrecommend = <Responseproduct>[].obs;
  HomeService homeService = HomeService();

  var isEmptynew = false.obs;
  var isEmptymost = false.obs;
  var isEmptyrecommend = false.obs;
  getdatanew() async {
    responseproductnew = [];
    isEmptynew.value = false;
    responseproductnew = await homeService.getDataHomenew();
    if (responseproductnew.isNotEmpty) isEmptynew.value = true;
  }

  getdatamost() async {
    responseproductmost = [];
    isEmptymost.value = false;
    responseproductmost = await homeService.getDataHomemostorder();
    if (responseproductmost.isNotEmpty) isEmptymost.value = true;
  }

  getdatarecommend() async {
    responseproductrecommend = [];
    isEmptyrecommend.value = false;
    responseproductrecommend = await homeService.getDataHomerecommend();
    if (responseproductrecommend.isNotEmpty) isEmptyrecommend.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    getdatanew();
    getdatarecommend();
  }
}
