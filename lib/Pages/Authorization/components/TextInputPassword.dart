import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputPassword extends StatelessWidget {
  TextInputPassword({
    Key? key,
    required this.controller,
    required this.lebel,
    this.icon,
    this.prefixtxt,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.suffixPressed,
    this.ispassword,
    this.prifix,
    this.hint,
    this.onChanged,
    this.txttype,
  });

  TextEditingController controller;
  String? lebel;
  String? prefixtxt;
  Widget? icon;
  Widget? prifix;
  String? hint;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  IconData? suffixIcon;
  bool? ispassword = false;
  VoidCallback? suffixPressed;
  Function(String)? onChanged;
  TextInputType? txttype;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        keyboardType: txttype,
        decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          )),
          prefix: prifix,
          fillColor: backgroundinputcolor,
          filled: true,
          prefixIcon: icon,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 20.0.w),
          prefixText: prefixtxt,
          label: Text(lebel!),
          border: InputBorder.none,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(suffixIcon),
                  color: Colors.black,
                  onPressed: suffixPressed)
              : null,
        ),
        controller: controller,
        obscureText: ispassword ?? false,
      ),
    );
  }
}
