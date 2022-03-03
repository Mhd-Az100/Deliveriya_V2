import 'package:dilivirya/Pages/Cart/cart_view.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Notifications/components/card_notification.dart';
import 'package:dilivirya/Pages/Notifications/notifications_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationsView extends StatelessWidget {
  var controler = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    controler.getdatanotification();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0.h), // here the desired height
          child: AppBar(
            backgroundColor: background2,
            elevation: 0,
            title: Text(
              'Notifications',
              style: text18600txtcolor,
            ),
            actions: [
              InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  Get.to(() => Cart());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      SmallButton(
                        h: 40.h,
                        w: 40.w,
                        icon: SvgPicture.asset(
                          'assets/icons/cart.svg',
                          color: orangeColor,
                        ),
                        color: orangebuttonColor,
                      ),
                      Positioned(
                        top: 3.h,
                        right: 4.w,
                        child: SvgPicture.asset('assets/icons/circle.svg'),
                      ),
                      Positioned(
                          top: 3.h,
                          right: 7.w,
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
        body: Obx(() {
          return controler.isEmptynotification.value
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  itemCount: controler.notification.length,
                  itemBuilder: (context, index) => Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                      child: Cardnotification(
                          item: controler.notification[index])),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: purbleColor,
                  ),
                );
        }));
  }
}
