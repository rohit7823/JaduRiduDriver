import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/intro_data.dart';
import 'package:jadu_ride_driver/core/domain/login_registration_data.dart';
import 'package:jadu_ride_driver/core/domain/response/batch_call_response.dart';
import 'package:jadu_ride_driver/core/domain/response/intro_data_response.dart';
import 'package:jadu_ride_driver/core/domain/response/login_register_data_response.dart';
import 'package:jadu_ride_driver/core/repository/batch_call_repository.dart';

class BatchCallRepositoryImpl implements BatchCallRepository {
  final Dio _dio;
  BatchCallRepositoryImpl(this._dio) {}

  @override
  Future<Resource<BatchCallResponse>> getIntroPageData() async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(
        BatchCallResponse(status: true, message: "Success", responses: [
      IntroDataResponse(status: true, message: "Success", introData: [
        IntroData(
            id: "443671",
            heading: "Lorem Ipsum",
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet.",
            coverImage: "assets/images/book_delivery.svg"),
        IntroData(
            id: "032481",
            heading: "Lorem Ipsum",
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet.",
            coverImage: "assets/images/book_delivery.svg"),
      ])
    ]));
  }

  @override
  Future<Resource<BatchCallResponse>> getLRPageData() async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(
        BatchCallResponse(status: true, message: "Success", responses: [
      LoginRegisterDataResponse(
          status: true,
          message: "Success",
          data: LoginRegistrationData(
              coverImage:
                  "https://jaduridedev.v-xplore.com/assets/images/book_delivery.svg",
              heading: "Lorem Ipsum",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet."))
    ]));
  }
}
