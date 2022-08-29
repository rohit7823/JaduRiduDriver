import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/dob_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/guideline_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/image_viewer.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_text_input.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/progress_button.dart';
import 'package:jadu_ride_driver/presentation/screens/upload_image_view.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class DriverLicenseScreen extends StatefulWidget {
  const DriverLicenseScreen({Key? key}) : super(key: key);

  @override
  State<DriverLicenseScreen> createState() => _DriverLicenseScreenState();
}

class _DriverLicenseScreenState extends State<DriverLicenseScreen> {
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
            child: StringProvider.driverLicense
                .text(AppTextStyle.enterNumberStyle)
                .padding(
                    insets: EdgeInsets.symmetric(
                        horizontal: 0.05.sw, vertical: 0.03.sw))),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      child: Column(
        children: [
          expand(
            flex: 8,
            child: ListView(
              padding:
                  EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sw),
              children: [
                ImageViewer(selectedImage: null, onClose: () {}),
                StringProvider.pleaseEnterDrivingLicenseNumber
                    .text(AppTextStyle.enterDrivingLicNumberStyle)
                    .padding(insets: EdgeInsets.only(bottom: 0.05.sw)),
                MyTextInput(
                        onTextChange: (value) {},
                        keyboardType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        placeholderText: StringProvider.driverLicenseNumber,
                        isMandatory: true)
                    .padding(insets: EdgeInsets.only(bottom: 0.05.sw)),
                MyTextInput(
                    onTextChange: (value) {},
                    keyboardType: TextInputType.number,
                    inputAction: TextInputAction.done,
                    placeholderText: StringProvider.reEnterDriverLicenseNumber,
                    isMandatory: true),
                GuideLineView(guildLine: StringProvider.imageChooseGuidLine),
                GuideLineView(guildLine: StringProvider.imageChooseGuidLine2),
                UploadImageView(
                    onClick: () {}, title: StringProvider.uploadDriverLicense)
              ],
            ),
          ),
          const Divider(
            color: AppColors.lightGray,
            height: 0.05,
          ),
          expand(
              flex: 2,
              child: Align(
                child: ProgressButton(
                    enableBtn: true, uploader: Uploader(), onPress: () {}),
              ))
        ],
      ),
    );
  }
}
