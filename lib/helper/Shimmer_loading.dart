import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shapeBorder;
  EdgeInsetsGeometry? margin;
  ShimmerWidget.card({
    this.width,
    this.height,
    this.shapeBorder = const RoundedRectangleBorder(),
    this.margin,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: shapeBorder,
        ),
      ),
    );
  }

  static Widget largcard() => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) => ShimmerWidget.card(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          height: 130.h,
          width: 335.w,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      );
  static Widget smallcard() => ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) => ShimmerWidget.card(
          width: 199.w,
          height: 269.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      );
  static Widget couponcard() => ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) => ShimmerWidget.card(
          width: 333.w,
          height: 123.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      );
  static Widget addresscard() => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) => ShimmerWidget.card(
          height: 262.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      );
}
