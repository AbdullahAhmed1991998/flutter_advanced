import 'package:flutter_advanced_course/core/networking/api_result.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_request_body.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_response.dart';

abstract class LoginRepository {

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody);
}