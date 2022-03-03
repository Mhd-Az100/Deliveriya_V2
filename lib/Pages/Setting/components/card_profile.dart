import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../edit_profile_view.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        Get.to(() => Profile());
      },
      child: Container(
        padding: EdgeInsets.only(left: 20.w, right: 14.w),
        width: double.infinity,
        height: 68.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFDADADA),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/Rectangle.png'),
                        fit: BoxFit.cover),
                  ),
                  width: 48.w,
                  height: 48.h,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mohamad Alazmeh',
                      style: text16500txtcolor,
                    ),
                    Text(
                      '+9693146436546',
                      style: text14400whitegrey,
                    )
                  ],
                ),
              ],
            ),
            SmallButton(
              w: 40.w,
              h: 40.h,
              color: purblebuttonColor,
              icon: SvgPicture.asset('assets/icons/edit.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
