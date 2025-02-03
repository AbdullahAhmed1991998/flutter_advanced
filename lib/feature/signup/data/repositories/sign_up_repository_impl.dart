import 'package:flutter_advanced_course/core/networking/api_error_handler.dart';
import 'package:flutter_advanced_course/core/networking/api_result.dart';
import 'package:flutter_advanced_course/core/networking/api_service.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_request_body_model.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_response_model.dart';
import 'package:flutter_advanced_course/feature/login/domain/repositories/login_repository.dart';
import 'package:flutter_advanced_course/feature/signup/data/models/sign_up_request_body_model.dart';
import 'package:flutter_advanced_course/feature/signup/data/models/sign_up_response_model.dart';
import 'package:flutter_advanced_course/feature/signup/domain/repositories/sign_up_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {

  final ApiService _apiService ;

  SignUpRepositoryImpl(this._apiService);
  @override
  Future<ApiResult<SignUpResponseModel>> signUp(SignUpRequestBodyModel signUpRequestBodyModel) async{
    try{
      final response = await _apiService.signUp(signUpRequestBodyModel);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
