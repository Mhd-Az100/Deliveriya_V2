import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Navbar/navbar.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardAddPrud extends StatelessWidget {
  const CardAddPrud({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 19.w, right: 6.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: purbleColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Add more products',
            style: text14600white,
          ),
          InkWell(
            highlightColor: Colors.transparent,
            onTap: () {
              Get.offAll(() => Navbar(2, 2));
            },
            child: SmallButton(
              color: purblebutton2Color,
              icon:
                  SvgPicture.asset('assets/icons/plus.svg', color: purbleColor),
            ),
          ),
        ],
      ),
    );
  }
}
