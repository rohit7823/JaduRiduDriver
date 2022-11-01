import 'package:flutter/widgets.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/service/app_lifecyle_utility_callbacks.dart';
import 'package:jadu_ride_driver/core/service/constants.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';

class AppOverlayWidget extends StatefulWidget {
  const AppOverlayWidget({Key? key}) : super(key: key);

  @override
  State<AppOverlayWidget> createState() => _AppOverlayWidgetState();
}

class _AppOverlayWidgetState extends State<AppOverlayWidget> {
  @override
  void initState() {
    super.initState();
    FlutterOverlayWindow.overlayListener.listen((signal) {
      switch (signal.toString()) {
        case Constants.closeOverlay:
          FlutterOverlayWindow.closeOverlay();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        AppLifeCycleUtilityCallbacks.bringToForeground(
            Screen.rideNavigation.name);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: AppColors.primaryVariant, shape: BoxShape.circle),
        child: Image.asset(
          ImageAssets.logo,
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
