import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_snack_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/disclosure_dialog.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/stores/verify_otp_screen_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';
import 'package:pinput/pinput.dart';

import '../ui/app_button_themes.dart';

class VerifyOtpScreen extends StatefulWidget {
  SharedStore sharedStore;
  String number;

  VerifyOtpScreen({Key? key, required this.sharedStore, required this.number})
      : super(key: key);

  @override
  State<VerifyOtpScreen> createState() =>
      _VerifyOtpScreenState(sharedStore: sharedStore);
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  SharedStore sharedStore;
  late final VerifyOtpStore _store;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;

  _VerifyOtpScreenState({required this.sharedStore});

  @override
  void initState() {
    _store = VerifyOtpStore(widget.number.replaceAll("-", ""));
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();

    _disposers = [
      reaction((p0) => _store.showSnackbarMsg, (p0) {
        if (p0 is String && p0.isNotEmpty) {
          AppSnackBar.show(context, message: p0, clear: () {
            _store.showSnackbarMsg = "";
          });
        }
      }),
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_store.dialogManager.errorData!, p0,
              positive: _store.onRetry,
              close: _store.dialogManager.closeErrorDialog);
        }
      }),
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.to(context, p0.screen,
              arguments: p0.argument,
              option: p0.option,
              onComplete: _store.clear);
        }
      }),
      reaction((p0) => _store.isUserRegister, (p0) {
        debugPrint(p0.toString());
        if (p0) {
          widget.sharedStore.getDashBoardData();
          _store.clearUserRegister();
        }
      }),
      reaction((p0) => widget.sharedStore.dialogManager.currentState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(widget.sharedStore.dialogManager.data!, p0,
              close: widget.sharedStore.dialogManager.closeDialog,
              positive: widget.sharedStore.onAction);
        }
      }),
      reaction((p0) => widget.sharedStore.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          debugPrint(p0.option.toString());
          ChangeScreen.to(context, p0.screen,
              option: p0.option, onComplete: widget.sharedStore.clear);
        }
      }),
      reaction((p0) => widget.sharedStore.dialogManager.disclosureState, (p0) {
        if (p0 == DialogState.displaying) {
          showDisclosureDialog(
              context, widget.sharedStore.dialogManager.disclosureData,
              onEvent: widget.sharedStore.onDisclosureEvent);
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
          expand(flex: 2, child: _upperSideContent()),
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
        child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.03.sw),
            child: fitBox(
                child: "${StringProvider.enterOtp}${widget.number}"
                    .text(AppTextStyle.enterNumberStyle))),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          expand(
              flex: 7,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 0.10.sh),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            width: 0.90.sw,
                            child: Pinput(
                              defaultPinTheme: PinTheme(
                                width: 65.w,
                                height: 65.h,
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(30, 60, 87, 1),
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade100),
                              ),
                              focusedPinTheme: PinTheme(
                                width: 65.w,
                                height: 65.h,
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(30, 60, 87, 1),
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryVariant),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade100),
                              ),
                              separator: SizedBox(
                                width: 0.05.sw,
                              ),
                              onCompleted: _store.otpEntered,
                              onChanged: (text) {
                                _store.enableBtn = false;
                              },
                              keyboardType: TextInputType.number,
                              validator: _store.validateOtp,
                            )),
                        SizedBox(height: 0.05.sw),
                        FittedBox(
                          child: Observer(
                            builder: (BuildContext context) {
                              return Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    StringProvider.dintRecieveCode,
                                    style: AppTextStyle.numberInputStyle,
                                  ),
                                  TextButton(
                                      onPressed: _store.reSendingOtpLoader
                                          ? null
                                          : _store.reSendOtp,
                                      child: _store.reSendingOtpLoader
                                          ? Text(StringProvider.recieveing,
                                              style:
                                                  AppTextStyle.findAccountStyle)
                                          : Text(StringProvider.recieve,
                                              style: AppTextStyle
                                                  .findAccountStyle))
                                ],
                              );
                            },
                          ),
                        )
                      ]),
                ),
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
                        onPressed: _store.enableBtn ? _store.verify : null,
                        child: _store.sendingLoader
                            ? const CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : Text(
                                StringProvider.verifyNow,
                                style: AppTextStyle.btnTextStyleWhite,
                              ));
                  },
                ),
              ))
        ],
      ),
    );
  }
}
