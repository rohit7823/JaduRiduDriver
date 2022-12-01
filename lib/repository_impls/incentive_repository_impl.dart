import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/domain/incentive.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_incentive_response.dart';
import 'package:jadu_ride_driver/core/repository/incentive_repository.dart';
import 'package:jadu_ride_driver/data/online/incentives_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/common/response.dart';

class IncentiveRepositoryImpl implements IncentiveRepository {
  final Dio dio;
  late final CollectIncentivesApi _collectIncentivesApi;

  IncentiveRepositoryImpl(this.dio){
    dio.options = ApiClientConfiguration.mainConfiguration;
    _collectIncentivesApi = CollectIncentivesApi(dio);
  }


  @override
  Future<Resource<CollectCouponResponse>> uploadIncentiveResponse(String userInputId) async {

    return await _collectIncentivesApi
        .collectincentives(userInputId)
        .handleResponse<CollectCouponResponse>();

    // await Future.delayed(const Duration(seconds: 2));
    // return Success(CollectCouponResponse(
    //     status: true,
    //     message: "Success",
    //     incentives: List.generate(
    //         5,
    //         (index) => Incentive(
    //             heading: "Congratulations!",
    //             body: "Lorem Ipsum is simply dummy text of the Task Completed..",
    //             amount: '100',))));
  }
}
