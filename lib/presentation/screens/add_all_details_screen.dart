import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/core/domain/step.dart';
import 'package:jadu_ride_driver/helpers_impls/error_dialog_impl.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/animated_jadu_ride_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/step_view.dart';
import 'package:jadu_ride_driver/presentation/stores/add_all_details_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class AddAllDetailsScreen extends StatefulWidget {
  SharedStore sharedStore;
  AddAllDetailsScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<AddAllDetailsScreen> createState() => _AddAllDetailsScreenState();
}

class _AddAllDetailsScreenState extends State<AddAllDetailsScreen> {
  late final AddAllDetailsStore _store;
  late final DialogController _dialogController;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store = AddAllDetailsStore();
    _dialogController =
        DialogController(dialog: ErrorDialogImpl(buildContext: context));
    super.initState();

    _disposers = [];
  }

  @override
  void dispose() {
    for (var element in _disposers) {
      element();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          expand(child: _upperSideContent(), flex: 2),
          const Divider(
            color: AppColors.lightGray,
            height: 0.05,
          ),
          expand(flex: 8, child: _lowerSideContent())
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "${StringProvider.welcome} ${_store.userName}!"
                  .text(AppTextStyle.enterNumberStyle, TextOverflow.ellipsis)
                  .padding(insets: EdgeInsets.only(bottom: 0.03.sw)),
              StringProvider.pleaseCompleteRequied
                  .text(AppTextStyle.enterNumberSubHeadingStyle)
            ],
          ).padding(
              insets:
                  EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.03.sw)),
        ),
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
            child: Observer(
              builder: (BuildContext context) {
                return AnimatedCrossFade(
                  duration: const Duration(milliseconds: 400),
                  crossFadeState: _store.gettingDataLoader
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  secondChild: !_store.gettingDataLoader
                      ? _mainContent()
                      : const SizedBox.shrink(),
                  firstChild: const Align(
                      alignment: Alignment.center,
                      child: AnimatedJaduRideView()),
                  alignment: Alignment.centerRight,
                  firstCurve: Curves.ease,
                  secondCurve: Curves.ease,
                );
              },
            ),
          ),
          const Divider(
            color: AppColors.lightGray,
            height: 0.05,
          ),
          expand(
              flex: 2,
              child: Align(
                child: ElevatedButton(
                    onPressed: () {},
                    style: AppButtonThemes.defaultStyle,
                    child: StringProvider.continuee
                        .text(AppTextStyle.btnTextStyleWhite)),
              ))
        ],
      ),
    );
  }

  Widget _mainContent() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sw),
      children: [
        Observer(
          builder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StringProvider.necessarySteps
                    .text(AppTextStyle.stepsHeadingStyle)
                    .padding(insets: EdgeInsets.only(bottom: 0.05.sw)),
                ListView.separated(
                  padding: EdgeInsets.only(bottom: 0.05.sw),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: _store.requiredSteps.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StepView(
                        step: _store.requiredSteps[index], onClick: (step) {});
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 0.05.sw);
                  },
                ),
              ],
            );
          },
        ),
        Observer(
          builder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StringProvider.optionalSteps
                    .text(AppTextStyle.stepsHeadingStyle)
                    .padding(insets: EdgeInsets.only(bottom: 0.05.sw)),
                ListView.separated(
                  padding: EdgeInsets.only(bottom: 0.05.sw),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: _store.optionalSteps.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StepView(
                        step: _store.optionalSteps[index], onClick: (step) {});
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 0.05.sw);
                  },
                ),
              ],
            );
          },
        ),
        StringProvider.setting
            .text(AppTextStyle.stepsHeadingStyle)
            .padding(insets: EdgeInsets.only(bottom: 0.05.sw)),
        fitBox(
            child: InkWell(
          onTap: _store.profileSettingClicked,
          borderRadius: BorderRadius.circular(16.r),
          overlayColor: MaterialStateProperty.all(
              AppColors.primaryVariant.withOpacity(0.5)),
          child: Container(
            width: 0.90.sw,
            padding: EdgeInsets.all(0.05.sw),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.lightGray,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: AppColors.lightGray,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Row(
              children: [
                expand(flex: 1, child: SvgPicture.asset(ImageAssets.profile)),
                expand(
                    flex: 9,
                    child: StringProvider.profileSetting
                        .text(AppTextStyle.detailsTypeItemTextStyle)
                        .padding(insets: EdgeInsets.only(left: 0.05.sw))),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
