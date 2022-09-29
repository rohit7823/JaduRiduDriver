
import '../common/response.dart';
import '../domain/response/required_data_driver_refer_response.dart';

abstract class DriverReferRepository{
  Future<Resource<RequiredDataDriverReferResponse>> getDriverReferInittialData(String userId);
}