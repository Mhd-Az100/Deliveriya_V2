import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Cart/cart_view.dart';
import 'package:dilivirya/Pages/Cart/components/card_cartctrllarg.dart';
import 'package:dilivirya/Pages/Favorite/favorite_view_model.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Offer/offer_view_model.dart';
import 'package:dilivirya/Pages/Products/products_view_model.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemDetailsOffer extends StatelessWidget {
  var item;
  var type;
  String islode;
  var iditem;
  ItemDetailsOffer(
      {Key? key,
      this.item,
      required this.islode,
      this.iditem,
      required this.type})
      : super(key: key);
  int currentindx = 0;
  var controller = Get.find<FavoriteController>();
  var controlleroffer = Get.find<CouponAndOfferController>();
  var controllerproducts = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    if (islode == 'offer') {
      controlleroffer.getdataofferid(iditem);

      return Obx(() {
        if (controlleroffer.isEmptyofferid.value) {
          item = controlleroffer.offerid.value;
          int co = item.min;
          RxInt cou = co.obs;
          var isFavorite = false.obs;
          isFavorite.value = item.favorites.isNotEmpty;

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(90.h), // here the desired height
              child: AppBar(
                leading: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.transparent,
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                backgroundColor: purbleColor,
                elevation: 0,
                bottom: PreferredSize(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            color: Colors.white,
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                          Text(
                            item.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Center(
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Get.to(() => Cart());
                              },
                              child: Stack(
                                children: [
                                  SmallButton(
                                    h: 40.h,
                                    w: 40.h,
                                    icon: SvgPicture.asset(
                                      'assets/icons/cart.svg',
                                      color: Colors.white,
                                    ),
                                    color: lightpurbleColor,
                                  ),
                                  Positioned(
                                    top: 3.h,
                                    right: 4.w,
                                    child: SvgPicture.asset(
                                        'assets/icons/circle.svg'),
                                  ),
                                  Positioned(
                                      top: 2.h,
                                      right: 6.w,
                                      child: Text('2',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp)))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    preferredSize: Size.fromHeight(0.0)),
              ),
            ),
            body: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 215.h,
                      width: double.infinity,
                      child: Image.network(urlimage + item.avatar,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 20.h,
                      left: 150.w,
                      right: 150.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 31.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'USD ${item.price}',
                            style: text20700orange,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 26.w,
                              ),
                              Obx(() {
                                return InkWell(
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    if (isFavorite.value) {
                                      isFavorite.value = false;
                                      controller.deletefavorite(
                                          item.favorites[0]['id']);
                                    } else {
                                      controller.addfavorite(item.id, type);

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
                                        : SvgPicture.asset(
                                            'assets/icons/fav.svg'),
                                  ),
                                );
                              })
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        item.description,
                        style: text16400descgrey,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
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
                                  if (cou != item.min) cou--;
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
                                            text: item.mager,
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
                                  if (cou != item.max) cou++;
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
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: purbleColor,
                          borderRadius: BorderRadius.all(Radius.circular(13.r)),
                        ),
                        width: 281.w,
                        height: 50.h,
                        child: Obx(() {
                          return Center(
                            child: Text.rich(TextSpan(
                                text: 'Total Price :',
                                style: text14600lightgrey,
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: '${item.price * cou.value}\$',
                                    style: text14800orange,
                                  ),
                                ])),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Bottun(
                        onpressed: () {},
                        padding: EdgeInsets.symmetric(horizontal: 0.w),
                        txt: 'Add to cart',
                        styletxt: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            color: Colors.white),
                        background: orangeColor,
                        height: 49.h,
                        width: 305.w,
                        borderradius: BorderRadius.circular(13.r),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(90.h), // here the desired height
                child: AppBar(
                  leading: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    color: Colors.transparent,
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  backgroundColor: purbleColor,
                  elevation: 0,
                  bottom: PreferredSize(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, bottom: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              color: Colors.white,
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                            Center(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Get.to(() => Cart());
                                },
                                child: Stack(
                                  children: [
                                    SmallButton(
                                      h: 40.h,
                                      w: 40.h,
                                      icon: SvgPicture.asset(
                                        'assets/icons/cart.svg',
                                        color: Colors.white,
                                      ),
                                      color: lightpurbleColor,
                                    ),
                                    Positioned(
                                      top: 3.h,
                                      right: 4.w,
                                      child: SvgPicture.asset(
                                          'assets/icons/circle.svg'),
                                    ),
                                    Positioned(
                                        top: 2.h,
                                        right: 6.w,
                                        child: Text('2',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp)))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      preferredSize: Size.fromHeight(0.0)),
                ),
              ),
              body: const Center(
                child: CircularProgressIndicator(
                  color: purbleColor,
                ),
              ));
        }
      });
    } else if (islode == 'product') {
      controllerproducts.getdataproductid(iditem);

      return Obx(() {
        if (controllerproducts.isEmptyproductid.value) {
          item = controllerproducts.productid.value;
          int co = item.measureUnits[0].min;
          RxInt cou = co.obs;
          var isFavorite = false.obs;
          isFavorite.value = item.favorites.isNotEmpty;

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(90.h), // here the desired height
              child: AppBar(
                leading: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.transparent,
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                backgroundColor: purbleColor,
                elevation: 0,
                bottom: PreferredSize(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            color: Colors.white,
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                          Text(
                            item.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Center(
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Get.to(() => Cart());
                              },
                              child: Stack(
                                children: [
                                  SmallButton(
                                    h: 40.h,
                                    w: 40.h,
                                    icon: SvgPicture.asset(
                                      'assets/icons/cart.svg',
                                      color: Colors.white,
                                    ),
                                    color: lightpurbleColor,
                                  ),
                                  Positioned(
                                    top: 3.h,
                                    right: 4.w,
                                    child: SvgPicture.asset(
                                        'assets/icons/circle.svg'),
                                  ),
                                  Positioned(
                                      top: 2.h,
                                      right: 6.w,
                                      child: Text('2',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp)))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    preferredSize: Size.fromHeight(0.0)),
              ),
            ),
            body: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 215.h,
                      width: double.infinity,
                      child: Image.network(urlimage + item.attachments[0].url,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 20.h,
                      left: 150.w,
                      right: 150.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 31.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'USD ${item.measureUnits[0].price}',
                            style: text20700orange,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 26.w,
                              ),
                              Obx(() {
                                return InkWell(
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    if (isFavorite.value) {
                                      isFavorite.value = false;
                                      controller.deletefavorite(
                                          item.favorites[0]['id']);
                                    } else {
                                      controller.addfavorite(item.id, type);

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
                                        : SvgPicture.asset(
                                            'assets/icons/fav.svg'),
                                  ),
                                );
                              })
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        item.description,
                        style: text16400descgrey,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
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
                                  if (cou != item.measureUnits[0].min) cou--;
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
                                            text: item.measureUnits[0].name,
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
                                  if (cou != item.measureUnits[0].max) cou++;
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
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: purbleColor,
                          borderRadius: BorderRadius.all(Radius.circular(13.r)),
                        ),
                        width: 281.w,
                        height: 50.h,
                        child: Obx(() {
                          return Center(
                            child: Text.rich(TextSpan(
                                text: 'Total Price :',
                                style: text14600lightgrey,
                                children: <InlineSpan>[
                                  TextSpan(
                                    text:
                                        '${item.measureUnits[0].price * cou.value}\$',
                                    style: text14800orange,
                                  ),
                                ])),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Bottun(
                        onpressed: () {},
                        padding: EdgeInsets.symmetric(horizontal: 0.w),
                        txt: 'Add to cart',
                        styletxt: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            color: Colors.white),
                        background: orangeColor,
                        height: 49.h,
                        width: 305.w,
                        borderradius: BorderRadius.circular(13.r),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(90.h), // here the desired height
                child: AppBar(
                  leading: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    color: Colors.transparent,
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  backgroundColor: purbleColor,
                  elevation: 0,
                  bottom: PreferredSize(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, bottom: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              color: Colors.white,
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                            Center(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Get.to(() => Cart());
                                },
                                child: Stack(
                                  children: [
                                    SmallButton(
                                      h: 40.h,
                                      w: 40.h,
                                      icon: SvgPicture.asset(
                                        'assets/icons/cart.svg',
                                        color: Colors.white,
                                      ),
                                      color: lightpurbleColor,
                                    ),
                                    Positioned(
                                      top: 3.h,
                                      right: 4.w,
                                      child: SvgPicture.asset(
                                          'assets/icons/circle.svg'),
                                    ),
                                    Positioned(
                                        top: 2.h,
                                        right: 6.w,
                                        child: Text('2',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp)))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      preferredSize: Size.fromHeight(0.0)),
                ),
              ),
              body: const Center(
                child: CircularProgressIndicator(
                  color: purbleColor,
                ),
              ));
        }
      });
    } else {
      int co = item.min;
      RxInt cou = co.obs;
      var isFavorite = false.obs;
      isFavorite.value = item.favorites.isNotEmpty;
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.h), // here the desired height
          child: AppBar(
            leading: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: Colors.transparent,
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
            backgroundColor: purbleColor,
            elevation: 0,
            bottom: PreferredSize(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        color: Colors.white,
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Text(
                        item.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Center(
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.to(() => Cart());
                          },
                          child: Stack(
                            children: [
                              SmallButton(
                                h: 40.h,
                                w: 40.h,
                                icon: SvgPicture.asset(
                                  'assets/icons/cart.svg',
                                  color: Colors.white,
                                ),
                                color: lightpurbleColor,
                              ),
                              Positioned(
                                top: 3.h,
                                right: 4.w,
                                child:
                                    SvgPicture.asset('assets/icons/circle.svg'),
                              ),
                              Positioned(
                                  top: 2.h,
                                  right: 6.w,
                                  child: Text('2',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp)))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(0.0)),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 215.h,
                  width: double.infinity,
                  child:
                      Image.network(urlimage + item.avatar, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20.h,
                  left: 150.w,
                  right: 150.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => buildDot(index, context),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 31.h,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'USD ${item.price}',
                        style: text20700orange,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 26.w,
                          ),
                          Obx(() {
                            return InkWell(
                              highlightColor: Colors.transparent,
                              onTap: () {
                                if (isFavorite.value) {
                                  isFavorite.value = false;
                                  controller
                                      .deletefavorite(item.favorites[0]['id']);
                                } else {
                                  controller.addfavorite(item.id, type);

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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    item.description,
                    style: text16400descgrey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
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
                              if (cou != item.min) cou--;
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
                                        text: item.mager,
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
                              if (cou != item.max) cou++;
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
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: purbleColor,
                      borderRadius: BorderRadius.all(Radius.circular(13.r)),
                    ),
                    width: 281.w,
                    height: 50.h,
                    child: Obx(() {
                      return Center(
                        child: Text.rich(TextSpan(
                            text: 'Total Price :',
                            style: text14600lightgrey,
                            children: <InlineSpan>[
                              TextSpan(
                                text: '${item.price * cou.value}\$',
                                style: text14800orange,
                              ),
                            ])),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Bottun(
                    onpressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    txt: 'Add to cart',
                    styletxt: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        color: Colors.white),
                    background: orangeColor,
                    height: 49.h,
                    width: 305.w,
                    borderradius: BorderRadius.circular(13.r),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6.7.h,
      width: currentindx == index ? 25.w : 6.7.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index == currentindx && index == 1
            ? purbleColor
            : index == currentindx
                ? purbleColor
                : Colors.grey,
      ),
    );
  }
}
