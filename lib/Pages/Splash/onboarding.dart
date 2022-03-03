import 'package:dilivirya/Pages/Home/home_view.dart';
import 'package:dilivirya/Pages/Navbar/navbar.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:dilivirya/helper/constant.dart';
import 'package:dilivirya/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;

  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  double transition = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                  currentIndex == index ? transition = 0 : transition = 1;
                });
              },
              itemBuilder: (_, i) {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 350),
                  opacity: i == currentIndex ? transition = 1 : transition = 0,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 537.9.h,
                        width: double.infinity,
                        child: SvgPicture.asset(
                          contents[i].image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 480.h,
                        left: 32.w,
                        right: 33.w,
                        child: Column(
                          children: [
                            Text(contents[i].title!, style: text24500txtcolor),
                            Text(contents[i].discription!,
                                textAlign: TextAlign.left,
                                style: text16400descgrey),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          Row(
            children: [
              currentIndex == contents.length - 1
                  ? Container()
                  : Expanded(
                      child: TextButton(
                          onPressed: () {
                            box.write('onboarding', 1);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Navbar(0, 0)));
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color:
                                  currentIndex == 1 ? purbleColor : orangeColor,
                            ),
                          )),
                    ),
              Expanded(
                child: Container(
                  height: 49.h,
                  margin:
                      EdgeInsets.symmetric(horizontal: 27.w, vertical: 40.h),
                  width: double.infinity,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    child: Text(
                      currentIndex == contents.length - 1
                          ? "Get Started"
                          : "Next",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (currentIndex == contents.length - 1) {
                        box.write('onboarding', 1);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Navbar(0, 0),
                          ),
                        );
                      }

                      _controller!.nextPage(
                        duration: const Duration(milliseconds: 360),
                        curve: Curves.ease,
                      );
                    },
                    color: currentIndex == 1 ? purbleColor : orangeColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6.7.h,
      width: currentIndex == index ? 25.w : 6.7.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index == currentIndex && index == 1
            ? purbleColor
            : index == currentIndex
                ? orangeColor
                : Colors.grey,
      ),
    );
  }
}
