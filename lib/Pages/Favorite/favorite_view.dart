import 'package:dilivirya/Pages/Home/components/large_card_home.dart';
import 'package:flutter/material.dart';
import 'package:dilivirya/Pages/Cart/components/card_addprud.dart';
import 'package:dilivirya/Pages/Cart/components/card_bottomtotal.dart';
import 'package:dilivirya/Pages/Cart/components/card_cart.dart';
import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background2,
        elevation: 0,
        title: Text(
          'Favorite',
          style: text18600txtcolor,
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: LargeCardHome(
            type: 'product',
          ),
        ),
      ),
    );
  }
}
