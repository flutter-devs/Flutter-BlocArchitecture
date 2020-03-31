import 'package:flutter_bloc_architecture/src/models/network_data_models/login/response/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String status;
  int code;
  String message;
  Result result;

  LoginResponse({
    this.status,
    this.code,
    this.message,
    this.result,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
