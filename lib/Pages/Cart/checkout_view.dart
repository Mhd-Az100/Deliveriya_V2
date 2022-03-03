import 'package:dilivirya/Pages/Authorization/components/TextInput.dart';
import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Cart/cart_view_model.dart';
import 'package:dilivirya/Pages/Cart/components/address_details_cart.dart';
import 'package:dilivirya/Pages/Cart/components/card_bail.dart';
import 'package:dilivirya/Pages/Cart/components/card_bottomtotal.dart';
import 'package:dilivirya/Pages/Cart/components/dialog_changeaddress.dart';
import 'package:dilivirya/Pages/Cart/done.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Order%20History/order_history_view.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  var controller = Get.find<CartController>();

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
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 16.h),
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
                      'Check out',
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Address',
                      style: text14400blaobc,
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        controller.Choose.value = 0;
                        dialogChangeAddress();
                      },
                      child: Text(
                        'change address',
                        style: text12700orange,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                AddressDetailsCart(
                  isEmpty: true,
                ),
                SizedBox(
                  height: 26.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Coupon code',
                    style: text14400blaobc,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextInput(
                  colorfill: Colors.white,
                  controller: controller.firstnameController,
                  lebel: 'Enter your coupon code here',
                ),
                SizedBox(
                  height: 20.h,
                ),
                Bottun(
                  txt: 'Add Coupon',
                  background: orangeColor,
                  onpressed: () {},
                  width: 117.w,
                  height: 40.h,
                  padding: EdgeInsets.only(right: 20.w, left: 229),
                ),
                SizedBox(
                  height: 32.h,
                ),
                const BailCard(),
                SizedBox(
                  height: 142.h,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0.h,
            right: 0.w,
            left: 0.w,
            child: CardBottomTotal(
              title: 'Confirm order',
              ontap: () {
                Get.to(() => DonePage());
              },
            ),
          ),
        ],
      ),
    );
  }
}
