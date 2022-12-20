import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UpdateProfileDetailsResponse updateProfileDetailsResponseFromJson(String str) => UpdateProfileDetailsResponse.fromJson(json.decode(str));

String updateProfileDetailsResponseToJson(UpdateProfileDetailsResponse data) => json.encode(data.toJson());

class UpdateProfileDetailsResponse  extends BusinessObject{
  UpdateProfileDetailsResponse({
    required this.status,
    required this.message,
    required this.isSubmitted,
  });

  final bool status;
  final String message;
  final bool isSubmitted;

  factory UpdateProfileDetailsResponse.fromJson(Map<String, dynamic> json) => UpdateProfileDetailsResponse(
    status: json["status"],
    message: json["message"],
    isSubmitted: json["isSubmitted"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isSubmitted": isSubmitted,
  };
}
