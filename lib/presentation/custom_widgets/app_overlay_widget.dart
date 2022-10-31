import 'package:flutter/widgets.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
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
      switch(signal.toString().toLowerCase()) {
        case "close":
          FlutterOverlayWindow.closeOverlay();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FlutterForegroundTask.launchApp("");
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle
        ),
        child: Image.asset(ImageAssets.logo, width: 120, height: 120,),
      ),
    );
  }
}
