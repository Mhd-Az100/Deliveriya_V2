import 'package:dilivirya/Pages/Maps/googlemap_view.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardAddress extends StatelessWidget {
  String? type;
  Widget? button;
  CardAddress({this.button, this.type});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: Colors.transparent,
        onTap: () {
          Get.off(() => MapView());
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 12.w,
          ),
          width: 300.w,
          height: 75.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              button!,
              SizedBox(
                width: 15.w,
              ),
              Center(
                child: Text(
                  type!,
                  style: text14600txtcolor,
                ),
              ),
            ],
          ),
        ));
  }
}
