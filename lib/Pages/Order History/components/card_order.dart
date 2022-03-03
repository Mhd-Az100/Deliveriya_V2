import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 6.w, right: 6.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
      width: double.infinity,
      height: 73.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ExpansionTile(
        collapsedBackgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFDADADA),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/Rectangle.png'),
                    fit: BoxFit.cover),
              ),
              width: 48.w,
              height: 48.h,
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohamad Alazmeh',
                  style: text16500txtcolor,
                ),
                FittedBox(
                  child: Text(
                    'Welcom, See our offers and Discount !',
                    style: text14400whitegrey,
                  ),
                )
              ],
            ),
          ],
        ),
        children: [
          Container(
            // padding: EdgeInsets.only(left: 6.w, right: 6.w),
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
            width: double.infinity,
            height: 73.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFDADADA),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/Rectangle.png'),
                        fit: BoxFit.cover),
                  ),
                  width: 48.w,
                  height: 48.h,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mohamad Alazmeh',
                      style: text16500txtcolor,
                    ),
                    FittedBox(
                      child: Text(
                        'Welcom, See our offers and Discount !',
                        style: text14400whitegrey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
