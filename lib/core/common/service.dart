import '../../presentation/ui/image_assets.dart';
import '../service/constants.dart';

class JaduService {
  final String title;
  final String image;

  JaduService._(this.title, this.image);

  static final Emergency =
      JaduService._(Constants.emergency, ImageAssets.emergencyService);

  static final none = JaduService._(Constants.none, "");

  static const _emergency = "SERVICE_EMERGENCY";

  //static const _payLater = "SERVICE_PAY_LATER";

  static JaduService toService(String service) {
    if (service == _emergency) {
      return Emergency;
    }
    return none;
  }

  static String toName(JaduService service) {
    if (service == Emergency) {
      return _emergency;
    }

    return "";
  }
}
