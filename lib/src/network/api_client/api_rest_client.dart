import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_bloc_architecture/src/constants/url_constant.dart';
import 'package:flutter_bloc_architecture/src/models/network_data_models/login/request/login_request.dart';
import 'package:flutter_bloc_architecture/src/models/network_data_models/login/response/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_rest_client.g.dart';

@RestApi(baseUrl: "")
abstract class ApiRestClient {
  factory ApiRestClient(Dio dio) = _ApiRestClient;

  /*Login Api*/
  @POST(UrlConstant.BASE_URL + UrlConstant.LOGIN)
  @FormUrlEncoded()
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
