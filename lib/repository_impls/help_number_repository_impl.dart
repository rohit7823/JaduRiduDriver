
import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/required_data_help_repository.dart';

import '../core/domain/response/upload_data_response.dart';
import '../core/repository/help_repository.dart';

class HelpPhoneNumberRepositoryImpl extends HelpRepository{

  @override
  Future<Resource<RequiredDataHelpResponse>> getHelpInittialData(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataHelpResponse(status: true, message: "Success", helpPhoneNumber: "9876543210"));
  }

  @override
  Future<Resource<UploadHelpInqueryResponse>> uploadInqueryData(String userId, String userInputName, String userInputEmail, String userInputSubject, String userInputMsg) async{
    await Future.delayed(const Duration(seconds: 2));
    return Success(UploadHelpInqueryResponse(status: true, message: "Success", isUploaded: true));
  }

}