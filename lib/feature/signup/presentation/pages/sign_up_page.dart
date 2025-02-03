import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/helpers/spacing.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_advanced_course/core/widgets/app_text_button.dart';
import 'package:flutter_advanced_course/feature/login/presentation/widgets/do_not_have_account_text.dart';
import 'package:flutter_advanced_course/feature/login/presentation/widgets/terms_and_conditions_text.dart';
import 'package:flutter_advanced_course/feature/signup/data/models/sign_up_request_body_model.dart';
import 'package:flutter_advanced_course/feature/signup/presentation/manager/sign_up_bloc.dart';
import 'package:flutter_advanced_course/feature/signup/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:flutter_advanced_course/feature/signup/presentation/widgets/sign_up_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const SignupForm(),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignUpBloc>().formKey.currentState!.validate()) {
      context.read<SignUpBloc>().add(SignUpEvent.signUp(
        SignUpRequestBodyModel(
          email: context.read<SignUpBloc>().emailController.text,
          password: context.read<SignUpBloc>().passwordController.text,
          passwordConfirmation: context.read<SignUpBloc>().passwordConfirmationController.text,
          name: context.read<SignUpBloc>().nameController.text,
          phone: context.read<SignUpBloc>().phoneController.text,
          gender: 0,
        ),
      ),);
    }
  }
}