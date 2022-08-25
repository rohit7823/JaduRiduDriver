import 'package:jadu_ride_driver/core/domain/step.dart';

class AddAllDetailsInitialDataResponse {
  bool status;
  String message;
  List<DetailStep> requiredSteps;
  List<DetailStep> optionalSteps;

  AddAllDetailsInitialDataResponse(
      {required this.status,
      required this.message,
      required this.requiredSteps,
      required this.optionalSteps});
}
