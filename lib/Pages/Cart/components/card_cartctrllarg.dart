import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardCartctrllarg extends StatelessWidget {
  const CardCartctrllarg({
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
      width: 281.w,
      height: 50.h,
      child: Row(
        children: [
          Expanded(
            // flex: 2,
            child: InkWell(
              highlightColor: Colors.transparent,
              onTap: () {
                if (cou != 0) cou--;
              },
              child: Container(
                width: 64.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: purbleColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(13.r),
                      topLeft: Radius.circular(13.r)),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/minus.svg',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: 153.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: lightpurbleColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(13.r),
                    topLeft: Radius.circular(13.r)),
              ),
              child: Obx(
                () => Center(
                  child: Text.rich(TextSpan(
                      text: '${cou.value} ',
                      style: text20400white,
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'kg',
                          style: text20600white,
                        )
                      ])),
                ),
              ),
            ),
          ),
          Expanded(
            //  flex: 2,
            child: InkWell(
              highlightColor: Colors.transparent,
              onTap: () {
                cou++;
              },
              child: Container(
                width: 64.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: purbleColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(13.r),
                      topRight: Radius.circular(13.r)),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/plus.svg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
