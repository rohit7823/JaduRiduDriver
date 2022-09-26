

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/profile_response.dart';
import 'package:jadu_ride_driver/core/repository/profile_repository.dart';

import '../core/domain/profile_short_response.dart';

class ProfileShortRepositoryImpl implements ProfileRepository {
  @override
  Future<Resource<ProfileResponse>> profileRequest(String userInputId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(ProfileResponse(
        status: true, message: "Success",
        driverShortProfile: DriverShortProfile(
            driverName: "Mukesh Janha",
            profileImagePath: "https://i.pravatar.cc/100")));
  }

}