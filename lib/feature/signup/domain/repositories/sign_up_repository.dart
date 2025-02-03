import 'package:flutter_advanced_course/core/networking/api_result.dart';
import 'package:flutter_advanced_course/feature/signup/data/models/sign_up_request_body_model.dart';
import 'package:flutter_advanced_course/feature/signup/data/models/sign_up_response_model.dart';

abstract class SignUpRepository {

  Future<ApiResult<SignUpResponseModel>> signUp(SignUpRequestBodyModel signUpRequestBodyModel);
}
