import 'package:dilivirya/Pages/Home/components/small_button.dart';
import 'package:dilivirya/Pages/Order%20History/components/body_order.dart';
import 'package:dilivirya/Pages/Order%20History/components/header_order.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OrderHistory extends StatefulWidget {
  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  bool? extend = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          color: Colors.transparent,
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: background2,
        elevation: 0,
        bottom: PreferredSize(
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 5.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.black,
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      'Order history',
                      style: text18600txtcolor,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                        child: PopupMenuButton(
                      icon: SmallButton(
                        h: 40.h,
                        w: 40.w,
                        icon: SvgPicture.asset('assets/icons/sort.svg'),
                        color: orangebuttonColor,
                      ),
                      elevation: 4,
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Accepte ", style: text16400txtcolor),
                          value: 1,
                          onTap: () {},
                        ),
                        PopupMenuItem(
                          child: Text("Rejected", style: text16400txtcolor),
                          value: 1,
                          onTap: () {},
                        ),
                        PopupMenuItem(
                          child: Text("Pindding", style: text16400txtcolor),
                          value: 1,
                          onTap: () {},
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(15.h)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h, top: 10.h),
        color: background2,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: ExpansionPanelList(
                animationDuration: const Duration(milliseconds: 800),
                elevation: 0,
                children: [
                  ExpansionPanel(
                    body: const BodyOrder(),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return HeaderOrder(extend: extend);
                    },
                    isExpanded: extend!,
                  ),
                ],
                expansionCallback: (int item, bool status) {
                  setState(() {
                    extend = !extend!;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}


// import 'package:flutter_expansion_panel_demo/model/expnasion_panel_model.dart';


