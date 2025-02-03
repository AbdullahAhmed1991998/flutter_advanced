part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = Loading;
  const factory SignUpState.success(SignUpResponseModel signUpResponseModel) = Success;
  const factory SignUpState.error({required String error}) = Error;
}
