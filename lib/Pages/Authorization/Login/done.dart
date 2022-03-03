import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Home/home_view.dart';
import 'package:dilivirya/Pages/Navbar/navbar.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 188.h,
              right: 111.w,
              left: 111.w,
              child: Container(
                height: 160.h,
                width: 160.w,
                child: Image(image: AssetImage('assets/images/done2.png')),
              ),
            ),
            Positioned(
              top: 390.h,
              right: 51.w,
              left: 51.w,
              child: Container(
                alignment: Alignment.center,
                height: 45.h,
                width: 272.w,
                child: Text(
                  'Welcome again !',
                  style: TextStyle(
                    color: purbleColor,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 591.h,
              right: 26.w,
              left: 27.w,
              child: Bottun(
                onpressed: () {
                  Get.offAll(() => Navbar(0, 0));
                },
                txt: 'Go to App',
                background: orangeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? validateName(String? value) {
    if (value!.length == 0)
      return 'Please enter Name';
    else
      return null;
  }
}
