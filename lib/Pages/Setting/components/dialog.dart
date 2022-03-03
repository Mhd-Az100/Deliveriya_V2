import 'package:dilivirya/Pages/Authorization/components/TextInput.dart';
import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogConfirm extends StatelessWidget {
  const DialogConfirm({
    Key? key,
    required this.passController,
  }) : super(key: key);

  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Confirm you password!',
          style: text20500txtcolor,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'If you want to edit your phone number you must to confirm your password first!',
          style: text14400lightgrey,
        ),
        TextInput(
          controller: passController,
          lebel: 'password',
        ),
        Bottun(
          background: orangeColor,
          onpressed: () {},
          padding: EdgeInsets.symmetric(horizontal: 66.w),
          txt: 'Confirm',
        )
      ],
    );
  }
}
