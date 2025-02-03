import 'package:flutter_advanced_course/core/networking/api_error_handler.dart';
import 'package:flutter_advanced_course/core/networking/api_result.dart';
import 'package:flutter_advanced_course/core/networking/api_service.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_request_body_model.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_response_model.dart';
import 'package:flutter_advanced_course/feature/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {

  final ApiService _apiService ;

  LoginRepositoryImpl(this._apiService);
  @override
  Future<ApiResult<LoginResponseModel>> login(LoginRequestBodyModel loginRequestBodyModel) async{
    try{
      final response = await _apiService.login(loginRequestBodyModel);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
