import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:jadu_ride_driver/core/common/socket_events.dart';
import 'package:jadu_ride_driver/core/domain/booking_accepted.dart';
import 'package:jadu_ride_driver/core/domain/driver_booking_details.dart';
import 'package:jadu_ride_driver/core/domain/ride_initiate_data.dart';
import 'package:jadu_ride_driver/core/repository/driver_bookings_repository.dart';
import 'package:jadu_ride_driver/utills/socket_io.dart';

class DriverBookingsRepositoryImpl implements DriverBookingsRepository {
  @override
  StreamController<DriverBookingDetails> booking() {
    var controller = StreamController<DriverBookingDetails>();

    SocketIO.client.on(SocketEvents.rideReq.value, (data) {
      debugPrint("rideReq $data");
      var response = DriverBookingDetails.fromJson(data);
      controller.add(response);
    });

    /*final random = Random();
    for (int i = 0; i < 5; i++) {
      double randomLat = -90 + random.nextDouble() * 90 * 2;
      double randomLng = -180 + random.nextDouble() * 180 * 2;
      controller.add(DriverBookingDetails(
          bookId: "${i + 1}",
          vehicleType: "FOUR_WHEELER",
          pickUpLocation: "Sankarpur Colony, Sankarpur",
          customerDetails: CustomerDetails(
              name: "Customer ${i + 1}",
              image: "https://i.pravatar.cc/100",
              rating: 3.5),
          passTimer: 30,
          lat: randomLat,
          lng: randomLng,
          estimateDistance: '${random.nextInt(50)} KM',
          eta: "${random.nextDouble().toStringAsFixed(2)} ETA"));
    }*/

    return controller;
  }

  @override
  bookingStatus(String status, String rideId, String userId) {
    SocketIO.client.emit(SocketEvents.triggerResponse.value, {
      "rideId": rideId,
      "status": status,
      "driverId": userId,
    });
  }

  @override
  StreamController<Object> onBookingAccepted() {
    StreamController<Object> controller = StreamController();
    SocketIO.client.on(SocketEvents.afterRideAccepted.value, (data) {
      debugPrint("booking status $data");
      controller.add(BookingAccepted.fromJson(data));
    });
    SocketIO.client.on(SocketEvents.rideNavigation.value, (data) {
      debugPrint("rideInitiateData $data");
      controller.add(RideInitiateData.fromJson(data));
    });
    return controller;
  }
}
