import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/helpers/app_regex.dart';
import 'package:flutter_advanced_course/core/helpers/spacing.dart';
import 'package:flutter_advanced_course/core/widgets/app_text_form_field.dart';
import 'package:flutter_advanced_course/feature/login/presentation/manager/login_bloc.dart';
import 'package:flutter_advanced_course/feature/login/presentation/widgets/password_validations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {


  bool isObscureText = true;


  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = context.read<LoginBloc>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginBloc>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginBloc>().emailController,
            hintText: 'Email', validator: (String? value) {
            if(value == null || value.isEmpty || !AppRegex.isEmailValid(value)){
              return 'please enter a valid Email';
            }
          },),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginBloc>().passwordController,
            hintText: 'Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (String? value ) {
              if(value == null || value.isEmpty){
                return 'Password is required';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }


}
