import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HeaderOrder extends StatelessWidget {
  const HeaderOrder({
    Key? key,
    required this.extend,
  }) : super(key: key);

  final bool? extend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      child: Row(
        children: [
          SmallButton(
            h: !extend! ? 120.h : 40.h,
            color: purblebuttonColor,
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: purbleColor,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Satya Nilayam',
                style: text14600txtcolor,
              ),
              SizedBox(
                height: 8.h,
              ),
              Visibility(
                visible: !extend!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order number : #1216100 ',
                      style: text12400body,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'mashroo Dummar, Island 16 ',
                      style: text12400body,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      '+963933167583',
                      style: text12400body,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          '11/12/2022',
                          style: text12400body,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          '11:00 am',
                          style: text12400body,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      'Accepted',
                      style: text12700orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
