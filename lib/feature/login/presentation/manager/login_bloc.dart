import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_request_body_model.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_response_model.dart';
import 'package:flutter_advanced_course/feature/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final LoginRepositoryImpl _loginRepositoryImpl ;
  LoginBloc(this._loginRepositoryImpl) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async{

      await event.when(started: () {
        emit(const LoginState.initial());
      }, login: (LoginRequestBodyModel loginRequestBodyModel) async{
            emit(const LoginState.loading());
            final response = await _loginRepositoryImpl.login(loginRequestBodyModel);


            await response.when(success: ( loginResponse) async {
              emit( LoginState.success(loginResponse));
            }, failure: (error){
              print("DJJJJJJJJJJJJJJJJJJJJJJ");
              emit( LoginState.error(error:  error.apiErrorModel.message ?? ''));
            });

          });

    });
  }
}
