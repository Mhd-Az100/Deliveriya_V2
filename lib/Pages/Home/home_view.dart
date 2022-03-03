// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:dilivirya/Pages/Cart/cart_view.dart';
import 'package:dilivirya/Pages/Home/components/card_copon.dart';
import 'package:dilivirya/Pages/Home/components/card_story.dart';
import 'package:dilivirya/Pages/Home/components/large_card_home.dart';
import 'package:dilivirya/Pages/Home/components/search_bar.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Home/components/small_card.dart';
import 'package:dilivirya/Pages/Home/view_model/home_view_model.dart';
import 'package:dilivirya/Pages/Notifications/notifications_view.dart';
import 'package:dilivirya/Pages/Offer/offer_view_model.dart';
import 'package:dilivirya/helper/Shimmer_loading.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  var controller = Get.find<HomeController>();
  var ctrl = Get.find<CouponAndOfferController>();
  ScrollPhysics physics = const ScrollPhysics();
  @override
  Widget build(BuildContext context) {
    if (chickToken()) {
      if (chickinopenapp) {
        Timer(
            const Duration(seconds: 1), () => controller.getTopSheet(context));
        chickinopenapp = false;
      }
    }

    return Scaffold(
      backgroundColor: background2,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h), // here the desired height
        child: AppBar(
          backgroundColor: background2,
          elevation: 0,
          bottom: PreferredSize(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text.rich(
                        TextSpan(
                            text: 'Welcome to ',
                            style: text18400grey,
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'Deliverya!',
                                style: text18900orange,
                              ),
                            ]),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.to(() => NotificationsView());
                        },
                        child: Stack(
                          children: [
                            SmallButton(
                              h: 40.h,
                              w: 40.w,
                              icon: SvgPicture.asset('assets/icons/noti.svg'),
                              color: orangebuttonColor,
                            ),
                            Positioned(
                              top: 3.h,
                              right: 4.w,
                              child:
                                  SvgPicture.asset('assets/icons/circle.svg'),
                            ),
                            Positioned(
                                top: 2.h,
                                right: 6.w,
                                child: Text('2',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp)))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.to(() => Cart());
                        },
                        child: Stack(
                          children: [
                            SmallButton(
                              h: 40.h,
                              w: 40.w,
                              icon: SvgPicture.asset('assets/icons/cart.svg'),
                              color: purblebuttonColor,
                            ),
                            Positioned(
                              top: 3.h,
                              right: 4.w,
                              child:
                                  SvgPicture.asset('assets/icons/circle.svg'),
                            ),
                            Positioned(
                                top: 2.h,
                                right: 6.w,
                                child: Text('2',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp)))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              preferredSize: const Size.fromHeight(0.0)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SearchBar(),
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CardStory(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 8.h, left: 23.w),
                  child: Text(
                    'Our coupons',
                    style: text14400blaobc,
                  ),
                ),
                Obx(() => SizedBox(
                      width: double.infinity,
                      height: 150.h,
                      child: controller.isEmptynew.value
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: ctrl.copon.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                bool primary = index % 2 == 0;
                                return Padding(
                                  padding: index == 2
                                      ? EdgeInsets.only(left: 16.w, right: 16.w)
                                      : EdgeInsets.only(left: 16.w),
                                  child: CardCopon(
                                    primary: primary,
                                    itemcopon: ctrl.copon[index],
                                  ),
                                );
                              })
                          : ShimmerWidget.couponcard(),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 8.h, left: 23.w),
                  child: Text(
                    'Today new product’s',
                    style: text14400blaobc,
                  ),
                ),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 270.h,
                    child: controller.isEmptynew.value
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            // shrinkWrap: true,
                            itemCount: controller.responseproductnew.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                                  padding: index ==
                                          controller.responseproductnew.length -
                                              1
                                      ? EdgeInsets.only(left: 16.w, right: 16.w)
                                      : EdgeInsets.only(left: 16.w),
                                  child: SmallCard(
                                    type: 'product',
                                    item: controller.responseproductnew[index],
                                  ),
                                ))
                        : ShimmerWidget.smallcard(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32.h, bottom: 8.h, left: 23.w),
                  child: Text(
                    'Best sales',
                    style: text14400blaobc,
                  ),
                ),
                Obx(() => SizedBox(
                      width: double.infinity,
                      height: 270.h,
                      child: controller.isEmptynew.value
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              // shrinkWrap: true,
                              itemCount: controller.responseproductnew.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                    padding: index ==
                                            controller
                                                    .responseproductnew.length -
                                                1
                                        ? EdgeInsets.only(
                                            left: 16.w, right: 16.w)
                                        : EdgeInsets.only(left: 16.w),
                                    child: SmallCard(
                                      type: 'product',
                                      item:
                                          controller.responseproductnew[index],
                                    ),
                                  ))
                          : ShimmerWidget.smallcard(),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 32.h, bottom: 8.h, left: 23.w),
                  child: Text(
                    'Related product for you 👌',
                    style: text14400blaobc,
                  ),
                ),
                Obx(() => SizedBox(
                      width: double.infinity,
                      height: 270.h,
                      child: controller.isEmptyrecommend.value
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  controller.responseproductrecommend.length,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: LargeCardHome(
                                  type: 'product',
                                  item: controller
                                      .responseproductrecommend[index],
                                ),
                              ),
                            )
                          : ShimmerWidget.largcard(),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
