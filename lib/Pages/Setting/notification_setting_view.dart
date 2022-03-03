import 'package:dilivirya/Pages/Setting/components/card_choosesound.dart';
import 'package:dilivirya/Pages/Setting/components/card_switch.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotiSetting extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background2,
        elevation: 0,
        title: Text(
          'Notification Settings',
          style: text18600txtcolor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            CardSwith(),
            SizedBox(
              height: 12.h,
            ),
            CardSound(),
          ],
        ),
      ),
    );
  }
}
