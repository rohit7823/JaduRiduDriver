import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/repository/registration_certificate_repository.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_registration_certificate_response.dart';

class RegistrationCeritificateRepositoryImpl
    implements RegistrationCertificateRepository {
  @override
  Future<Resource<UploadRegistrationCertificateResponse>> uploadCertificate(
      String userId, File certificate, Function(bool, int) onUploading) async {
    var size = await certificate.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadRegistrationCertificateResponse(
        status: true, message: "Success", isUploaded: true));
  }
}
