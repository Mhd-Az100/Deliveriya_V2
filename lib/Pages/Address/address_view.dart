import 'dart:developer';

import 'package:dilivirya/Pages/Address/components/dialog_addaddress.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Address/address_view_model.dart';
import 'package:dilivirya/Pages/Address/components/address_details.dart';
import 'package:dilivirya/helper/Shimmer_loading.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyAddress extends StatelessWidget {
  var controller = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    controller.getdataAddress();
    return Scaffold(
        backgroundColor: background2,
        appBar: AppBar(
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            color: Colors.transparent,
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: background2,
          elevation: 0,
          bottom: PreferredSize(
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        color: Colors.black,
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      flex: 8,
                      child: Text(
                        'My Address',
                        style: text18600txtcolor,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          onTap: () {
                            dialogAddAddress();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SmallButton(
                              w: 40.w,
                              h: 40.h,
                              icon: const Icon(
                                Icons.add,
                                color: purbleColor,
                              ),
                              color: light2purbleColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(15.h)),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(bottom: 20.h, top: 10.h, left: 20.w, right: 20.w),
          child: GetBuilder<AddressController>(
            builder: (c) {
              return controller.isEmptyaddress.value
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: c.responseAddress.length,
                      itemBuilder: (context, index) => AddressDetails(
                        responseAddress: c.responseAddress[index],
                      ),
                    )
                  : ShimmerWidget.addresscard();
            },
          ),
        ));
  }
}
