import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardSwith extends StatelessWidget {
  var switchnotification = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 14.w),
      width: double.infinity,
      height: 68.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Mute notification',
            style: text16400txtcolor,
          ),
          Obx(() {
            return Switch(
              activeColor: purbleColor,
              inactiveThumbColor: switchColor,
              value: switchnotification.value,
              onChanged: (value) {
                switchnotification.value = value;
              },
            );
          })
        ],
      ),
    );
  }
}
