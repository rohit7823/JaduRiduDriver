import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class ProfilePictureScreen extends StatefulWidget {
  const ProfilePictureScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePictureScreen> createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          expand(flex: 1, child: _upperSideContent()),
          expand(flex: 9, child: _lowerSideContent())
        ],
      ),
    );
  }

  Widget _upperSideContent() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.r))),
      child: Align(
        alignment: Alignment.topLeft,
        child: fitBox(
            child: StringProvider.profilePicture
                .text(AppTextStyle.enterNumberStyle)
                .padding(
                    insets: EdgeInsets.symmetric(
                        horizontal: 0.05.sw, vertical: 0.03.sw))),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          expand(
              flex: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: fitBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.05.sw),
                        child: AnimatedContainer(
                          width: 0.90.sw,
                          height: 0.20.sh,
                          duration: const Duration(milliseconds: 400),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: AppColors.lightGray),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          expand(
              flex: 5,
              child: Align(
                child: fitBox(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StringProvider.selectOrChoosePicture
                              .text(AppTextStyle.detailsTypeItemTextStyle)
                              .padding(
                                  insets: EdgeInsets.only(bottom: 0.05.sw)),
                          InkWell(
                            onTap: () {},
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                            overlayColor: MaterialStateProperty.all(
                                AppColors.lightGray.withOpacity(.1)),
                            child: DottedBorder(
                              color: AppColors.lightGray,
                              borderType: BorderType.RRect,
                              radius: Radius.circular(20.r),
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              dashPattern: [8, 4],
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
                      ).padding(insets: EdgeInsets.only(bottom: 0.05.sw)),
                      ElevatedButton(
                        onPressed: () {},
                        style: AppButtonThemes.defaultStyle,
                        child: StringProvider.done
                            .text(AppTextStyle.btnTextStyleWhite),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
