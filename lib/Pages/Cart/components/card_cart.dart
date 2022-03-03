import 'package:dilivirya/Pages/Cart/components/card_cartctrl.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCart extends StatelessWidget {
  const CardCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 9.w, right: 15.w),
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          const CardCartctrl(),
          SizedBox(
            width: 23.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tuna Salad',
                style: text14600txtcolor,
              ),
              SizedBox(
                width: 28.w,
              ),
              Text(
                'USd 150',
                style: text14800orange,
              )
            ],
          ),
        ],
      ),
    );
  }
}
