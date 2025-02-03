
import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/core/networking/api_constants.dart';
import 'package:flutter_advanced_course/core/networking/api_result.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_request_body_model.dart';
import 'package:flutter_advanced_course/feature/login/data/models/login_response_model.dart';
import 'package:flutter_advanced_course/feature/signup/data/models/sign_up_request_body_model.dart';
import 'package:flutter_advanced_course/feature/signup/data/models/sign_up_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestBodyModel loginRequestBody);


  @POST(ApiConstants.signUp)
  Future<SignUpResponseModel> signUp(@Body() SignUpRequestBodyModel signUpRequestBodyModel);
}