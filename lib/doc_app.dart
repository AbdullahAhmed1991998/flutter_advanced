import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/routing/app_router.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';
import 'package:flutter_advanced_course/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DocApp extends StatelessWidget {

   DocApp({super.key, required this.appRouter});

   final AppRouter appRouter ;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // width & hight of your mobile design in figma or adobe xd
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        title: "Doc App",
        initialRoute: Routes.onBoardingPage,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
