import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInput extends StatelessWidget {
  TextInput({
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
    this.txttype,
    this.lines,
    this.h,
    this.enabled,
    this.onChanged,
    this.colorfill,
  });

  TextEditingController controller;
  String? lebel;
  String? prefixtxt;
  Widget? icon;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  IconData? suffixIcon;
  bool? ispassword = false;
  VoidCallback? suffixPressed;
  TextInputType? txttype;
  double? h;
  int? lines;
  bool? enabled;
  Function(String)? onChanged;
  Color? colorfill;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: h ?? 58.h,
      decoration: BoxDecoration(
        color: colorfill ?? Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        enabled: enabled,
        inputFormatters: inputFormatters,
        keyboardType: txttype,
        maxLines: lines ?? 1,
        decoration: InputDecoration(
          fillColor: colorfill ?? backgroundinputcolor,
          filled: true,
          // errorBorder: const OutlineInputBorder(
          //     borderSide: BorderSide(
          //   color: Colors.red,
          //   width: 1,
          // )),
          prefixIcon: icon,
          label: Text(lebel!),
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 10.0.w),
          prefixText: prefixtxt,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: suffixIcon != null
              ? IconButton(icon: Icon(suffixIcon), onPressed: suffixPressed)
              : null,
        ),
        controller: controller,
        obscureText: ispassword ?? false,
      ),
    );
  }
}
