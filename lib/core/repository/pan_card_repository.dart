import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_pan_card_response.dart';

abstract class PanCardRepository {
  Future<Resource<UploadPanCardResponse>> uploadPanCard(String userId,
      String number, File panCard, Function(bool, int) onUploading);
}
