import 'dart:async';

import 'package:flutter_bloc_architecture/src/services/api_response.dart';

abstract class BaseApiBloc<T> {
  StreamController _streamController =
      StreamController<ApiResponse<T>>.broadcast();

  StreamSink<ApiResponse<T>> get apiDataSink => _streamController.sink;

  Stream<ApiResponse<T>> get apiDataSinkStream => _streamController.stream;

  void loadData();

  void startLoading(String message) {
    apiDataSink.add(ApiResponse.loading(message));
  }

  void addData(T data) {
    apiDataSink.add(ApiResponse.completed(data));
  }

  void addError(Exception e) {
    apiDataSink.add(ApiResponse.error(e.toString()));
  }

  dispose() {
    _streamController?.close();
  }
}
