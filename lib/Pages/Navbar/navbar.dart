import 'dart:async';

import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
import 'package:dilivirya/Pages/Favorite/favorite_view.dart';
import 'package:dilivirya/Pages/Home/home_view.dart';
import 'package:dilivirya/Pages/Offer/offer_view.dart';
import 'package:dilivirya/Pages/Products/products_view.dart';
import 'package:dilivirya/Pages/Setting/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Navbar extends StatefulWidget {
  int _currentPage = 0;
  int currentPage = 0;
  Navbar(this._currentPage, this.currentPage);
  @override
  _Navbar createState() => _Navbar();
}

class _Navbar extends State<Navbar> with TickerProviderStateMixin {
  static const int totalPage = 4;

  @override
  void initState() {
    super.initState();
  }

  var page = [Home(), OfferView(), ProductsView(), Setting()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomBarPageTransition(
        builder: (_, index) => page[index],
        currentIndex: widget._currentPage,
        totalLength: totalPage,
        transitionType: transitionType,
        transitionDuration: duration,
        transitionCurve: curve,
      ),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  Widget _getBottomBar() {
    return BottomNavigationBar(
      currentIndex: widget._currentPage,
      onTap: (index) {
        widget._currentPage = index;
        setState(() {});
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            widget.currentPage = index;
          });
        });
      },
      selectedItemColor: Color(0xff081127),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: widget.currentPage == 0
              ? ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const RadialGradient(
                      center: Alignment.bottomLeft,
                      radius: 1.5,
                      colors: <Color>[
                        Color(0xFF240E44),
                        Color(0xFF8B66C2),
                      ],
                      tileMode: TileMode.repeated,
                    ).createShader(bounds);
                  },
                  child: SvgPicture.asset('assets/icons/home.svg'),
                )
              : SvgPicture.asset('assets/icons/home.svg', color: Colors.grey),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: widget.currentPage == 1
              ? ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const RadialGradient(
                      center: Alignment.bottomLeft,
                      radius: 1.5,
                      colors: <Color>[
                        Color(0xFF271049),
                        Color(0xFF8F6CC4),
                      ],
                      tileMode: TileMode.repeated,
                    ).createShader(bounds);
                  },
                  child: SvgPicture.asset('assets/icons/offers.svg'),
                )
              : SvgPicture.asset('assets/icons/offers.svg', color: Colors.grey),
          label: 'Offers',
        ),
        BottomNavigationBarItem(
          icon: widget.currentPage == 2
              ? ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const RadialGradient(
                      center: Alignment.bottomLeft,
                      radius: 1.5,
                      colors: <Color>[
                        Color(0xFF271049),
                        Color(0xFF8F6CC4),
                      ],
                      tileMode: TileMode.repeated,
                    ).createShader(bounds);
                  },
                  child: SvgPicture.asset('assets/icons/products.svg'),
                )
              : SvgPicture.asset('assets/icons/products.svg',
                  color: Colors.grey),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: widget.currentPage == 3
              ? ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const RadialGradient(
                      center: Alignment.bottomLeft,
                      radius: 1.5,
                      colors: <Color>[
                        Color(0xFF271049),
                        Color(0xFF8F6CC4),
                      ],
                      tileMode: TileMode.repeated,
                    ).createShader(bounds);
                  },
                  child: SvgPicture.asset('assets/icons/setting.svg'),
                )
              : SvgPicture.asset('assets/icons/setting.svg',
                  color: Colors.grey),
          label: 'Settings',
        ),
      ],
    );
  }

  Duration duration = const Duration(milliseconds: 100);
  Curve curve = Curves.ease;
  TransitionType transitionType = TransitionType.circular;
}
