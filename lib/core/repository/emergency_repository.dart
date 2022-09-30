import '../common/response.dart';
import '../domain/response/required_data_emergency_response.dart';
abstract class EmergencyRepository {
  Future<Resource<RequiredDataEmergencyResponse>> getEmergencyInittialData(String userId);
}