import 'package:dilivirya/Pages/Cart/cart_view.dart';
import 'package:dilivirya/Pages/Home/components/card_copon.dart';
import 'package:dilivirya/Pages/Home/components/large_card_home.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Offer/components/large_card_offer.dart';
import 'package:dilivirya/Pages/Offer/components/large_card_offer.dart';
import 'package:dilivirya/Pages/Search/search_view.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'offer_view_model.dart';

class OfferView extends StatelessWidget {
  var controler = Get.find<CouponAndOfferController>();

  @override
  Widget build(BuildContext context) {
    controler.getdatacopon();
    controler.getdataoffer();
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
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 25.w, right: 15.w, bottom: 16.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Offers',
                            style: text18600txtcolor,
                          ),
                          Center(
                            child: InkWell(
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
                                      child: SvgPicture.asset(
                                          'assets/icons/circle.svg'),
                                    ),
                                    Positioned(
                                        top: 3.h,
                                        right: 7.w,
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
                      const TabBar(
                        labelColor: purbleColor,
                        indicatorColor: purbleColor,
                        tabs: <Widget>[
                          Tab(
                            text: 'Coupons',
                          ),
                          Tab(
                            text: 'Discounts',
                          ),
                        ],
                      ),
                    ],
                  )),
              preferredSize: const Size.fromHeight(70.0)),
        ),
        body: TabBarView(
          children: [
            Obx(() {
              return controler.isEmptycopon.value
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: controler.copon.length,
                      itemBuilder: (context, index) {
                        bool primary = index % 2 == 0;
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 20.w),
                          child: CardCopon(
                              primary: primary,
                              itemcopon: controler.copon[index]),
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: purbleColor,
                      ),
                    );
            }),
            Obx(() {
              return controler.isEmptyoffer.value
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      shrinkWrap: true,
                      itemCount: controler.offer.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: LargeCardOffer(
                          item: controler.offer[index],
                          type: 'offer',
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: purbleColor,
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
