import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';

enum BottomMenus {
  duty(StringProvider.duty, ImageAssets.duty),
  accounts(StringProvider.accounts, ImageAssets.accounts),
  incentives(StringProvider.incentives, ImageAssets.incentives),
  partnerCare(StringProvider.partnerCare, ImageAssets.partnerCare),
  schedule(StringProvider.schedule, ImageAssets.schedule),
  more(StringProvider.more, ImageAssets.more);

  final String name;
  final String icon;
  const BottomMenus(this.name, this.icon);
}