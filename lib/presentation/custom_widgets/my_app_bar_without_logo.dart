import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/navigate_back.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';

class MyAppBarWithOutLogo extends StatelessWidget implements PreferredSizeWidget {
  MyAppBarWithOutLogo({Key? key, this.onPop}) : super(key: key);
  Function? onPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 0.10.sw,
      backgroundColor: AppColors.primary,
      leading: NavigateBack(onPop: onPop),
    );
  }

  @override
  Size get preferredSize => Size(1.sw, 0.16.sw);
}
