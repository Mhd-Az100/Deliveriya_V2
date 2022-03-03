import 'package:dilivirya/Pages/Home/components/large_card_home.dart';
import 'package:dilivirya/Pages/Home/components/search_bar.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Search/components/category_Scroll.dart';
import 'package:dilivirya/Pages/Search/components/subcategory_Scroll.dart';
import 'package:dilivirya/Pages/Search/search_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'components/dialog_pricerange.dart';

class SearchView extends StatelessWidget {
  String q = '';
  var controller = Get.find<SerchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h), // here the desired height
        child: AppBar(
          backgroundColor: background2,
          elevation: 0,
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            color: Colors.transparent,
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          bottom: PreferredSize(
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 15.w, bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: SearchBar(
                        enable: true,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: PopupMenuButton(
                          iconSize: 40,
                          icon: SmallButton(
                            h: 50.h,
                            w: 60.w,
                            icon: SvgPicture.asset('assets/icons/sort.svg'),
                            color: orangebuttonColor,
                          ),
                          elevation: 1,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("Price range ",
                                  style: text16400txtcolor),
                              value: 1,
                              onTap: () {
                                dialogPriceRange();
                              },
                            ),
                            PopupMenuItem(
                              child: Text("salad ", style: text16400txtcolor),
                              value: 1,
                              onTap: () {},
                            ),
                            PopupMenuItem(
                              child: Text("meal", style: text16400txtcolor),
                              value: 1,
                              onTap: () {},
                            ),
                            PopupMenuItem(
                              child: Text("new item", style: text16400txtcolor),
                              value: 1,
                              onTap: () {},
                            ),
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
                    padding: EdgeInsets.only(left: 27.w),
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
