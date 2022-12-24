import '../../presentation/ui/image_assets.dart';
import '../service/constants.dart';

class JaduService {
  final String title;
  final String image;

  JaduService._(this.title, this.image);

  static final Car =
      JaduService._(Constants.service_ride, ImageAssets.service_ride);
  static final Bike =
      JaduService._(Constants.service_bike, ImageAssets.bikeService);
  static final Delivery =
      JaduService._(Constants.service_delivery, ImageAssets.deliveryService);
  static final Book =
      JaduService._(Constants.service_book, ImageAssets.callService);
  static final Scan =
      JaduService._(Constants.service_scan, ImageAssets.scanService);
  /*static final PayLater =
      JaduService._(Constants.service_pay_later, ImageAssets.service_pay_later);*/
  static final Rentals =
      JaduService._(Constants.service_rentals, ImageAssets.rentalService);

  static final Emergency =
      JaduService._(Constants.emergency, ImageAssets.emergencyService);

  static final none = JaduService._(Constants.none, "");

  static const _emergency = "SERVICE_EMERGENCY";
  static const _car = "SERVICE_CAR";
  static const _bike = "SERVICE_BIKE";
  static const _delivery = "SERVICE_DELIVERY";
  static const _book = "SERVICE_BOOK";
  static const _scan = "SERVICE_SCAN";
  static const _rentals = "SERVICE_RENTAL";
  //static const _payLater = "SERVICE_PAY_LATER";

  static JaduService toService(String service) {
    if (service == _emergency) {
      return Emergency;
    } else if (service == _car) {
      return Car;
    } else if (service == _bike) {
      return Bike;
    } else if (service == _delivery) {
      return Delivery;
    } else if (service == _book) {
      return Book;
    } else if (service == _scan) {
      return Scan;
    } else if (service == _rentals) {
      return Rentals;
    }
    return none;
  }

  static String toName(JaduService service) {
    if (service == Emergency) {
      return _emergency;
    } else if (service == Car) {
      return _car;
    } else if (service == Bike) {
      return _bike;
    } else if (service == Delivery) {
      return _delivery;
    } else if (service == Book) {
      return _book;
    } else if (service == Scan) {
      return _scan;
    } else if (service == Rentals) {
      return _rentals;
    }

    return "";
  }
}
