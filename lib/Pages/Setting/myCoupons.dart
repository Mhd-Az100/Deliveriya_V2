import 'package:dilivirya/Pages/Cart/cart_view.dart';
import 'package:dilivirya/Pages/Home/components/card_copon.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class myCoupons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
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
            preferredSize: Size.fromHeight(15.h),
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
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
                        'My Coupons',
                        style: text18600txtcolor,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.to(() => Cart());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(children: [
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
                                child:
                                    SvgPicture.asset('assets/icons/circle.svg'),
                              ),
                              Positioned(
                                  top: 3.h,
                                  right: 7.w,
                                  child: Text('2',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp)))
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            bool primary = index % 2 == 0;

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
              child: CardCopon(
                primary: primary,
              ),
            );
          },
        ),
      ),
    );
  }
}
