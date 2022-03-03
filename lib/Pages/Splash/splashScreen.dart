import 'dart:async';
import 'package:dilivirya/Pages/Navbar/navbar.dart';
import 'package:dilivirya/Pages/Splash/onboarding.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  @override
  _splashScreen createState() => _splashScreen();
}

class _splashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var onboarding = box.read('onboarding');
    onboarding == 0
        ? Timer(
            const Duration(seconds: 4),
            () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => OnBoarding())))
        : Timer(
            const Duration(seconds: 2),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Navbar(0, 0))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: background,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 67.h, right: 270.w),
              child: Container(
                height: 159.h,
                width: 135.w,
                child: Image(image: AssetImage('assets/images/Vector 25.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 109.h, left: 83.w, right: 83.w),
              child: Container(
                height: 97.h,
                width: 209.w,
                child: Image(image: AssetImage('assets/images/Vector.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 31.h),
              child: Container(
                height: 15.h,
                width: 207.w,
                child: Image(image: AssetImage('assets/images/Deliverya.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 215.h, left: 250.w),
              child: Container(
                height: 119.h,
                width: 350.w,
                child: Image(image: AssetImage('assets/images/Vector 26.png')),
              ),
            )
          ],
        ));
  }
}
