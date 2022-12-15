import 'package:jadu_ride_driver/core/domain/emergency_place.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class EmergencyPlacesResponse extends BusinessObject {
  bool status;
  String message;
  List<EmergencyPlace> places;

  EmergencyPlacesResponse(
      {required this.status, required this.message, required this.places});

  factory EmergencyPlacesResponse.fromJson(Map<String, dynamic> json) =>
      EmergencyPlacesResponse(
        status: json["status"],
        message: json["message"],
        places: List<EmergencyPlace>.from(
            json["nearByHospitals"].map((x) => EmergencyPlace.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "nearByHospitals": List<dynamic>.from(places.map((x) => x.toJson())),
      };
}
