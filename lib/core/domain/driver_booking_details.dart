import 'package:jadu_ride_driver/core/domain/customer_details.dart';

class DriverBookingDetails {
  String bookId;
  String vehicleType;
  String pickUpLocation;
  String estimateDistance;
  String eta;
  CustomerDetails customerDetails;
  int passTimer;
  double lat;
  double lng;


  DriverBookingDetails(
      {required this.bookId, required this.vehicleType,
      required this.pickUpLocation,
      required this.customerDetails,
      required this.passTimer,
        required this.estimateDistance,
        required this.eta,
      required this.lat,
      required this.lng});
}
