import '../common/response.dart';
import '../domain/response/profile_response.dart';

abstract class ProfileRepository{
  Future<Resource<ProfileResponse>> profileRequest(String userInputId);
}