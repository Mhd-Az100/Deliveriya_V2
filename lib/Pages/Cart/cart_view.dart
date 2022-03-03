import 'package:dilivirya/Pages/Cart/checkout_view.dart';
import 'package:dilivirya/Pages/Cart/components/card_addprud.dart';
import 'package:dilivirya/Pages/Cart/components/card_bottomtotal.dart';
import 'package:dilivirya/Pages/Cart/components/card_cart.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Order%20History/order_history_view.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background2,
      appBar: AppBar(
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          color: Colors.transparent,
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: background2,
        elevation: 0,
        bottom: PreferredSize(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.black,
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      'Your Cart',
                      style: text18600txtcolor,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.off(OrderHistory());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 8.h,
                            bottom: 8.h,
                          ),
                          child: SmallButton(
                            w: 40.w,
                            h: 40.h,
                            icon: SvgPicture.asset(
                              'assets/icons/clock.svg',
                              color: orangeColor,
                            ),
                            color: orangebuttonColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(15.h)),
      ),
      body: Stack(
        children: [
          Positioned(
              top: 5.h, right: 0.w, left: 0.w, child: const CardAddPrud()),
          Padding(
            padding: EdgeInsets.only(top: 77.h, bottom: 142.h),
            child: SizedBox(
              height: 626.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: 25,
                itemBuilder: (context, index) => Dismissible(
                  onDismissed: (DismissDirection direction) {
                    // setState(() {
                    //   data.removeAt(index);
                    // });
                  },
                  secondaryBackground: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 37.0),
                        child: SmallButton(
                          w: 40.w,
                          h: 40.h,
                          color: redbuttonColor,
                          icon: SvgPicture.asset('assets/icons/delete.svg'),
                        ),
                      ),
                    ],
                  ),
                  background: Container(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                    child: const CardCart(),
                  ),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            right: 0.w,
            left: 0.w,
            child: CardBottomTotal(
              title: 'Continue',
              ontap: () {
                Get.to(() => CheckOut());
              },
            ),
          ),
        ],
      ),
    );
  }
}
