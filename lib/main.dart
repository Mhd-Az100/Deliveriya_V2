// @dart=2.9

import 'package:bot_toast/bot_toast.dart';
import 'package:dilivirya/Pages/Splash/splashScreen.dart';
import 'package:dilivirya/helper/Binds.dart';
import 'package:dilivirya/helper/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  getStorageToken();
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    box.writeIfNull('accessToken', '');
    box.writeIfNull('refreshToken', '');
    box.writeIfNull('onboarding', 0);
    box.writeIfNull('storyId', []);
    // box.remove('accessToken');
    final botToastBuilder = BotToastInit();

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => GetMaterialApp(
              initialBinding: Binds(),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.yellow,
              ),
              builder: (context, widget) {
                widget = botToastBuilder(context, widget);
                ScreenUtil.setContext(context);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget,
                );
              },
              home: SplashScreen(),
            ));
  }
}
