import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Cart/cart_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardBottomTotal extends StatelessWidget {
  CardBottomTotal({
    Key? key,
    this.ontap,
    required this.title,
  }) : super(key: key);
  String? title;
  var controller = Get.find<CartController>();
  void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 142.h,
      padding: EdgeInsets.symmetric(vertical: 21.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 27,
            offset: const Offset(0, -2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.r), topLeft: Radius.circular(10.r)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price :',
                style: text14600lightgrey,
              ),
              SizedBox(
                width: 28.w,
              ),
              Text(
                'USd 150213',
                style: text14600orange,
              ),
            ],
          ),
          SizedBox(
            height: 18.h,
          ),
          Bottun(txt: title, background: orangeColor, onpressed: ontap

              ///password
              // Get.defaultDialog(
              //     title: '',
              //     backgroundColor: background,
              //     content: SizedBox(
              //       height: 235.h,
              //       width: double.infinity,
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(
              //                 left: 10.w, right: 10.w, bottom: 10.h),
              //             child: Text(
              //               'Confirm you password !',
              //               style: text24red600,
              //             ),
              //           ),
              //           Padding(
              //             padding: EdgeInsets.only(left: 10.w, right: 10.w),
              //             child: Text(
              //               'If you want to edit your phone number you must to confirm your password first',
              //               style: text16pur400,
              //             ),
              //           ),
              //           Padding(
              //             padding: EdgeInsets.only(
              //                 top: 20.h,
              //                 left: 10.w,
              //                 right: 10.w,
              //                 bottom: 40.h),
              //             child: ClipRRect(
              //               borderRadius:
              //                   BorderRadius.all(Radius.circular(10.r)),
              //               child: TextInputPassword(
              //                 txttype: TextInputType.visiblePassword,
              //                 validator: validatePass,
              //                 controller: controller.passController,
              //                 lebel: 'password'.tr,
              //                 prefixtxt: '',
              //                 ispassword: controller.ispass1.value,
              //                 suffixIcon: controller.ispass1.value
              //                     ? Icons.visibility_off
              //                     : Icons.visibility,
              //                 onChanged: (v) {
              //                   controller.pass.value = v;
              //                 },
              //                 suffixPressed: () {
              //                   controller.ispass1.value =
              //                       !controller.ispass1.value;
              //                 },
              //               ),
              //             ),
              //           ),
              //           Center(
              //             child: Bottun(
              //               width: 150.w,
              //               onpressed: () {
              //                 // if (checkcolorbutton()) {}
              //               },
              //               txt: 'Confirm',
              //               background: controller.colorbutton.value,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ));

              ///enter addres

              )
        ],
      ),
    );
  }

  // bool checkcolorbutton() {
  //   true
  //       ? controller.colorbutton.value = orangeColor
  //       : controller.colorbutton.value = orangeColor.withOpacity(0.3);
  //   return true ? true : false;
  // }
  String? validatePass(String? value) {
    if (value!.length == 0)
      return 'Please enter Password';
    else if (value.length < 8 || value.length > 32) {
      return 'Password value range 8-32 char';
    } else
      return null;
  }
}
