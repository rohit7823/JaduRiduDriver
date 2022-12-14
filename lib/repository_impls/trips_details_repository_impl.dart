import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/required_data_trips_details_response.dart';
import 'package:jadu_ride_driver/core/repository/trips_details_repository.dart';
import 'package:jadu_ride_driver/data/online/trips_transaction_api.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/domain/trips_details.dart';

class TripsDetailsRepositoryImpl extends TripsDetailsRepository {
  final Dio _dio;
  late final TripsTransactionApi _tripsTransactionApi;

  TripsDetailsRepositoryImpl(this._dio){
    _tripsTransactionApi = TripsTransactionApi(_dio);
  }
  @override
  Future<Resource<TripsTransactionResponse>> getTripsDetailsInittialData(
      String userInputId, String finalCurrentDate) async {
    return _tripsTransactionApi
        .tripsdetail(userInputId, finalCurrentDate)
        .handleResponse<TripsTransactionResponse>();


    // await Future.delayed(const Duration(seconds: 2));
    // return Success(TripsTransactionResponse(
    //     status: true,
    //     message: "Success",
    //     trips: List.generate(
    //         3,
    //         (index) => trips(
    //             date: "Monday 18th June , 2022",
    //             time: "Today: 5:15 pm",
    //             id: "5431443675434214",
    //             destinationAddress: "V-xplore Technologies",
    //             farePrice: "400.00",
    //             paymentType: "Cash",
    //             sourceAddress: "Howrah Railway Station")),  ));
  }
}
