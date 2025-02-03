import 'package:flutter_advanced_course/core/networking/api_error_handler.dart';
import 'package:flutter_advanced_course/core/networking/api_result.dart';
import 'package:flutter_advanced_course/core/networking/api_service.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_request_body.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_response.dart';
import 'package:flutter_advanced_course/feature/login/domain/repositories/login_repositories.dart';

class LoginRepositoryImpl implements LoginRepository {

  final ApiService _apiService ;

  LoginRepositoryImpl(this._apiService);
  @override
  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async{
    try{
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
