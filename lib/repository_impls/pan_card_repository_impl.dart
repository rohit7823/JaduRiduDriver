import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_pan_card_response.dart';
import 'package:jadu_ride_driver/core/repository/pan_card_repository.dart';

class PanCardRepositoryImpl implements PanCardRepository {
  @override
  Future<Resource<UploadPanCardResponse>> uploadPanCard(
      String userId,
      String number,
      File panCard,
      Function(bool p1, int p2) onUploading) async {
    var size = await panCard.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadPanCardResponse(
        status: true, message: "Success", isUploaded: false));
  }
}
