import 'package:dilivirya/Pages/Search/search_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Categorylist extends StatelessWidget {
  int? index;
  Categorylist({
    this.index,
    Key? key,
  }) : super(key: key);
  var controller = Get.find<SerchController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          controller.indexCategory.value = index!;
        },
        child: Obx(() => Column(
              children: [
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 400),
                  style: controller.indexCategory.value == index!
                      ? text14700purble
                      : text14400lightgrey,
                  child: Text(
                    'Category',
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  width: 66.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: controller.indexCategory.value == index!
                        ? purbleColor
                        : Colors.transparent,
                  ),
                )
              ],
            )));
  }
}
