import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallButton extends StatelessWidget {
  SmallButton({Key? key, this.icon, this.color, this.w, this.h})
      : super(key: key);
  Color? color;
  Widget? icon;
  double? w;
  double? h;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w ?? 33.w,
      height: h ?? 34.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Center(child: icon),
    );
  }
}
