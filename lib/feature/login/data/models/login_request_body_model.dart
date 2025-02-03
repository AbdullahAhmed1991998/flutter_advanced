
import 'package:json_annotation/json_annotation.dart';
part 'login_request_body_model.g.dart';
@JsonSerializable()
class LoginRequestBodyModel {

  LoginRequestBodyModel({required this.email, required this.password});
  final String email;
  final String password;


  Map<String ,dynamic> toJson() => _$LoginRequestBodyModelToJson(this);

}
