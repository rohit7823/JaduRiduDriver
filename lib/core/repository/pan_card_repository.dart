import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_pan_card_response.dart';

abstract class PanCardRepository {

  Future<MasterResponse> setData(String userId);

  Future<Resource<UploadPanCardResponse>> uploadPanCard(String userId,
      String number, File panCard, Function(int, int) onUploading);
}
