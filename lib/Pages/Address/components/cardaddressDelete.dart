// import 'package:dilivirya/Pages/Home/components/small_button.dart';
// import 'package:dilivirya/helper/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class CardAddress extends StatelessWidget {
//   const CardAddress({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 20.w, right: 14.w),
//       width: double.infinity,
//       height: 68.h,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               SmallButton(
//                 w: 40.w,
//                 h: 40.h,
//                 color: Colors.transparent,
//                 icon: SvgPicture.asset('assets/icons/search.svg'),
//               ),
//               SizedBox(
//                 width: 15.w,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Home',
//                     style: text14600txtcolor,
//                   ),
//                   Text(
//                     'Damascus, mashroo Du....',
//                     style: text12400desc,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const Icon(
//             Icons.arrow_drop_down_rounded,
//             size: 35,
//           )
//         ],
//       ),
//     );
//   }
// }
