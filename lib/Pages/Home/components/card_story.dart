import 'package:dilivirya/Pages/Home/components/statuses.dart';
import 'package:dilivirya/Pages/Home/view_model/statuses_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardStory extends StatelessWidget {
  var story = Get.find<StatusesController>();
  CardStory({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        Get.to(() => Statuses());
      },
      child: Container(
        padding: EdgeInsets.only(left: 17.w, right: 14.w),
        width: double.infinity,
        height: 75.h,
        decoration: BoxDecoration(
          color: light2purbleColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Stack(children: [
              Obx(() {
                return SizedBox(
                  child: story.viewStory.value
                      ? Image.asset('assets/images/Ellipse.png')
                      : Image.asset('assets/images/Ellipse2.png'),
                  width: 58.w,
                  height: 58.h,
                );
              }),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFDADADA),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Rectangle.png',
                        ),
                        fit: BoxFit.cover),
                  ),
                  width: 48.w,
                  height: 48.h,
                ),
              ),
            ]),
            SizedBox(
              width: 15.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Story',
                  style: text16700purble,
                ),
                FittedBox(
                    child: Text(
                  'Welcom, See our offers and Discount !',
                  style: text12400purb,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
