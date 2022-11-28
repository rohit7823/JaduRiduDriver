import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/overlay_permission_status.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/service/ride_direction_foreground_service.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class ApplicationSubmittedScreen extends StatefulWidget {
  final SharedStore sharedStore;
  const ApplicationSubmittedScreen({Key? key, required this.sharedStore})
      : super(key: key);

  @override
  State<ApplicationSubmittedScreen> createState() =>
      _ApplicationSubmittedScreenState();
}

class _ApplicationSubmittedScreenState
    extends State<ApplicationSubmittedScreen> {
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;

  @override
  void initState() {
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();
    _disposers = [
      reaction((p0) => widget.sharedStore.dialogManager.currentState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(widget.sharedStore.dialogManager.data!, p0,
              close: widget.sharedStore.dialogManager.closeDialog,
              positive: widget.sharedStore.onAction);
        }
      }),
      reaction((p0) => widget.sharedStore.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          debugPrint("MyDebug" + p0.option.toString());
          dependency<ChangeScreen>().to(context, p0.screen,
              option: p0.option, onComplete: widget.sharedStore.clear);
        }
      })
    ];
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
      body: Column(
        children: [
          expand(
              flex: 8,
              child: Align(
                alignment: Alignment.center,
                child: fitBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(ImageAssets.success)
                          .padding(insets: EdgeInsets.only(bottom: 0.07.sw)),
                      StringProvider.applicationSubmitted
                          .text(AppTextStyle.applicationSubmittedStyle)
                          .padding(insets: EdgeInsets.only(bottom: 0.03.sw)),
                      SizedBox(
                          width: 0.90.sw,
                          child: StringProvider.applicationSubmittedDescription
                              .text(AppTextStyle.descriptionTextStyle, null,
                                  TextAlign.center))
                    ],
                  ),
                ),
              )),
          expand(
              flex: 2,
              child: Align(
                child: Observer(
                  builder: (BuildContext context) {
                    return ElevatedButton(
                        onPressed: widget.sharedStore.gettingDataLoader
                            ? null
                            : widget.sharedStore.getDashBoardData,
                        style: widget.sharedStore.gettingDataLoader
                            ? AppButtonThemes.cancelBtnStyle
                            : AppButtonThemes.defaultStyle,
                        child: widget.sharedStore.gettingDataLoader
                            ? const CircularProgressIndicator(
                                color: AppColors.primaryVariant,
                              )
                            : StringProvider.toDashboard
                                .text(AppTextStyle.btnTextStyleWhite));
                  },
                ),
              ))
        ],
      ),
    );
  }
}
