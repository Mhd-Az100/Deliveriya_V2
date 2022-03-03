import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Search/search_view.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    this.enable,
    Key? key,
  }) : super(key: key);
  bool? enable;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        Get.to(() => SearchView());
      },
      child: Container(
          // margin: EdgeInsets.only(bottom: 16.h),
          height: 45.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            // boxShadow: const [
            //   BoxShadow(
            //     blurRadius: 20,
            //     color: Color(0x11000014),
            //   )
            // ],
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 18.w),
                child: SmallButton(
                  color: Colors.transparent,
                  icon: SvgPicture.asset('assets/icons/search.svg'),
                ),
              ),
              Expanded(
                child: TextFormField(
                  enabled: enable ?? false,
                  decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 13.sp, color: Color(0xffA3A3A3)),
                      hintText: 'Search'),
                ),
              ),
            ],
          )),
    );
  }
}
