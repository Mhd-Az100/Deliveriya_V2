import 'package:dilivirya/Pages/Address/components/cardaddress.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Future<dynamic> dialogAddAddress() {
  return Get.defaultDialog(
      title: 'Add new adderss',
      titlePadding: EdgeInsets.only(top: 15.w, right: 90.w),
      titleStyle: TextStyle(
        fontFamily: 'Roboto',
        color: textColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: background2,
      content: SizedBox(
        height: 240.h,
        width: 330.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
              width: 330.w,
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                  child: CardAddress(
                    button: SmallButton(
                      w: 40.w,
                      h: 40.h,
                      icon: SvgPicture.asset('assets/icons/homeaddress2.svg'),
                      color: light2purbleColor,
                    ),
                    type: 'Home',
                  )),
            ),
            SizedBox(
              height: 80.h,
              width: 330.w,
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                  child: CardAddress(
                    button: SmallButton(
                      w: 40.w,
                      h: 40.h,
                      icon: SvgPicture.asset('assets/icons/homeaddress2.svg'),
                      color: light2purbleColor,
                    ),
                    type: 'Work',
                  )),
            ),
            SizedBox(
              height: 80.h,
              width: 330.w,
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                  child: CardAddress(
                    button: SmallButton(
                      w: 40.w,
                      h: 40.h,
                      icon: SvgPicture.asset('assets/icons/homeaddress2.svg'),
                      color: light2purbleColor,
                    ),
                    type: 'Othe',
                  )),
            ),
          ],
        ),
      ));
}
