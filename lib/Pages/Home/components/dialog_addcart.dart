import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Cart/components/card_cartctrllarg.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DialogAddCart extends StatelessWidget {
  const DialogAddCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // margin: const EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tuna salad',
                style: text20500txtcolor,
              ),
              Text(
                'USD 250000',
                style: text20700orange,
              ),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            'Book any table for more than  4 guests and have a discount',
            style: text12400body,
          ),
          SizedBox(
            height: 20.h,
          ),
          CardCartctrllarg(),
          SizedBox(
            height: 12.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: purbleColor,
              borderRadius: BorderRadius.all(Radius.circular(13.r)),
            ),
            width: 281.w,
            height: 50.h,
            child: Center(
              child: Text.rich(TextSpan(
                  text: 'Total Price :',
                  style: text14600lightgrey,
                  children: <InlineSpan>[
                    TextSpan(
                      text: '250\$',
                      style: text18600white,
                    ),
                  ])),
            ),
          ),
          SizedBox(
            height: 46.h,
          ),
          Bottun(
            onpressed: () {},
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            txt: 'Add to cart',
            styletxt: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
                color: Colors.white),
            background: orangeColor,
            height: 49.h,
            width: 305.w,
            borderradius: BorderRadius.circular(13.r),
          )
        ],
      ),
    );
  }
}
