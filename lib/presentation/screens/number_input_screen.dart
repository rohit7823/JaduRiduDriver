import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/mobile_number_with_codes_text_field.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/navigate_back.dart';
import 'package:jadu_ride_driver/presentation/stores/number_input_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class NumberInputScreen extends StatefulWidget {
  SharedStore sharedStore;
  NumberInputScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<NumberInputScreen> createState() =>
      _NumberInputScreenState(sharedStore: sharedStore);
}

class _NumberInputScreenState extends State<NumberInputScreen> {
  late final NumberInputStore _store;
  SharedStore sharedStore;
  final FocusNode inputManager = FocusNode();
  late final TextEditingController _mobileNumberInputController;
  late final List<ReactionDisposer> _disposers;
  late final DialogController dialogController;
  _NumberInputScreenState({required this.sharedStore});

  @override
  void initState() {
    _store = NumberInputStore();
    dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    _mobileNumberInputController =
        TextEditingController(text: _store.mobileNumber);
    super.initState();

    _disposers = [
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) async {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          await dialogController.show(_store.dialogManager.errorData!, p0,
              positive: _store.onRetry,
              close: _store.dialogManager.closeErrorDialog);
        }
      }),
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          dependency<ChangeScreen>().to(context, p0.screen,
              option: p0.option,
              arguments: p0.argument,
              onComplete: _store.clear);
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
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(),
      body: Column(
        children: [
          Expanded(flex: 2, child: _upperSideContent()),
          Expanded(flex: 8, child: _lowerSideContent())
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: fitBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fitBox(
                    child: StringProvider.enterMobileNumber
                        .text(AppTextStyle.enterNumberStyle)
                        .padding(insets: EdgeInsets.only(bottom: 0.03.sw))),
                fitBox(
                    child: StringProvider.enterNumberDescription
                        .text(AppTextStyle.enterNumberSubHeadingStyle)
                        .padding(insets: EdgeInsets.only(bottom: 0.03.sw)))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
        child: Column(
          children: [
            expand(
                flex: 7,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: fitBox(child: Observer(
                    builder: (BuildContext context) {
                      return MobileNumberWithCodesTextField(
                        key: ObjectKey(_store.gettingDataLoader),
                        node: inputManager,
                        controller: _mobileNumberInputController,
                        onTextChange: (number) {
                          if (number.length == 12) {
                            inputManager.unfocus();
                          }
                          _store.onNumberChange(number);
                        },
                        codes: _store.codes,
                        onCodeSelect: _store.onCodeSelected,
                        onNumberCleared: _store.onNumberClear,
                        gettingLoader: _store.gettingDataLoader,
                      );
                    },
                  )).padding(insets: EdgeInsets.only(top: 0.10.sh)),
                )),
            expand(
                flex: 3,
                child: Align(
                  alignment: Alignment.center,
                  child: Observer(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                          style: _store.enableBtn
                              ? AppButtonThemes.defaultStyle
                              : AppButtonThemes.cancelBtnStyle,
                          onPressed: _store.enableBtn ? _store.onNext : null,
                          child: _store.sendingLoader
                              ? const CircularProgressIndicator(
                                  color: AppColors.white,
                                )
                              : Text(
                                  StringProvider.next,
                                  style: AppTextStyle.btnTextStyleWhite,
                                ));
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
