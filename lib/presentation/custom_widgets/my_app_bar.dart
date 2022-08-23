import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/navigate_back.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key, this.onPop}) : super(key: key);
  Function? onPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 0.16.sw,
      backgroundColor: AppColors.primary,
      leading: NavigateBack(onPop: onPop),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(
                top: 0.02.sw, bottom: 0.02.sw, left: 0.02.sw, right: 0.05.sw),
            child: Image.asset(ImageAssets.logo))
      ],
    );
  }

  @override
  Size get preferredSize => Size(1.sw, 0.16.sw);
}
