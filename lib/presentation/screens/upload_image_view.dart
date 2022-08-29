import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../ui/app_text_style.dart';
import '../ui/string_provider.dart';

class UploadImageView extends StatelessWidget {
  VoidCallback onClick;
  String title;
  UploadImageView({Key? key, required this.onClick, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fitBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title
              .text(AppTextStyle.detailsTypeItemTextStyle)
              .padding(insets: EdgeInsets.only(bottom: 0.03.sw)),
          InkWell(
            onTap: onClick,
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            overlayColor:
                MaterialStateProperty.all(AppColors.lightGray.withOpacity(.1)),
            child: DottedBorder(
              color: AppColors.lightGray,
              borderType: BorderType.RRect,
              radius: Radius.circular(20.r),
              strokeWidth: 1,
              strokeCap: StrokeCap.round,
              dashPattern: const [8, 4],
              child: SizedBox(
                width: 0.90.sw,
                height: 0.20.sh,
                child: Icon(
                  Icons.camera_alt_rounded,
                  size: 0.15.sw,
                  color: AppColors.Gray,
                ),
              ),
            ),
          )
        ],
      ).padding(insets: EdgeInsets.symmetric(vertical: 0.05.sw)),
    );
  }
}
