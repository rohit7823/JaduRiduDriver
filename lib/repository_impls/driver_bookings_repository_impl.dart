import 'dart:async';
import 'dart:math';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/customer_details.dart';
import 'package:jadu_ride_driver/core/domain/driver_booking_details.dart';
import 'package:jadu_ride_driver/core/repository/driver_bookings_repository.dart';

class DriverBookingsRepositoryImpl implements DriverBookingsRepository {
  @override
  Stream<Resource<DriverBookingDetails>> booking() async* {
    final random = Random();
    for(int i = 0; i < 5; i++) {
      double randomLat = -90 + random.nextDouble() * 90 * 2;
      double randomLng = -180 + random.nextDouble() * 180 * 2;
      yield Success(DriverBookingDetails(
          bookId: "${i+1}",
          vehicleType: "FOUR_WHEELER",
          pickUpLocation: "Sankarpur Colony, Sankarpur",
          customerDetails: CustomerDetails(
              name: "Customer ${i+1}",
              image: "https://i.pravatar.cc/100",
              rating: 3.5
          ),
          passTimer: 30,
          lat: randomLat,
          lng: randomLng,
          estimateDistance: '${random.nextInt(50)} KM',
          eta: "${random.nextDouble().toStringAsFixed(2)} ETA"
      ));
      await Future.delayed(const Duration(seconds: 20));
    }
  }
}