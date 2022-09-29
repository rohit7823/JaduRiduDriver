import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/required_data_trips_details_response.dart';
import 'package:jadu_ride_driver/core/repository/trips_details_repository.dart';

import '../core/domain/trips_details.dart';

class TripsDetailsRepositoryImpl extends TripsDetailsRepository {
  @override
  Future<Resource<RequiredDataTripsDetailsResponse>> getTripsDetailsInittialData(
      String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataTripsDetailsResponse(
        status: true,
        message: "Success",
        tripsDetailsList: List.generate(
            5,
            (index) => TripsDetails(
                date: "Monday 18th June , 2022",
                time: "Today: 5:15 pm",
                id: "ID: 5431443675434214",
                destinationAddress: "To - V-xplore Technologies",
                farePrice: "₹400.00",
                paymentType: "CASH",
                sourceAddress: "From - Howrah Railway Station"))));
  }
}
