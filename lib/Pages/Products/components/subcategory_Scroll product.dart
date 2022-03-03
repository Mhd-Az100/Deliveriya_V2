import 'package:dilivirya/Pages/Search/search_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubCategorylist extends StatelessWidget {
  var controller = Get.find<SerchController>();

  int? index;
  SubCategorylist({
    this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        controller.indexSubCategory.value = index!;
      },
      child: Obx(
        () => Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: 28.h,
              decoration: BoxDecoration(
                color: controller.indexSubCategory.value == index!
                    ? light2purbleColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 400),
                style: controller.indexSubCategory.value == index!
                    ? text14600purble
                    : text14600lightgrey,
                child: Text(
                  'Sub Category',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
