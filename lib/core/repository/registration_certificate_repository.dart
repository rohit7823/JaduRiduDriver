import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_registration_certificate_response.dart';

abstract class RegistrationCertificateRepository {
  Future<Resource<UploadRegistrationCertificateResponse>> uploadCertificate(
      String userId, File certificate, Function(int, int) onUploading);
}
