import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/add_all_details_initial_data_response.dart';
import 'package:jadu_ride_driver/core/domain/response/reset_all_details_response.dart';
import 'package:jadu_ride_driver/core/domain/step.dart';
import 'package:jadu_ride_driver/core/repository/add_all_details_repository.dart';

class AddAllDetailsRepositoryImpl implements AddAllDetailsRepository {
  @override
  Future<Resource<AddAllDetailsInitialDataResponse>> initialData() async {
    await Future.delayed(const Duration(seconds: 5));

    return Success(AddAllDetailsInitialDataResponse(
        status: true,
        message: "Success",
        requiredSteps: List.generate(
            10,
            (index) => DetailStep(
                id: "ID${index + 1}",
                key: _mapDetailsKeys(index),
                isComplete: true)), //(index + 1).isEven ? true : false)),
        optionalSteps: List.generate(
            1,
            (index) => DetailStep(
                id: "ID${index + 1}",
                key: DetailsStepKey.paymentDetails.key,
                isComplete: false))));
  }

  String _mapDetailsKeys(int index) {
    switch (index) {
      case 0:
        return DetailsStepKey.profilePicture.key;
      case 1:
        return DetailsStepKey.driverLicense.key;
      case 2:
        return DetailsStepKey.aadharCard.key;
      case 3:
        return DetailsStepKey.vehicleInsurance.key;
      case 4:
        return DetailsStepKey.registrationCertificate.key;
      case 5:
        return DetailsStepKey.panCard.key;
      case 6:
        return DetailsStepKey.vehiclePermit.key;
      case 7:
        return DetailsStepKey.vehicleAudit.key;
      case 8:
        return DetailsStepKey.vehiclePollution.key;
      case 9:
        return DetailsStepKey.identifyDetails.key;
      default:
        return "";
    }
  }

  @override
  Future<Resource<ResetAllDetailsResponse>> resetDetails(String userId) async {
    await Future.delayed(const Duration(seconds: 3));

    return Success(ResetAllDetailsResponse(
        status: true, message: "Success", isAllCleared: true));
  }
}
