import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';
import 'package:flutter_advanced_course/feature/login/presentation/pages/login_page.dart';
import 'package:flutter_advanced_course/feature/onboarding/presentation/pages/onboarding_page.dart';

class AppRouter{

   Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingPage:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case Routes.loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found'),),
        ),);
    }
  }
}
