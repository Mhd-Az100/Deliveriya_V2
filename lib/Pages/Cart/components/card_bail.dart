import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BailCard extends StatelessWidget {
  const BailCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138.h,
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
                Text(
                  'Subtotal :',
                  style: text14600lightgrey,
                ),
                Text(
                  'USD 2514522',
                  style: text14400lightgrey,
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
                  style: text14600lightgrey,
                ),
                Text(
                  'USD 251',
                  style: text14400lightgrey,
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
                  style: text14600orange,
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
                  style: text14600lightgrey,
                ),
                Text(
                  'USD 251',
                  style: text14400lightgrey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
