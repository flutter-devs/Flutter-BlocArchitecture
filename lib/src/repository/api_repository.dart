import 'package:flutter_bloc_architecture/src/models/api_model/response_models/upcoming_event_response.dart';
import 'package:flutter_bloc_architecture/src/repository/repository_interfaces/i_api_repository.dart';
import 'package:flutter_bloc_architecture/src/services/api_base_helper.dart';
import 'package:flutter_bloc_architecture/src/utils/utils.dart';

class APIRepository extends IAPIRepository {
  ApiBaseHelper _apiBaseHelper;

  APIRepository() {
    _apiBaseHelper = ApiBaseHelper(base_url);
  }

  @override
  Future<UpComingEventsResponse> getUpcomingEvents() async {
    final response = await _apiBaseHelper.get(upcoming_events);
    return UpComingEventsResponse.fromJson(response);
  }
}
