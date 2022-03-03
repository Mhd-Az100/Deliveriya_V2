import 'package:dilivirya/Pages/Authorization/Password/password_view.dart';
import 'package:dilivirya/Pages/Authorization/Verfication/verfication_view_model.dart';
import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';

class VerficationPage extends StatelessWidget {
  var controller = Get.find<VerficationController>();
  var forget = false;
  VerficationPage(this.forget);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 88.h,
                    left: 27.w,
                  ),
                  child: Text(
                    'Enter your verfication code.',
                    style: text24500txtcolor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 27.w, right: 46.w),
                  child: Text(
                    'We send to you a verfication code to your number pleas enter it here.',
                    style: text16400descgrey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 133.h, left: 43.w, right: 43.w),
                  child: OTPTextField(
                    width: double.infinity,
                    length: 6,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    outlineBorderRadius: 4,
                    fieldWidth: 40,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: background,
                      disabledBorderColor: purbleColor,
                      enabledBorderColor: purbleColor,
                    ),
                    onChanged: (k) {
                      if (k.length != 6) {
                        controller.complate.value = false;

                        controller.colorbutton.value =
                            orangeColor.withOpacity(0.3);
                      } else {
                        controller.complate.value = true;

                        controller.colorbutton.value = orangeColor;
                      }
                    },
                    onCompleted: (n) {
                      controller.complate.value = true;
                      controller.colorbutton.value = orangeColor;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 250.h,
            ),
            Obx(() => Bottun(
                  onpressed: () {
                    if (controller.complate.value) {}
                    Get.to(PasswordPage(forget));
                  },
                  txt: 'Verify',
                  background: controller.colorbutton.value,
                )),
          ],
        ),
      ),
    );
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
