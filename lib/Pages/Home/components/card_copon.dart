import 'package:dilivirya/Pages/Offer/copon_view.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgprovider;
import 'package:get/get.dart';

class CardCopon extends StatelessWidget {
  CardCopon({Key? key, this.width, required this.primary, this.itemcopon})
      : super(key: key);
  double? width;
  bool primary;
  var itemcopon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        Get.to(() => CoponDetails(
              copon: itemcopon,
              islode: false,
            ));
      },
      child: Container(
        padding:
            EdgeInsets.only(left: 17.w, right: 17.w, top: 10.h, bottom: 13.h),
        height: 123.h,
        width: width ?? 333.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!.withOpacity(0.4),
              spreadRadius: 0.2,
              blurRadius: 10,
              offset: const Offset(0, 12), // changes position of shadow
            ),
          ],
          image: const DecorationImage(
            image: svgprovider.Svg('assets/images/coupon.svg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 107.h,
                width: 129.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    topLeft: Radius.circular(15.r),
                  ),
                ),
                child: Image.network(
                  urlimage + itemcopon.avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${itemcopon.discountRate} %',
                        style: text16500txtcolor,
                      ),
                      Text(
                        itemcopon.name,
                        style: text16500txtcolor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Flexible(
                    // flex: 1,
                    fit: FlexFit.loose,
                    child: Text(
                      itemcopon.description,
                      style: text12400desc,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Text(
                        'Buy Now!',
                        style: text18600orange,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
