import 'package:dilivirya/Pages/Cart/cart_view.dart';
import 'package:dilivirya/Pages/Home/components/large_card_home.dart';
import 'package:dilivirya/Pages/Home/components/search_bar.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Search/components/category_Scroll.dart';
import 'package:dilivirya/Pages/Search/components/subcategory_Scroll.dart';
import 'package:dilivirya/Pages/Search/search_view.dart';
import 'package:dilivirya/Pages/Search/search_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductsView extends StatelessWidget {
  String q = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0.h), // here the desired height
        child: AppBar(
          backgroundColor: background2,
          elevation: 0,
          bottom: PreferredSize(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text(
                        'List Products',
                        style: text18600txtcolor,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.to(() => SearchView());
                        },
                        child: Stack(
                          children: [
                            SmallButton(
                              w: 40.w,
                              h: 40.h,
                              color: purblebuttonColor,
                              icon: SvgPicture.asset('assets/icons/search.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.to(() => Cart());
                        },
                        child: Stack(
                          children: [
                            SmallButton(
                              h: 40.h,
                              w: 40.w,
                              icon: SvgPicture.asset(
                                'assets/icons/cart.svg',
                                color: orangeColor,
                              ),
                              color: orangebuttonColor,
                            ),
                            Positioned(
                              top: 3.h,
                              right: 4.w,
                              child:
                                  SvgPicture.asset('assets/icons/circle.svg'),
                            ),
                            Positioned(
                                top: 3.h,
                                right: 7.w,
                                child: Text('2',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp)))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              preferredSize: const Size.fromHeight(0.0)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 27.w,
                    ),
                    child: Categorylist(
                      index: index,
                    ),
                  );
                }),
          ),
          Flexible(
            flex: 1,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 22.w),
                    child: SubCategorylist(
                      index: index,
                    ),
                  );
                }),
          ),
          Flexible(
            flex: 12,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: LargeCardHome(
                  type: 'product',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
