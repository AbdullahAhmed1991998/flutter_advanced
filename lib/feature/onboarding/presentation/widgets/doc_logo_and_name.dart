import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_advanced_course/core/widgets/app_text.dart';
import 'package:flutter_advanced_course/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.imagesDocLogo),
        SizedBox(width: 10.w),
        AppText(
          text: 'DocDoc',
          textStyle: TextStyles.font24BlackBold,
        ),
      ],
    );
  }
}
