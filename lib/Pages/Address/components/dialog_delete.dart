import 'package:dilivirya/Pages/Address/address_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

var controller = Get.find<AddressController>();

Future<dynamic> dialogDeletAddress(String id) {
  return Get.defaultDialog(
      title: '',
      backgroundColor: background2,
      content: SizedBox(
        height: 140.h,
        width: 330.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Text(
                'Delete',
                style: text16400red,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
              child: Text(
                'Are you sure you did the deletion process?',
                style: text14400descgrey,
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Cansle',
                    style: text16500txtcolor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12.w, left: 30.w),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      controller.deleteAddress(id);
                    },
                    child: Container(
                      height: 35.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: pinkColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Delete',
                          style: text16400red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
}
