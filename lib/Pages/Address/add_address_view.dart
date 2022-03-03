// ignore_for_file: prefer_is_empty, curly_braces_in_flow_control_structures

import 'package:dilivirya/Pages/Address/address_view_model.dart';
import 'package:dilivirya/Pages/Authorization/components/TextInput.dart';
import 'package:dilivirya/Pages/Authorization/components/button.dart';
import 'package:dilivirya/Pages/Maps/googlemap_view_model.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as serviceinput;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  var currentindx = 0;
  var controller = Get.find<AddressController>();
  var ctrlmap = Get.find<MapController>();
  bool? edit = false;
  AddAddress({Key? key, this.edit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background2,
        elevation: 0,
        title: Text(
          'My AddAddress',
          style: text18600txtcolor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(
          () {
            checkcolorbutton();
            return Form(
              key: controller.formkey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Home',
                      style: text14400blaobc,
                    ),
                  ),
                  SizedBox(height: 11.h),
                  TextInput(
                    validator: validateText,
                    controller: controller.fullnameController.value,
                    lebel: 'Receiver full name ',
                    colorfill: Colors.white,
                    onChanged: (v) {
                      controller.fullname.value = v;
                    },
                  ),
                  SizedBox(height: 11.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: 64.w,
                          height: 58.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                          ),
                          child: controller.showCountryCode2(),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        flex: 3,
                        child: TextInput(
                          colorfill: Colors.white,
                          txttype: TextInputType.number,
                          inputFormatters: [
                            serviceinput.FilteringTextInputFormatter.digitsOnly,
                            serviceinput.LengthLimitingTextInputFormatter(13),
                          ],
                          controller: controller.phoneController.value,
                          validator: validatePhone,
                          lebel: 'Receiver number',
                          onChanged: (v) {
                            controller.phone.value = v;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 11.h),
                  TextInput(
                    controller: controller.cityController.value,
                    validator: validateText,
                    lebel: 'Your city',
                    colorfill: Colors.white,
                    onChanged: (v) {
                      controller.city.value = v;
                    },
                  ),
                  SizedBox(height: 11.h),
                  TextInput(
                    controller: controller.streetController.value,
                    validator: validateText,
                    lebel: 'Street address ',
                    colorfill: Colors.white,
                    onChanged: (v) {
                      controller.street.value = v;
                    },
                  ),
                  SizedBox(height: 11.h),
                  TextInput(
                    h: 75.h,
                    lines: 3,
                    controller: controller.detailesController.value,
                    validator: validateText,
                    lebel: 'More detailes ',
                    colorfill: Colors.white,
                    onChanged: (v) {
                      controller.detailes.value = v;
                    },
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Bottun(
                        width: 250,
                        padding: EdgeInsets.symmetric(horizontal: 0.w),
                        onpressed: () {
                          if (checkcolorbutton()) {
                            if (controller.formkey.currentState!.validate()) {
                              var map = {
                                'street':
                                    controller.streetController.value.text,
                                'locationDescription':
                                    controller.detailesController.value.text,
                                'type': 'house',
                                'lat': ctrlmap.positionMarker.value.latitude
                                    .toString(),
                                'lng': ctrlmap.positionMarker.value.longitude
                                    .toString(),
                                'townId': '1',
                                'phone': controller.phoneController.value.text,
                                'name':
                                    controller.fullnameController.value.text,
                              };
                              controller.postAddress(map);
                            }
                          }
                        },
                        txt: 'Save',
                        background: controller.colorbutton.value,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool checkcolorbutton() {
    controller.fullname.value.length != 0 &&
            controller.phone.value.length != 0 &&
            controller.city.value.length != 0 &&
            controller.detailes.value.length != 0 &&
            controller.street.value.length != 0
        ? controller.colorbutton.value = orangeColor
        : controller.colorbutton.value = orangeColor.withOpacity(0.3);
    return controller.fullname.value.length != 0 &&
            controller.phone.value.length != 0 &&
            controller.city.value.length != 0 &&
            controller.detailes.value.length != 0 &&
            controller.street.value.length != 0
        ? true
        : false;
  }

  String? validateText(String? value) {
    if (value!.length == 0)
      return 'enter text please';
    else
      return null;
  }

  String? validatePhone(String? value) {
    if (value!.length == 0 || value.length < 8)
      return 'not correct';
    else
      return null;
  }
}
