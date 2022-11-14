import '../common/response.dart';
import '../domain/response/profile_response.dart';
import '../domain/response/user_short_detail_response.dart';

abstract class ProfileRepository{
  Future<Resource<ShortProfileDetailResponse>> profileRequest(String userInputId);
}