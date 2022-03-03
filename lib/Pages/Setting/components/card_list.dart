import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardListProfile extends StatelessWidget {
  CardListProfile(
      {Key? key,
      required this.icon,
      this.ontap,
      required this.title,
      required this.color})
      : super(key: key);
  String? title;
  Widget? icon;
  Color? color;
  void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
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
          children: [
            Text(
              title!,
              style: text16500txtcolor,
            ),
            SmallButton(
              w: 40.w,
              h: 40.h,
              color: color,
              icon: icon,
            ),
          ],
        ),
      ),
    );
  }
}
