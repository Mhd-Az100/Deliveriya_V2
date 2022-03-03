// ignore_for_file: prefer_is_empty

import 'package:dilivirya/Pages/Authorization/components/TextInput.dart';
import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Setting/components/card_edit.dart';
import 'package:dilivirya/Pages/Setting/components/card_logout.dart';
import 'package:dilivirya/Pages/Setting/setting_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as serviceinput;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Profile extends StatelessWidget {
  var currentindx = 0;
  var firstnameController = TextEditingController();
  var controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background2,
        elevation: 0,
        title: Text(
          'My Profile',
          style: text18600txtcolor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: controller.formkey,
          child: ListView(
            children: [
              CardEdit(),
              SizedBox(height: 11.h),
              TextInput(
                controller: controller.firstnameController.value,
                lebel: 'First Name',
                colorfill: Colors.white,
                validator: validateName,
              ),
              SizedBox(height: 11.h),
              TextInput(
                controller: firstnameController,
                lebel: 'Last Name',
                colorfill: Colors.white,
                validator: validateName,
              ),
              SizedBox(height: 11.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 64.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: controller.showCountryCode2(),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    flex: 3,
                    child: TextInput(
                      colorfill: Colors.white,
                      txttype: TextInputType.number,
                      inputFormatters: [
                        serviceinput.FilteringTextInputFormatter.digitsOnly,
                        serviceinput.LengthLimitingTextInputFormatter(13),
                      ],
                      controller: controller.phoneController.value,
                      validator: validatePhone,
                      lebel: 'Your Number',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Birthdate',
                  style: text14400blaobc,
                ),
              ),
              InkWell(
                onTap: () {
                  DatePicker.showDatePicker(
                    context,
                    minTime: DateTime(1920, 1, 1),
                    maxTime: DateTime(2018, 12, 30),
                    onConfirm: (time) {
                      controller.date.value = time.toString().substring(0, 10);
                    },
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 21.w, vertical: 7.h),
                        height: 53.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Day',
                              style: text12400desc,
                            ),
                            Text(
                              '12 ',
                              style: text16500txtcolor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 21.w, vertical: 7.h),
                        height: 53.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Month',
                              style: text12400desc,
                            ),
                            Text(
                              '12 ',
                              style: text16500txtcolor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 21.w, vertical: 7.h),
                        height: 53.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Year',
                              style: text12400desc,
                            ),
                            Text(
                              '2021',
                              style: text16500txtcolor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Obx(() => Container(
                    height: 60.h,
                    width: 323.w,
                    alignment: Alignment.center,
                    child: CupertinoSlidingSegmentedControl<int>(
                      groupValue: controller.group.value,
                      thumbColor: orangeColor,
                      backgroundColor: backgroundinputcolor,
                      children: {
                        0: SizedBox(
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
                        1: SizedBox(
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
                        2: SizedBox(
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
                    ),
                  )),
              SizedBox(
                height: 11.h,
              ),
              LogoutCard(
                color: pinkbuttonColor,
                icon: SvgPicture.asset('assets/icons/lock.svg'),
                ontap: () {},
                title: 'Reset my password',
              ),
              SizedBox(
                height: 45.h,
              ),
              Bottun(
                txt: 'Save',
                background: orangeColor,
                onpressed: () {
                  if (controller.formkey.currentState!.validate()) {}
                },
                padding: EdgeInsets.symmetric(horizontal: 92.w),
              ),
              SizedBox(
                height: 45.h,
              ),
            ],
          ),
        ),
      ),
    );
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
