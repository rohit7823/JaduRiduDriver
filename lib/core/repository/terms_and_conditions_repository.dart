import '../common/response.dart';
import '../domain/response/required_dataterms_and_conditions_response.dart';

abstract class TermsAndConditionsRepository {
  Future<Resource<RequiredDataTermsAndConditionsResponse>> getTermsAndConditionsInittialData(String userId);
}