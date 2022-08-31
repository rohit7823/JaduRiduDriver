import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class PancardScreen extends StatefulWidget {
  const PancardScreen({Key? key}) : super(key: key);

  @override
  State<PancardScreen> createState() => _PancardScreenState();
}

class _PancardScreenState extends State<PancardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          expand(flex: 1, child: _upperSizeContent()),
          expand(flex: 9, child: _lowerSideContent())
        ],
      ),
    );
  }

  Widget _upperSizeContent() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.r))),
      child: Align(
        alignment: Alignment.topLeft,
        child: fitBox(
            child: StringProvider.panCard
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
              flex: 8,
              child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.05.sw, vertical: 0.05.sw),
                children: [
                  ImageViewer(selectedImage: null, onClose: () {}),
                  GuideLineView(guildLine: StringProvider.imageChooseGuidLine),
                  GuideLineView(guildLine: StringProvider.imageChooseGuidLine2),
                  StringProvider.pleaseEnterPanCardNumber
                      .text(AppTextStyle.enterDrivingLicNumberStyle)
                      .padding(
                          insets:
                              EdgeInsets.only(bottom: 0.05.sw, top: 0.05.sw)),
                  MyTextInput(
                      onTextChange: (value) {},
                      keyboardType: TextInputType.visiblePassword,
                      inputAction: TextInputAction.done,
                      placeholderText: StringProvider.panNumber,
                      textCapitalization: TextCapitalization.characters,
                      isMandatory: true),
                  UploadImageView(
                      onClick: () {}, title: StringProvider.uploadPanImage)
                ],
              )),
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
