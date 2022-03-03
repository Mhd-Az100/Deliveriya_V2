import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Cart/cart_view_model.dart';
import 'package:dilivirya/Pages/Cart/components/cardChoosAddress.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/address/components/cardaddress.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

var controller = Get.find<CartController>();

Future<dynamic> dialogChangeAddress() {
  return Get.defaultDialog(
      title: '',
      backgroundColor: background2,
      content: SizedBox(
        height: 340.h,
        width: 330.w,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter you Address',
                    style: text24500txtcolor,
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.back();

                      Get.defaultDialog(
                          title: '',
                          backgroundColor: background2,
                          content: SizedBox(
                            height: 280.h,
                            width: 330.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.w, right: 10.w),
                                  child: Text(
                                    'Add new adderss',
                                    style: text24500txtcolor,
                                  ),
                                ),
                                SizedBox(
                                  height: 80.h,
                                  width: 330.w,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.h, horizontal: 20.w),
                                      child: CardAddress()),
                                ),
                                SizedBox(
                                  height: 80.h,
                                  width: 330.w,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.h, horizontal: 20.w),
                                      child: CardAddress()),
                                ),
                                SizedBox(
                                  height: 80.h,
                                  width: 330.w,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.h, horizontal: 20.w),
                                      child: CardAddress()),
                                ),
                              ],
                            ),
                          ));

                      // Get.to(AddAddress());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 8.h,
                        bottom: 8.h,
                      ),
                      child: SmallButton(
                        w: 40.w,
                        h: 40.h,
                        icon: const Icon(
                          Icons.add,
                          color: addbuttonColor,
                        ),
                        color: addbuttonColorbackground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 220.h,
              width: 330.w,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                      child: CardChoosAddress(
                        index: index,
                      ));
                },
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // InkWell(
                //   highlightColor: Colors.transparent,
                //   onTap: () {},
                //   child: Container(
                //     height: 50.h,
                //     width: 140.w,
                //     decoration: BoxDecoration(
                //       border:
                //           Border.all(color: purbleColor),
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(15.r),
                //       ),
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Set point on map',
                //         style: text16pur400,
                //       ),
                //     ),
                //   ),
                // ),
                Bottun(
                  width: 160,
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  onpressed: () {
                    Get.back();
                  },
                  txt: 'Save',
                  background: controller.colorbutton.value,
                ),
              ],
            ),
          ],
        ),
      ));
}
