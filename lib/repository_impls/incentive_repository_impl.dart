import 'package:jadu_ride_driver/core/domain/incentive.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_incentive_response.dart';
import 'package:jadu_ride_driver/core/repository/incentive_repository.dart';

import '../core/common/response.dart';

class IncentiveRepositoryImpl implements IncentiveRepository {
  /*final Dio _dio;
  late final PartnerCareApi _partnerCareApi;*/

  @override
  Future<Resource<UploadIncentiveResponse>> uploadIncentiveResponse(
      String userInputId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(UploadIncentiveResponse(
        status: true,
        message: "Success",
        incentives: List.generate(
            5,
            (index) => Incentive(
                heading: "Congratulations!",
                description:
                    "Lorem Ipsum is simply dummy text of the Task Completed..",
                incentivePrice: 100))));
  }
}
