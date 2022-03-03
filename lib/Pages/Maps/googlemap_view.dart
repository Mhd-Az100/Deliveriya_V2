import 'package:bot_toast/bot_toast.dart';
import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Maps/components/googlemap.dart';
import 'package:dilivirya/Pages/Maps/googlemap_view_model.dart';
import 'package:dilivirya/Pages/address/add_address_view.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  var controller = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purbleColor,
        elevation: 0,
        title: Text(
          'Enter you Address',
          style: text20600white,
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      backgroundColor: background2,
      body: Stack(
        children: [
          GoogleMapWidget(),
          Padding(
            padding: EdgeInsets.only(bottom: 60.h),
            child: Center(
                child: Obx(() => TweenAnimationBuilder<double>(
                      duration: const Duration(
                        milliseconds: (400),
                      ),
                      tween: Tween<double>(
                          begin: 50, end: controller.sizeMarker.value),
                      builder: (context, value, child) => SvgPicture.asset(
                        'assets/icons/marker.svg',
                        width: value,
                      ),
                    ))),
          ),
          Positioned(
            bottom: 30.h,
            left: 70.w,
            right: 70.w,
            child: Bottun(
                // padding: EdgeInsets.symmetric(horizontal: 70.w),
                txt: 'Save',
                background: orangeColor,
                onpressed: () {
                  controller.positionMarker.value.latitude == 0
                      ? BotToast.showText(
                          text: 'Slide to select area', align: Alignment.center)
                      : Get.to(() => AddAddress());
                }),
          ),
        ],
      ),
    );
  }
}
