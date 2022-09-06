import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/repository/registration_certificate_repository.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_registration_certificate_response.dart';
import 'package:jadu_ride_driver/data/online/registration_certificate_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class RegistrationCeritificateRepositoryImpl
    implements RegistrationCertificateRepository {
  final Dio _dio;
  late final RegistrationCertificateApi _registrationCertificateApi;

  RegistrationCeritificateRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _registrationCertificateApi = RegistrationCertificateApi(_dio);
  }

  @override
  Future<Resource<UploadRegistrationCertificateResponse>> uploadCertificate(
      String userId, File certificate, Function(int, int) onUploading) async {
    return await _registrationCertificateApi
        .addRegistrationCert(userId, certificate, onUploading)
        .handleResponse<UploadRegistrationCertificateResponse>();

    /*var size = await certificate.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadRegistrationCertificateResponse(
        status: true, message: "Success", isUploaded: true));*/
  }
}
