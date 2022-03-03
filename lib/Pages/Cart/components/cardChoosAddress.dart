import 'package:dilivirya/Pages/Cart/cart_view_model.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardChoosAddress extends StatelessWidget {
  CardChoosAddress({Key? key, this.index}) : super(key: key);
  var controller = Get.find<CartController>();
  int? index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: Colors.transparent,
        onTap: () {
          controller.Choose.value = index!;
        },
        child: Obx(() {
          return Stack(children: [
            Container(
              padding: EdgeInsets.only(
                left: 12.w,
              ),
              width: 300.w,
              height: 75.h,
              decoration: BoxDecoration(
                color:
                    //controller.Choose.value == index!
                    //  ? orangebuttonColor
                    //:
                    Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      SmallButton(
                        w: 40.w,
                        h: 40.h,
                        icon: SvgPicture.asset('assets/icons/homeaddress.svg'),
                        color: light2purbleColor,
                      ),
                      SmallButton(
                        w: 40.w,
                        h: 40.h,
                        icon: SvgPicture.asset('assets/icons/homeaddress2.svg'),
                        color: light2purbleColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home',
                        style: text14600txtcolor,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        width: 170.w,
                        height: 32.h,
                        child: Text(
                          'mashroo Dummar, Island 16',
                          style: text12400desc,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            controller.Choose.value == index!
                ? Container(
                    padding: EdgeInsets.only(
                      left: 12.w,
                    ),
                    width: 300.w,
                    height: 75.h,
                    decoration: BoxDecoration(
                      color: orangebuttonColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(
                      left: 12.w,
                    ),
                    width: 300.w,
                    height: 75.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  )
          ]);
        }));
  }
}
