import 'dart:developer';

import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Favorite/favorite_view_model.dart';
import 'package:dilivirya/Pages/Home/components/dialog_addcart.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/ItemDetails/itemdetailsCard_view.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SmallCard extends StatelessWidget {
  var item;
  String type;
  SmallCard({
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
      child: SizedBox(
        width: 199.w,
        height: 269.h,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 144.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(item.attachments[0].url),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
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
              padding: EdgeInsets.only(
                  top: 13.h, bottom: 11.h, right: 11.w, left: 11.w),
              height: 125.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Row(
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
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    item.description,
                    style: text12400body,
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      }),
                      Bottun(
                        onpressed: () {
                          Get.defaultDialog(
                              backgroundColor: Colors.white,
                              titleStyle: TextStyle(color: Colors.white),
                              middleTextStyle: TextStyle(color: Colors.white),
                              radius: 15.r,
                              content: DialogAddCart());
                        },
                        padding: EdgeInsets.only(left: 7.w),
                        txt: 'Add to cart',
                        styletxt: text14600white,
                        background: orangeColor,
                        height: 33.h,
                        width: 140.w,
                        borderradius: BorderRadius.circular(5.r),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
