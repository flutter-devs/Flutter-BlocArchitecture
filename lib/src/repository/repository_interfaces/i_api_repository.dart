import 'package:flutter_bloc_architecture/src/models/api_model/response_models/upcoming_event_response.dart';

abstract class IAPIRepository {
  Future<UpComingEventsResponse> getUpcomingEvents();
}
