import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_registration_certificate_response.dart';
import 'package:retrofit/http.dart';

part 'registration_certificate_api.g.dart';

@RestApi()
abstract class RegistrationCertificateApi {
  factory RegistrationCertificateApi(Dio dio, {String? baseUrl}) =
      _RegistrationCertificateApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/rc")
  @MultiPart()
  Future<UploadRegistrationCertificateResponse> addRegistrationCert(
      @Path("userId") String userId,
      @Part(name: "document_image") File documentImage,
      Function(int, int) uploading);
}
