import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_architecture/src/data/data_provider/app_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  String baseUrl;

  ApiBaseHelper(this.baseUrl);

  Future<dynamic> get(String url, {Map<String, String> headers}) async {
    print('Api Get, url $url');
    var responseJson;

    try {
      final response = await http.get(baseUrl + url, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body,
      {Map<String, String> headers}) async {
    print('Api Post, url $url');
    var responseJson;
    try {
      final response = await http.post(baseUrl + url, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body,
      {Map<String, String> headers}) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(baseUrl + url, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url, {Map<String, String> headers}) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(baseUrl + url);
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw UnauthorisedException(response.body.toString());
    case 403:
      throw ForbiddenException(response.body.toString());
    case 404:
      throw ResourceNotFoundException(response.body.toString());
    case 409:
      throw ConflictException(response.body.toString());
    case 500:
      throw InternalServerErrorException(response.body.toString());
    case 503:
      throw ServiceUnavailableException(response.body.toString());
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
