import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'profile_picture_api.g.dart';

@RestApi()
abstract class ProfilePictureApi {
  factory ProfilePictureApi(Dio dio, {String baseUrl}) = _ProfilePictureApi;
}
