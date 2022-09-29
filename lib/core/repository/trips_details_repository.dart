import '../common/response.dart';
import '../domain/response/required_data_trips_details_response.dart';

abstract class TripsDetailsRepository{
  Future<Resource<RequiredDataTripsDetailsResponse>> getTripsDetailsInittialData(String userId);
}