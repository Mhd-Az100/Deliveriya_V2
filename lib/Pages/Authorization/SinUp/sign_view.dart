// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, unrelated_type_equality_checks

import 'package:dilivirya/Pages/Authorization/Verfication/verfication_view.dart';
import 'package:dilivirya/Pages/Authorization/components/TextInput.dart';
import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as serviceinput;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'sign_view_model.dart';

class SignupPage extends StatelessWidget {
  var controller = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Obx(
          () {
            checkcolorbutton();
            return Form(
              key: controller.formkey,
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
                    padding: EdgeInsets.only(
                      top: 10.h,
                      left: 27.w,
                    ),
                    child: Container(
                        child: Text(
                      'so we can verify that it belongs to you.',
                      style: text16400descgrey,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 45.h,
                      left: 26.w,
                      right: 26.w,
                    ),
                    child: Container(
                      width: 323.w,
                      child: TextInput(
                        onChanged: (v) {
                          controller.name.value = v;
                        },
                        controller: controller.firstnameController.value,
                        validator: validateName,
                        lebel: 'First name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16.h,
                      left: 26.w,
                      right: 26.w,
                    ),
                    child: Container(
                      width: 323.w,
                      child: TextInput(
                        onChanged: (v) {
                          controller.lastname.value = v;
                        },
                        controller: controller.lastnameController.value,
                        validator: validateName,
                        lebel: 'Last name',
                      ),
                    ),
                  ),
                  // Obx(() =>
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16.h,
                      left: 26.w,
                      right: 26.w,
                    ),
                    child: Container(
                        height: 60.h,
                        width: 323.w,
                        alignment: Alignment.center,
                        child: CupertinoSlidingSegmentedControl<int>(
                          groupValue: controller.group.value,
                          thumbColor: orangeColor,
                          backgroundColor: backgroundinputcolor,
                          children: {
                            0: Container(
                              height: 45.h,
                              width: 99.w,
                              //  color: backgroundinputcolor,
                              child: Center(
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                      color: controller.group.value == 0
                                          ? background
                                          : inputcolor),
                                ),
                              ),
                            ),
                            1: Container(
                              height: 45.h,
                              width: 99.w,
                              //  color: backgroundinputcolor,
                              child: Center(
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                      color: controller.group.value == 1
                                          ? background
                                          : inputcolor),
                                ),
                              ),
                            ),
                            2: Container(
                              height: 45.h,
                              width: 99.w,
                              // color: backgroundinputcolor,
                              child: Center(
                                child: Text(
                                  'Other',
                                  style: TextStyle(
                                      color: controller.group.value == 2
                                          ? background
                                          : inputcolor),
                                ),
                              ),
                            )
                          },
                          onValueChanged: (groupValue) {
                            controller.group.value = groupValue!;
                          },
                        )),
                    // ),
                  ),
                  Container(
                    height: 49.h,
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    margin:
                        EdgeInsets.symmetric(horizontal: 26.w, vertical: 16),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: backgroundinputcolor,
                    ),
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
                  SizedBox(
                    height: 16.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 17.w,
                      ),
                      Checkbox(
                          value: controller.checkbox.value,
                          onChanged: (value) {
                            controller.checkbox.value = value!;
                          }),
                      Text(
                        'I agree to the terms and privecy policy',
                        style: text14700desc,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Bottun(
                    onpressed: () {
                      if (controller.formkey.currentState!.validate()) {}
                      if (checkcolorbutton()) {
                        controller.postsignup();
                      }
                    },
                    txt: 'Sign up',
                    background: controller.colorbutton.value,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool checkcolorbutton() {
    controller.name.value.length != 0 &&
            controller.lastname.value.length != 0 &&
            controller.phone.value.length != 0 &&
            controller.checkbox.value
        ? controller.colorbutton.value = orangeColor
        : controller.colorbutton.value = orangeColor.withOpacity(0.3);
    return controller.name.value.length != 0 &&
            controller.lastname.value.length != 0 &&
            controller.phone.value.length != 0 &&
            controller.checkbox.value
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
}
