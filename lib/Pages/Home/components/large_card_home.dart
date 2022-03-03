// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:dilivirya/Pages/Favorite/favorite_view_model.dart';
import 'package:dilivirya/Pages/Home/components/card_story.dart';
import 'package:dilivirya/Pages/Home/components/dialog_addcart.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/ItemDetails/itemdetailsCard_view.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LargeCardHome extends StatelessWidget {
  var item;
  String type;
  LargeCardHome({
    Key? key,
    this.item,
    required this.type,
  }) : super(key: key);
  var controller = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    var isFavorite = false.obs;
    isFavorite.value = item.favorites.isNotEmpty;
    var idfavorite;
    if (isFavorite.value) {
      idfavorite = item.favorites[0]['id'];
    }

    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        Get.to(() => ItemDetailsCard(
              item: item,
              type: type,
              islode: 'null',
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        height: 130.h,
        width: 335.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: -16,
              blurRadius: 27,
              offset: const Offset(0, 13), // changes position of shadow
            ),
          ],
          color: background,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 130.h,
                  width: 114.w,
                  decoration: BoxDecoration(
                    color: orangebuttonColor,
                    image: DecorationImage(
                      image: NetworkImage(item.attachments[0].url),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      topLeft: Radius.circular(15.r),
                    ),
                  ),
                ),
                if (item.offerItems.isNotEmpty)
                  for (int i = 0; i < item.offerItems.length; i++)
                    if (item.offerItems[i].offer != null)
                      Positioned(
                        left: -1.w,
                        top: 9.h,
                        child: SvgPicture.asset(
                          'assets/icons/offer.svg',
                          color: orangeColor,
                        ),
                      ),
                if (item.offerItems.isNotEmpty)
                  for (int i = 0; i < item.offerItems.length; i++)
                    if (item.offerItems[i].offer != null)
                      Positioned(
                          left: 9.w,
                          top: 14.h,
                          child: Text(
                            '${item.offerItems[i].offer.discountRate}% off',
                            style: text14600white,
                          )),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 15.w, top: 16.h, bottom: 15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                    width: 180.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: text12800txtcol,
                        ),
                        Text(
                          'USD ${item.measureUnits[0].price}',
                          style: text12700orange,
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    // flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      width: 183.w,
                      height: 38.h,
                      padding: EdgeInsets.only(top: 6.h),
                      child: Text(
                        item.description,
                        style: text12400body,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bottun(
                        onpressed: () {
                          Get.defaultDialog(
                              backgroundColor: Colors.white,
                              titleStyle: TextStyle(color: Colors.white),
                              middleTextStyle: TextStyle(color: Colors.white),
                              radius: 15.r,
                              content: DialogAddCart());
                        },
                        padding: EdgeInsets.only(right: 9.w),
                        txt: 'Add to cart',
                        styletxt: text14600white,
                        background: orangeColor,
                        height: 33.h,
                        width: 151.w,
                        borderradius: BorderRadius.circular(5.r),
                      ),
                      Obx(() {
                        return InkWell(
                          highlightColor: Colors.transparent,
                          onTap: () {
                            if (isFavorite.value) {
                              isFavorite.value = false;
                              controller.deletefavorite(idfavorite);
                            } else {
                              controller.addfavorite(item.id, type);
                              idfavorite =
                                  controller.adfavorite!.result!['result'];
                              isFavorite.value = true;
                            }
                          },
                          child: SmallButton(
                            color: orangebuttonColor,
                            icon: isFavorite.value
                                ? SvgPicture.asset(
                                    'assets/icons/fav.svg',
                                    color: Colors.white,
                                  )
                                : SvgPicture.asset('assets/icons/fav.svg'),
                          ),
                        );
                      })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
