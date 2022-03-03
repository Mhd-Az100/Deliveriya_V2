import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/address/add_address_view.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddressDetailsCart extends StatelessWidget {
  AddressDetailsCart({
    Key? key,
    this.isEmpty,
  }) : super(key: key);

  bool? isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return isEmpty!
        ? Container(
            height: 252.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                            style: text14600purble,
                          ),
                        ],
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.to(AddAddress());
                        },
                        child: SvgPicture.asset(
                          'assets/icons/edit.svg',
                          color: Colors.amber,
                        ),
                      ),
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
                          'mashroo Dummar, Island 16 ',
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
                          'mashroo Dummar, Island 16 mashroo Dummar, Island 16 mashroo Dummar, Island 16 ',
                          style: text14400descgrey,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Container(
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 8.h, bottom: 8.h, right: 25.w),
                    child: SmallButton(
                      w: 40.w,
                      h: 40.h,
                      icon: Icon(
                        Icons.add,
                        color: addbuttonColor,
                      ),
                      color: addbuttonColorbackground,
                    ),
                  ),
                  Text(
                    'Add new address',
                    style: text14400descgrey,
                  ),
                ],
              ),
            ),
          );
  }
}
