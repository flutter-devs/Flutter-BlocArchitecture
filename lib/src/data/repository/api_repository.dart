import 'package:flutter_bloc_architecture/src/data/network/api_clients/dio_client.dart';
import 'package:flutter_bloc_architecture/src/data/network/api_clients/rest_client.dart';
import 'package:flutter_bloc_architecture/src/data/repository/repository_interfaces/i_api_repository.dart';
import 'package:flutter_bloc_architecture/src/models/network_model/response/upcoming_event/upcoming_event_response.dart';
import 'package:flutter_bloc_architecture/src/utils/utils.dart';

class APIRepository extends IAPIRepository {
  RestClient _apiBaseHelper;
  DioClient _dioClient;

  APIRepository() {
    _apiBaseHelper = RestClient();
  }

  @override
  Future<UpComingEventsResponse> getUpcomingEvents() async {
    final response = await _apiBaseHelper.get("");
    return UpComingEventsResponse.fromJson(response);
  }
}
