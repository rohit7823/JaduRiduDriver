import 'package:jadu_ride_driver/core/domain/intro_data.dart';

class IntroDataResponse {
  bool status;
  String message;
  List<IntroData> introData;

  IntroDataResponse({required this.status, required this.message, required this.introData});

  factory IntroDataResponse.fromJson(Map<String, dynamic> json) =>
      IntroDataResponse(
        status: json['status'] as bool,
        message: json['message'] as String,
        introData: (json['introData'] as List)
            .map((e) => IntroData.formJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'status': status,
    'message': message,
    'introData': introData,
  };
}