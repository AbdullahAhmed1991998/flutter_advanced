import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/feature/signup/data/models/sign_up_request_body_model.dart';
import 'package:flutter_advanced_course/feature/signup/data/models/sign_up_response_model.dart';
import 'package:flutter_advanced_course/feature/signup/data/repositories/sign_up_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final SignUpRepositoryImpl _signUpRepositoryImpl ;

  SignUpBloc(this._signUpRepositoryImpl) : super(const SignUpState.initial()) {
    on<SignUpEvent>((event, emit) async {
      await event.when(started: (){
        emit(const SignUpState.initial());
      }, signUp: (SignUpRequestBodyModel signUpRequestBodyModel) async{
        emit(const SignUpState.loading());
        final response = await _signUpRepositoryImpl.signUp(signUpRequestBodyModel);
        response.when(success: (signUpResponseModel) {
          emit(SignUpState.success( signUpResponseModel));
        }  , failure: (error) {
          emit(SignUpState.error(error: error.apiErrorModel.message ?? ''));
        },);
      },);
    });
  }
}
