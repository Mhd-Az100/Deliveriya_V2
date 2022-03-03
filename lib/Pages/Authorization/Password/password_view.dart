import 'package:dilivirya/Pages/Authorization/Password/password_view_model.dart';
import 'package:dilivirya/Pages/Authorization/SinUp/done.dart';
import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Authorization/components/textInputPassword.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PasswordPage extends StatelessWidget {
  var controller = Get.find<PasswordController>();

  var forget = false;
  PasswordPage(this.forget);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Obx(
          () {
            checkcolorbutton();
            return ListView(
              //   mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 88.h,
                    left: 27.w,
                  ),
                  child: Text(
                    'Enter your password.',
                    style: text24500txtcolor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 27.w,
                  ),
                  child: Text(
                    'Make sure no one knows your password.',
                    style: text16400descgrey,
                  ),
                ),
                Form(
                  key: controller.formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 122.h, left: 26.w, right: 26.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          child: TextInputPassword(
                            txttype: TextInputType.visiblePassword,
                            validator: validatePass,
                            controller: controller.passController,
                            lebel: 'password'.tr,
                            prefixtxt: '',
                            ispassword: controller.ispass1.value,
                            suffixIcon: controller.ispass1.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onChanged: (v) {
                              controller.pass.value = v;
                            },
                            suffixPressed: () {
                              controller.ispass1.value =
                                  !controller.ispass1.value;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 17.h, left: 26.w, right: 26.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          child: TextInputPassword(
                            txttype: TextInputType.visiblePassword,
                            validator: validatePassconfirm,
                            controller: controller.confirmPassController,
                            lebel: 'Confirm password',
                            onChanged: (v) {
                              controller.passconfirm.value = v;
                            },
                            prefixtxt: '',
                            ispassword: controller.ispass2.value,
                            suffixIcon: controller.ispass2.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            suffixPressed: () {
                              controller.ispass2.value =
                                  !controller.ispass2.value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 207.h,
                ),
                Obx(() => Bottun(
                      onpressed: () {
                        if (checkcolorbutton()) if (controller
                            .formkey.currentState!
                            .validate()) {
                          if (checkcolorbutton()) {
                            forget
                                ? controller.postforget()
                                : controller.postsignup();
                          }
                        }
                      },
                      txt: 'Sign up',
                      background: controller.colorbutton.value,
                    )),
              ],
            );
          },
        ),
      ),
    );
  }

  bool checkcolorbutton() {
    controller.pass.value.length != 0 &&
            controller.passconfirm.value.length != 0
        ? controller.colorbutton.value = orangeColor
        : controller.colorbutton.value = orangeColor.withOpacity(0.3);
    return controller.pass.value.length != 0 &&
            controller.passconfirm.value.length != 0
        ? true
        : false;
  }

  String? validatePass(String? value) {
    if (value!.length == 0)
      return 'Please enter Password';
    else if (value.length < 8 || value.length > 32) {
      return 'Password value range 8-32 char';
    } else
      return null;
  }

  String? validatePassconfirm(String? value) {
    if (value!.length == 0)
      return 'Please enter Password';
    else if (value.length < 8 || value.length > 32) {
      return 'Password value range 8-32 char';
    } else if (controller.pass.value != controller.passconfirm.value)
      return 'not correct';
    else
      return null;
  }
}
