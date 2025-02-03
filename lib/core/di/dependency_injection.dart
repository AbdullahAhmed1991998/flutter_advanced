import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/core/networking/api_service.dart';
import 'package:flutter_advanced_course/core/networking/dio_factory.dart';
import 'package:flutter_advanced_course/feature/login/data/repositories/login_repositorios_impl.dart';
import 'package:flutter_advanced_course/feature/login/presentation/manager/login_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {

  // Dio & ApiService
  Dio dio =  DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));


  // login
  getIt.registerLazySingleton<LoginRepositoryImpl>(() => LoginRepositoryImpl(getIt()));
  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt()));
}
