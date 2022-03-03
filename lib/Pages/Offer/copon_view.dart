import 'package:dilivirya/Pages/Cart/cart_view.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Offer/offer_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CoponDetails extends StatelessWidget {
  var currentindx = 0;
  var copon;
  bool islode = false;
  var idcopon;
  CoponDetails({this.copon, this.idcopon, required this.islode});
  var controller = Get.find<CouponAndOfferController>();

  @override
  Widget build(BuildContext context) {
    if (islode) {
      controller.getdatacoponid(idcopon);
    }
    return Obx(() {
      if (islode) copon = controller.coponid.value;
      if (!islode) controller.isEmptycoponid.value = true;

      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: Colors.transparent,
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
            backgroundColor: purbleColor,
            elevation: 0,
            bottom: PreferredSize(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          color: Colors.white,
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text('Coupons', style: text18600white),
                      ),
                      Expanded(
                        child: Center(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Get.to(() => Cart());
                            },
                            child: Stack(
                              children: [
                                SmallButton(
                                  h: 40.h,
                                  w: 40.h,
                                  icon: SvgPicture.asset(
                                    'assets/icons/cart.svg',
                                    color: Colors.white,
                                  ),
                                  color: lightpurbleColor,
                                ),
                                Positioned(
                                  top: 3.h,
                                  right: 4.w,
                                  child: SvgPicture.asset(
                                      'assets/icons/circle.svg'),
                                ),
                                Positioned(
                                    top: 2.h,
                                    right: 6.w,
                                    child: Text('2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp)))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(30.h)),
          ),
          body: controller.isEmptycoponid.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(right: 20.w, left: 20.w, top: 40.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Take our coupon !',
                            style: text20500txtcolor,
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                          Text(
                            'Enter the code to get ${copon.discountRate}% off all products.',
                            style: text16400descgrey,
                          ),
                          SizedBox(
                            height: 31.h,
                          ),
                          Text(
                            'Coupon code',
                            style: text14400blaobc,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 21.w, vertical: 16.h),
                            height: 53.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              copon.code,
                              style: text14600orange,
                            ),
                          ),
                          SizedBox(
                            height: 31.h,
                          ),
                          Text(
                            'vaild time',
                            style: text14400blaobc,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'from',
                                        style: text12400desc,
                                      ),
                                      Text(
                                        ' ${copon.from.substring(8, 10)}  / ${copon.from.substring(5, 7)} / ${copon.from.substring(0, 4)}',
                                        style: text16500txtcolor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 17.w,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'to',
                                        style: text12400desc,
                                      ),
                                      Text(
                                        ' ${copon.to.substring(8, 10)}  / ${copon.to.substring(5, 7)} / ${copon.to.substring(0, 4)}',
                                        style: text16500txtcolor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 31.h,
                          ),
                          Text(
                            'Status',
                            style: text14400blaobc,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    copon.isActive
                        ? Container(
                            height: 53.h,
                            width: double.infinity,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                'Active',
                                style: text16500white,
                              ),
                            ),
                          )
                        : Container(
                            height: 53.h,
                            width: double.infinity,
                            color: pinkColor,
                            child: Center(
                              child: Text(
                                'Expired',
                                style: text16500white,
                              ),
                            ),
                          ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: purbleColor,
                  ),
                ));
    });
  }
}
