import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Setting/setting_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CardEdit extends StatelessWidget {
  CardEdit({
    Key? key,
  }) : super(key: key);
  var controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.postImg(ImageSource.gallery);
      },
      child: Container(
        padding: EdgeInsets.only(left: 20.w, right: 14.w),
        width: double.infinity,
        height: 85.h,
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
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFDADADA),
                    shape: BoxShape.circle,
                  ),
                  width: 48.w,
                  height: 48.h,
                  child: SvgPicture.asset(
                    'assets/icons/avatar.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  'Edit Profile Photo',
                  style: text16400txtcolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
