import 'package:dilivirya/Pages/Address/add_address_view.dart';
import 'package:dilivirya/Pages/Address/components/dialog_delete.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:dilivirya/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddressDetails extends StatelessWidget {
  AddressDetails({
    Key? key,
    this.responseAddress,
  }) : super(key: key);

  bool? isEmpty = true;
  ResponseAddress? responseAddress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 262.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 20.h, bottom: 20.h, right: 5.w, left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SmallButton(
                      w: 40.w,
                      h: 40.h,
                      icon: SvgPicture.asset(
                        'assets/icons/home.svg',
                        color: purbleColor,
                      ),
                      color: purblebuttonColor,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'Home address',
                      style: text14600txtcolor,
                    ),
                  ],
                ),
                PopupMenuButton(
                  icon: SvgPicture.asset(
                    'assets/icons/three dots.svg',
                    color: textColor,
                  ),
                  elevation: 1,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Edit address", style: text16400txtcolor),
                      value: 1,
                      onTap: () {
                        Get.to(() => AddAddress());
                      },
                    ),
                    PopupMenuItem(
                      child: Text("Delete address ", style: text16400red),
                      value: 1,
                      onTap: () {
                        Future.delayed(const Duration(milliseconds: 100), () {
                          dialogDeletAddress(
                            responseAddress!.id!.toString(),
                          );
                        });
                      },
                    ),
                  ],
                ),

                // InkWell(
                //   highlightColor: Colors.transparent,
                //   onTap: () {
                // },
                //   child: SvgPicture.asset(
                //     'assets/icons/three dots.svg',
                //     color: textColor,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 17.h,
            ),
            Row(
              children: [
                Text(
                  '.  ',
                  style: text14400descgrey,
                ),
                Expanded(
                  child: Text(
                    'Mohamad alazmeh',
                    style: text14400descgrey,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 11.h,
            ),
            Row(
              children: [
                Text(
                  '.  ',
                  style: text14400descgrey,
                ),
                Expanded(
                  child: Text(
                    '+96394887184 ',
                    style: text14400descgrey,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 11.h,
            ),
            Row(
              children: [
                Text(
                  '.  ',
                  style: text14400descgrey,
                ),
                Expanded(
                  child: Text(
                    responseAddress!.street!,
                    style: text14400descgrey,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 11.h,
            ),
            Row(
              children: [
                Text(
                  '.  ',
                  style: text14400descgrey,
                ),
                Expanded(
                  child: Text(
                    responseAddress!.locationDescription!,
                    style: text14400descgrey,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
