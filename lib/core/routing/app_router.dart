import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/di/dependency_injection.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';
import 'package:flutter_advanced_course/feature/home/presentation/pages/home_page.dart';
import 'package:flutter_advanced_course/feature/login/presentation/manager/login_bloc.dart';
import 'package:flutter_advanced_course/feature/login/presentation/pages/login_page.dart';
import 'package:flutter_advanced_course/feature/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter_advanced_course/feature/signup/presentation/manager/sign_up_bloc.dart';
import 'package:flutter_advanced_course/feature/signup/presentation/pages/sign_up_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingPage:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => getIt<LoginBloc>(),
            child: const LoginPage(),
          ),
        );
      case Routes.signUpPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignUpBloc>(),
                  child: const SignUpPage(),
                ));
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
