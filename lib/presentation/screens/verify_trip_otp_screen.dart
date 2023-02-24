import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/domain/ride_ids.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_snack_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/stores/verify_trip_otp_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';
import 'package:pinput/pinput.dart';

import '../ui/app_button_themes.dart';
import '../ui/theme.dart';

class VerifyTripOtpScreen extends StatefulWidget {
  RideIds ids;

  VerifyTripOtpScreen({Key? key, required this.ids}) : super(key: key);

  @override
  State<VerifyTripOtpScreen> createState() => _VerifyTripOtpScreenState();
}

class _VerifyTripOtpScreenState extends State<VerifyTripOtpScreen> {
  late final VerifyTripOtpStore _store;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store = VerifyTripOtpStore(widget.ids);
    super.initState();

    _disposers = [
      reaction((p0) => _store.messageInformer.currentMsg, (p0) {
        if (p0.isNotEmpty) {
          AppSnackBar.show(context,
              message: p0, clear: _store.messageInformer.clear);
        }
      }),
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null) {
          ChangeScreen.from(context, p0.screen,
              onCompleted: _store.clear, result: p0.argument);
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
      appBar: MyAppBar(
        onPop: null,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Column(
          children: [
            expand(flex: 2, child: _upperSideContent()),
            expand(flex: 9, child: _lowerSideContent())
          ],
        ),
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
          child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.03.sw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StringProvider.verifyOtp
                      .text(AppTextStyle.enterNumberStyle)
                      .paddings(bottom: 0.03.sw),
                  "Ask ${widget.ids.customerName} for OTP to start trip"
                      .text(AppTextStyle.enterNumberSubHeadingStyle)
                ],
              )),
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
                              androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                            )),
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
