import 'package:flutter_bloc_architecture/src/models/network_model/response/upcoming_event/upcoming_event_response.dart';

abstract class IAPIRepository {
  Future<UpComingEventsResponse> getUpcomingEvents();
}
