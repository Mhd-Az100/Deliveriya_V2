import 'package:dilivirya/Pages/Favorite/favorite_view.dart';
import 'package:dilivirya/Pages/Order%20History/order_history_view.dart';
import 'package:dilivirya/Pages/Setting/components/card_list.dart';
import 'package:dilivirya/Pages/Setting/components/card_logout.dart';
import 'package:dilivirya/Pages/Setting/components/card_profile.dart';
import 'package:dilivirya/Pages/Setting/components/dialog_logout.dart';
import 'package:dilivirya/Pages/Setting/myCoupons.dart';
import 'package:dilivirya/Pages/Setting/notification_setting_view.dart';
import 'package:dilivirya/Pages/Setting/setting_view_model.dart';
import 'package:dilivirya/Pages/address/address_view.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  var currentindx = 0;
  var controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    controller.getprofile();
    return Scaffold(
      backgroundColor: background2,
      appBar: AppBar(
        backgroundColor: background2,
        elevation: 0,
        title: Text(
          'Settings',
          style: text18600txtcolor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            const CardProfile(),
            SizedBox(height: 11.h),
            CardListProfile(
                icon: SvgPicture.asset(
                  'assets/icons/coupon.svg',
                ),
                color: greenbuttonColor,
                title: 'My Coupons',
                ontap: () {
                  Get.to(() => myCoupons());
                }),
            SizedBox(height: 11.h),
            CardListProfile(
                icon: SvgPicture.asset(
                  'assets/icons/marker.svg',
                  color: Colors.amber,
                  width: 16.w,
                ),
                color: orangebuttonColor,
                title: 'My Address',
                ontap: () {
                  Get.to(() => MyAddress());
                }),
            SizedBox(height: 11.h),
            CardListProfile(
                icon: SvgPicture.asset(
                  'assets/icons/fav.svg',
                  color: Colors.blue,
                ),
                color: bluebuttonColor,
                title: 'Favorite',
                ontap: () {
                  Get.to(() => Favorite());
                }),
            SizedBox(height: 11.h),
            CardListProfile(
                icon: SvgPicture.asset('assets/icons/clock.svg',
                    color: Colors.greenAccent[700]),
                color: greenbuttonColor,
                title: 'Order History',
                ontap: () {
                  Get.to(() => OrderHistory());
                }),
            SizedBox(height: 11.h),
            // CardListProfile(
            //     icon: const Icon(Icons.translate, color: purbleColor),
            //     color: purblebuttonColor,
            //     title: 'Language',
            //     ontap: () {
            //       // Get.to(() => OrderHistory());
            //     }),
            // SizedBox(height: 11.h),
            CardListProfile(
                icon: SvgPicture.asset(
                  'assets/icons/noti.svg',
                  color: Colors.blue,
                ),
                color: greenbuttonColor,
                title: 'Notification Settings',
                ontap: () {
                  Get.to(() => NotiSetting());
                }),
            SizedBox(height: 11.h),
            CardListProfile(
                icon: SvgPicture.asset(
                  'assets/icons/phone.svg',
                ),
                color: orangebuttonColor,
                title: 'Contact us',
                ontap: () {
                  Get.to(() => NotiSetting());
                }),
            SizedBox(height: 11.h),

            LogoutCard(
              icon: SvgPicture.asset('assets/icons/logout.svg'),
              ontap: () {
                dialogLoguot();
              },
              title: 'Log out',
            ),
            SizedBox(height: 48.h),
            Center(
              child: Text(
                'Privecy Policy',
                style: text12400purb,
              ),
            ),
            SizedBox(height: 7.h),
            Center(
              child: Text(
                'v1.0.0',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: const Color(0xff7C8499),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
