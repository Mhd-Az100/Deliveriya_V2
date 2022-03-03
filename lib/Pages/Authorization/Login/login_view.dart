// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, unrelated_type_equality_checks

import 'package:dilivirya/Pages/Authorization/Login/done.dart';
import 'package:dilivirya/Pages/Authorization/Login/login_view_model.dart';
import 'package:dilivirya/Pages/Authorization/SinUp/sign_view.dart';
import 'package:dilivirya/Pages/Authorization/components/TextInput.dart';
import 'package:dilivirya/Pages/Authorization/components/TextInputPassword.dart';
import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Authorization/forget_password/forget_password_view.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as serviceinput;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  var controller = Get.find<LoginController>();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var group = 0.obs;
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Obx(
          () {
            checkcolorbutton();
            return Form(
              key: formkey,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 88.h,
                      left: 27.w,
                    ),
                    child: Container(
                        child: Text(
                      'Enter your information',
                      style: text24500txtcolor,
                    )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 10.h, left: 27.w, right: 34.w),
                    child: Container(
                        child: Text(
                      'Login with your information that you enterd in sinup step.',
                      style: text16400descgrey,
                    )),
                  ),
                  SizedBox(
                    height: 105.h,
                  ),
                  Container(
                    height: 49.h,
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    margin:
                        EdgeInsets.symmetric(horizontal: 26.w, vertical: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: backgroundinputcolor,
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.showCountryCode2(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: 64.w,
                            height: 49.h,
                            decoration: BoxDecoration(
                              color: backgroundinputcolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                            ),
                            child: Center(
                                child:
                                    // Obx(() =>
                                    Text(
                              controller.countryCode.value,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  color: Colors.grey),
                            )),
                            // ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 49.h,
                            child: TextInput(
                              onChanged: (v) {
                                controller.phone.value = v;
                              },
                              txttype: TextInputType.number,
                              inputFormatters: [
                                serviceinput
                                    .FilteringTextInputFormatter.digitsOnly,
                                serviceinput.LengthLimitingTextInputFormatter(
                                    13),
                              ],
                              controller: controller.phoneController.value,
                              validator: validatePhone,
                              lebel: 'Phone Number',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 17.h, left: 26.w, right: 26.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      child: TextInputPassword(
                        txttype: TextInputType.visiblePassword,
                        validator: validatePass,
                        controller: controller.passController,
                        lebel: 'password',
                        prefixtxt: '',
                        ispassword: controller.ispass.value,
                        suffixIcon: controller.ispass.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixPressed: () {
                          controller.ispass.value = !controller.ispass.value;
                        },
                        onChanged: (v) {
                          controller.pass.value = v;
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.to(() => ForgetPage());
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 232.w, top: 12.h),
                      child: Text(
                        ' Forget password ?',
                        style: text14800orange,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 95.h,
                  ),
                  Bottun(
                    onpressed: () {
                      if (checkcolorbutton()) if (formkey.currentState!
                          .validate()) {
                        if (checkcolorbutton()) {
                          controller.postlogin();
                        }
                      }
                    },
                    txt: 'Login',
                    background: controller.colorbutton.value,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 12.h),
                        child: Text(
                          'if you don’t have an account ',
                          style: text14400descgrey,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(SignupPage());
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 12.h),
                          child: Text(
                            'Create account',
                            style: text14800orange,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool checkcolorbutton() {
    controller.phone.value.length != 0 && controller.pass.value.length != 0
        ? controller.colorbutton.value = orangeColor
        : controller.colorbutton.value = orangeColor.withOpacity(0.3);
    return controller.phone.value.length != 0 &&
            controller.pass.value.length != 0
        ? true
        : false;
  }

  String? validateName(String? value) {
    if (value!.length == 0)
      return 'enter text please';
    else
      return null;
  }

  String? validatePhone(String? value) {
    if (value!.length == 0 || value.length < 8)
      return 'not correct';
    else
      return null;
  }

  String? validatePass(String? value) {
    if (value!.length == 0)
      return 'Please enter Password';
    else if (value.length < 8 || value.length > 32) {
      return 'Password value range 8-32 char';
    } else
      return null;
  }
}
