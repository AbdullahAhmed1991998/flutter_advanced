import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/helpers/extentions.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';
import 'package:flutter_advanced_course/core/theming/app_colors.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_advanced_course/feature/signup/presentation/manager/sign_up_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listenWhen: (previous, current) =>
      current is Loading ||
          current is Success ||
          current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainBlue,
                ),
              ),
            );
          },
          success: (signupResponse) {
            context.pop();
            showSuccessDialog(context);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                context.pushNamed(Routes.loginPage);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
