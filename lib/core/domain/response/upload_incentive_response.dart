
import '../incentive.dart';

class UploadIncentiveResponse {
  UploadIncentiveResponse(
      {required this.status, required this.message, required this.incentives});

  bool status;
  String message;
  List<Incentive> incentives;

}
