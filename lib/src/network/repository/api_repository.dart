import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/models/network_data_models/login/request/login_request.dart';
import 'package:flutter_bloc_architecture/src/models/network_data_models/login/response/login_response.dart';
import 'package:flutter_bloc_architecture/src/network/api_client/api_rest_client.dart';

class ApiRepository {
  ApiRestClient apiRestClient;

  ApiRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    apiRestClient = ApiRestClient(_dio);
  }

  Future<LoginResponse> login({
    @required String email,
    @required String password,
  }) async {
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    return await apiRestClient.login(loginRequest);
  }
}
