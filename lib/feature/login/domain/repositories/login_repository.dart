import 'package:flutter_advanced_course/core/networking/api_result.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_request_body_model.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_response_model.dart';

abstract class LoginRepository {

  Future<ApiResult<LoginResponseModel>> login(LoginRequestBodyModel loginRequestBodyModel);
}