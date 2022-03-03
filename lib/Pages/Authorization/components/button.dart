import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bottun extends StatelessWidget {
  Bottun(
      {Key? key,
      required this.txt,
      required this.background,
      required this.onpressed,
      this.width,
      this.height,
      this.borderradius,
      this.padding,
      this.styletxt})
      : super(key: key);
  String? txt;
  Color? background;
  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  TextStyle? styletxt;
  BorderRadiusGeometry? borderradius;
  void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13.r)),
        ),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 26.w),
        width: width ?? double.infinity,
        height: height ?? 49.h,
        child: TextButton(
          onPressed: onpressed,
          child: FittedBox(
            child: Text(
              txt!,
              style: styletxt ??
                  TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                      color: Colors.white),
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: borderradius ?? BorderRadius.circular(13.r),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(background!),
          ),
        ));
  }
}
