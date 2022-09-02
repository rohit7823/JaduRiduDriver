import 'package:jadu_ride_driver/core/domain/login_registration_data.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
import 'package:jadu_ride_driver/core/domain/response/intro_data_response.dart';

import 'login_register_data_response.dart';

class BatchCallResponse extends BusinessObject {
  bool status;
  String message;
  List responses;

  BatchCallResponse(
      {required this.status, required this.message, required this.responses});

  factory BatchCallResponse.fromJsonIntro(Map<String, dynamic> json) =>
      BatchCallResponse(
        status: json['status'] as bool,
        message: json['message'] as String,
        responses: (json['responses'] as List<dynamic>)
            .map((e) => IntroDataResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  factory BatchCallResponse.fromJsonRegistration(Map<String, dynamic> json) =>
      BatchCallResponse(
        status: json['status'] as bool,
        message: json['message'] as String,
        responses: (json['responses'] as List<dynamic>)
            .map((e) =>
                LoginRegisterDataResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'message': message,
        'responses': responses,
      };
}
