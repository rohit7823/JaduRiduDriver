import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';

enum PaymentMethod {
  cash("CASH", ImageAssets.cashPayment),
  online("ONLINE", ImageAssets.onlinePayment);

  final String value;
  final String image;
  const PaymentMethod(this.value, this.image);
}
