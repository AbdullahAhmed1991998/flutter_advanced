import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_advanced_course/core/widgets/app_text.dart';
import 'package:flutter_advanced_course/core/widgets/app_text_button.dart';
import 'package:flutter_advanced_course/feature/onboarding/presentation/widgets/doc_logo_and_name.dart';
import 'package:flutter_advanced_course/feature/onboarding/presentation/widgets/doctor_image_and_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
              child: Column(
                children: [
                  const DocLogoAndName(),
                  SizedBox(height: 30.h),
                  const DoctorImageAndText(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      children: [
                        AppText(
                          text: 'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                          textStyle: TextStyles.font13GrayRegular,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30.h),
                        AppTextButton(buttonText: "Get Start", textStyle: TextStyles.font16WhiteSemiBold, onPressed: (){
                          Navigator.pushNamed(context, Routes.loginPage);
                        },),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),),
    );
  }
}
