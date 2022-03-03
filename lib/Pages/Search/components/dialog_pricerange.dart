import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Search/search_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

var controller = Get.find<SerchController>();

Future<Null> dialogPriceRange() {
  return Future.delayed(const Duration(milliseconds: 100), () {
    Get.defaultDialog(
        title: '',
        backgroundColor: background2,
        content: SizedBox(
            height: 400.h,
            width: 330.w,
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Text(
                      ' Price range',
                      style: text18600txtcolor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 17.w,
                      ),
                      Checkbox(
                          value: controller.checkbox.value == 0 ? true : false,
                          onChanged: (value) {
                            controller.checkbox.value = 0;
                          }),
                      Text(
                        '10 - 100',
                        style: text16400descgrey,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 17.w,
                      ),
                      Checkbox(
                          value: controller.checkbox.value == 1 ? true : false,
                          onChanged: (value) {
                            controller.checkbox.value = 1;
                          }),
                      Text(
                        '100 - 1000',
                        style: text16400descgrey,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 17.w,
                      ),
                      Checkbox(
                          value: controller.checkbox.value == 2 ? true : false,
                          onChanged: (value) {
                            controller.checkbox.value = 2;
                          }),
                      Text(
                        '1000 - 10000',
                        style: text16400descgrey,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 17.w,
                      ),
                      Checkbox(
                          value: controller.checkbox.value == 3 ? true : false,
                          onChanged: (value) {
                            controller.checkbox.value = 3;
                          }),
                      Text(
                        '50 - 500',
                        style: text16400descgrey,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 17.w,
                      ),
                      Checkbox(
                          value: controller.checkbox.value == 4 ? true : false,
                          onChanged: (value) {
                            controller.checkbox.value = 4;
                          }),
                      Text(
                        '500 - 5000',
                        style: text16400descgrey,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 17.w,
                      ),
                      Checkbox(
                          value: controller.checkbox.value == 5 ? true : false,
                          onChanged: (value) {
                            controller.checkbox.value = 5;
                          }),
                      Text(
                        '1200 - 12000',
                        style: text16400descgrey,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 150.w),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {},
                      child: Bottun(
                        width: 150.w,
                        onpressed: () {
                          Get.back();
                        },
                        txt: 'Ok',
                        background: controller.colorbutton.value,
                      ),
                    ),
                  ),
                ],
              );
            })));
  });
}
