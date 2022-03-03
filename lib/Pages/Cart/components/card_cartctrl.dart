import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardCartctrl extends StatelessWidget {
  const CardCartctrl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cou = 0.obs;
    return Container(
      decoration: BoxDecoration(
        color: lightpurbleColor,
        borderRadius: BorderRadius.all(Radius.circular(13.r)),
      ),
      width: 128.w,
      height: 34.h,
      child: Row(
        children: [
          Flexible(
            child: InkWell(
              highlightColor: Colors.transparent,
              onTap: () {
                if (cou != 0) cou--;
              },
              child: Container(
                width: 26.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: purbleColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.r),
                      topLeft: Radius.circular(5.r)),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/minus.svg',
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 76.w,
            height: 34.h,
            decoration: BoxDecoration(
              color: lightpurbleColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.r),
                  topLeft: Radius.circular(5.r)),
            ),
            child: Obx(
              () => Center(
                child: Text.rich(TextSpan(
                    text: '${cou.value} ',
                    style: text12400white,
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'kg',
                        style: text12600white,
                      )
                    ])),
              ),
            ),
          ),
          InkWell(
            highlightColor: Colors.transparent,
            onTap: () {
              cou++;
            },
            child: Container(
              width: 26.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: purbleColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5.r),
                    topRight: Radius.circular(5.r)),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/plus.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
