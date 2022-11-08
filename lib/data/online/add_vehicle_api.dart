import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/common/app_route.dart';
import 'package:jadu_ride_driver/core/domain/response/add_car_response.dart';
import 'package:jadu_ride_driver/core/domain/response/initial_data_in_add_vehicle_response.dart';
import 'package:jadu_ride_driver/core/domain/response/user_vehicle_response.dart';
import 'package:retrofit/http.dart';

part 'add_vehicle_api.g.dart';

@RestApi()
abstract class AddVehicleApi {
  factory AddVehicleApi(Dio dio, {String? baseUrl}) = _AddVehicleApi;

  @GET(ApiRoutes.vehicleTypes)
  Future<InitialDataInAddVehicleResponse> vehicleTypes();

  @GET("${ApiRoutes.vehicleTypes}/car")
  Future<CarResponse> car(@Query("vehicle_type_id") String vehicleTypeId);

  @POST("${ApiRoutes.parent}/users/{userId}/vehicle/number")
  @FormUrlEncoded()
  Future<UserVehicleResponse> addVehicle(
      @Path("userId") String userId,
      @Field("vehicle_type_id") String vehicleTypeId,
      @Field("vehicle_number") String vehicleNumber);
}
