import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Offer/components/itemdetailsOffer_view.dart';
import 'package:dilivirya/Pages/Offer/copon_view.dart';
import 'package:dilivirya/Pages/Order%20History/order_history_view.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Cardnotification extends StatelessWidget {
  var item;
  Cardnotification({
    this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (item.type == 'orderHistory') {
          Get.to(OrderHistory());
        } else if (item.type == 'offer') {
          Get.to(ItemDetailsOffer(
            islode: 'offer',
            type: 'offer',
            iditem: item.itemId,
          ));
        } else if (item.type == 'product') {
          Get.to(ItemDetailsOffer(
            islode: 'product',
            type: 'product',
            iditem: item.itemId,
          ));
        } else if (item.type == 'coupon') {
          Get.to(CoponDetails(
            islode: true,
            idcopon: item.itemId,
          ));
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: 12.w, top: 14.h, bottom: 14.h),
        width: double.infinity,
        height: 80.h,
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
                SmallButton(
                  w: 40.w,
                  h: 40.h,
                  icon: SvgPicture.network(
                    urlimage + item.avatar,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: text12400red,
                    ),
                    Container(
                      width: 207.w,
                      child: Text(
                        item.description,
                        style: text12400desc,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
