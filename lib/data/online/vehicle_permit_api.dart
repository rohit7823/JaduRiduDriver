import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'vehicle_permit_api.g.dart';

@RestApi()
abstract class VehiclePermitApi {
  factory VehiclePermitApi(Dio dio, {String? baseUrl}) = _VehiclePermitApi;
}
