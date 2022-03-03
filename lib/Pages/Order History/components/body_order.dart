import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BodyOrder extends StatelessWidget {
  const BodyOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your City',
                  style: text12400desc,
                ),
                Text(
                  'Damascus',
                  style: text14400txtcolor,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Street address',
                  style: text12400desc,
                ),
                Text(
                  'mashroo Dummar, Island 16 ',
                  style: text14400txtcolor,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'More detailes',
                  style: text12400desc,
                ),
                Text(
                  'mashroo Dummar, Island 16 mashroo Dummar, Island 16 mashroo Dummar, Island 16 ',
                  style: text14400txtcolor,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Phone',
                  style: text12400desc,
                ),
                Text(
                  '+963933167583',
                  style: text14400txtcolor,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Date & Time',
                  style: text12400desc,
                ),
                Row(
                  children: [
                    Text(
                      '11/12/2022',
                      style: text14400txtcolor,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      '11:00 am',
                      style: text14400txtcolor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Status',
                  style: text12400desc,
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
          Container(
            height: 53.h,
            width: double.infinity,
            color: pinkColor,
            child: Center(
              child: Text(
                'Reject',
                style: text16500white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Detailes',
                  style: text12400red,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'mashroo Dummar, Island 16 mashroo Dummar, Island 16 mashroo Dummar, Island 16 ',
                  style: text14400lightgrey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Products',
                  style: text12400desc,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 150.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tuna salad',
                                      style: text12700txtcol,
                                    ),
                                    Text(
                                      '3',
                                      style: text12700txtcol,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'USD 2514522',
                                style: text12700txtcol,
                              ),
                            ],
                          );
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal :',
                              style: text12600txtcol,
                            ),
                            Text(
                              'USD 2514522',
                              style: text12700txtcol,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax :',
                              style: text12600txtcol,
                            ),
                            Text(
                              'USD 251',
                              style: text12700txtcol,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount :',
                              style: text14600orange,
                            ),
                            Text(
                              'USD 251',
                              style: text12700orange,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery charge :',
                              style: text14600orange,
                            ),
                            Text(
                              'USD 251',
                              style: text12700orange,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total price :',
                          style: text12800orange,
                        ),
                        Text(
                          'USD 251',
                          style: text12700orange,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 27.h,
                ),
                Container(
                  width: double.infinity,
                  height: 31.h,
                  color: orangeColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Download order as PDF',
                        style: text12800white,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      SvgPicture.asset('assets/icons/download.svg'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Bottun(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    txt: 'ReOrder',
                    background: orangeColor,
                    onpressed: () {}),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
