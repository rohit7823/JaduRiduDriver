import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/package.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/mobile_number_with_codes_text_field.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_text_input.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/outline_drop_down.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/terms_condition_view.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/stores/welcome_jadu_ride_screen_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class WelcomeJaduRideScreen extends StatefulWidget {
  SharedStore sharedStore;
  WelcomeJaduRideScreen({Key? key, required this.sharedStore})
      : super(key: key);

  @override
  State<WelcomeJaduRideScreen> createState() => _WelcomeJaduRideScreenState();
}

class _WelcomeJaduRideScreenState extends State<WelcomeJaduRideScreen> {
  late final WelcomeJaduRideStore _store;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;

  @override
  void initState() {
    _store = WelcomeJaduRideStore();
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();
    _disposers = [
      reaction((p0) => _store.selectedState, (p0) {
        if (p0 != null && p0 is Package) {
          _store.getDistricts();
        }
      }),
      reaction((p0) => _store.selectedDistrict, (p0) {
        if (p0 != null && p0 is Package) {
          _store.getCities();
        }
      }),
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_store.dialogManager.errorData!, p0,
              close: _store.dialogManager.closeErrorDialog,
              positive: _store.onRetry);
        }
      }),
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.to(context, p0.screen, onComplete: _store.clear);
        }
      }),

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
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(),
      body: Column(
        children: [
          Expanded(flex: 2, child: _upperrSideContent()),
          const Divider(
            color: AppColors.lightGray,
            height: 0.05,
          ),
          Expanded(flex: 8, child: _lowerSideContent())
        ],
      ),
    );
  }

  Widget _upperrSideContent() {
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
              StringProvider.welcomeToJaduRide
                  .text(AppTextStyle.enterNumberStyle)
                  .padding(insets: EdgeInsets.only(bottom: 0.02.sw)),
              StringProvider.pleaseEnterPartnerDetails
                  .text(AppTextStyle.enterNumberSubHeadingStyle)
            ],
          ),
        ).padding(
            insets: EdgeInsets.only(
                bottom: 0.05.sw, top: 0.03.sw, left: 0.05.sw, right: 0.05.sw)),
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
                return ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      horizontal: 0.05.sw, vertical: 0.05.sw),
                  children: [
                    MyTextInput(
                      onTextChange: _store.name,
                      keyboardType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      isMandatory: true,
                      placeholderText: StringProvider.enterYourName,
                    ).padding(insets: EdgeInsets.only(bottom: 0.04.sw)),
                    MyTextInput(
                      onTextChange: _store.email,
                      keyboardType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      isMandatory: false,
                      placeholderText: StringProvider.enterYourEmail,
                    ).padding(insets: EdgeInsets.only(bottom: 0.04.sw)),
                    if(!_store.emailValidator ) const Text(
                      "*Check your Email.",style: TextStyle(color: Colors.red,fontSize: 10),
                    ).padding(insets: EdgeInsets.only(bottom: 0.04.sw)),

                    MobileNumberWithCodesTextField(
                            key: ObjectKey(_store.gettingLoader),
                            node: FocusNode(),
                            controller: TextEditingController(
                                text: _store.userMobileNumber),
                            onTextChange: _store.mobileNumber,
                            codes: _store.codes,
                            isMandatory: true,
                            onCodeSelect: _store.onNumberCode,
                            onNumberCleared: _store.mobileNumberCleared,
                            gettingLoader: _store.gettingLoader)
                        .padding(insets: EdgeInsets.only(bottom: 0.04.sw)),
                    OutlineDropDown(
                            items: _store.states,
                            onSelected: _store.onState,
                            placeHolder: StringProvider.notItems,
                            loader: _store.gettingLoader,
                            current: _store.selectedState)
                        .padding(insets: EdgeInsets.only(bottom: 0.04.sw)),
                    OutlineDropDown(
                            items: _store.districts,
                            onSelected: _store.onDistrict,
                            loader: _store.gettingDistrictsLoader,
                            placeHolder: StringProvider.notItems,
                            current: _store.selectedDistrict)
                        .padding(insets: EdgeInsets.only(bottom: 0.04.sw)),
                    OutlineDropDown(
                            items: _store.cities,
                            onSelected: _store.onCity,
                            loader: _store.gettingCitiesLoader,
                            placeHolder: StringProvider.notItems,
                            current: _store.selectedCity)
                        .padding(insets: EdgeInsets.only(bottom: 0.04.sw)),
                    MyTextInput(
                      onTextChange: _store.onReferralCode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      isMandatory: true,
                      placeholderText: StringProvider.referralCode,
                    ).padding(insets: EdgeInsets.only(bottom: 0.06.sw)),
                    TermsAndConditionView(
                      isMandatory: true,
                      onClick: _store.termsConditionClicked,
                      isSelected: _store.isTermsSelected,
                    )
                  ],
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
                alignment: Alignment.center,
                child: Observer(
                  builder: (BuildContext context) {
                    return ElevatedButton(
                        style: _store.enableBtn
                            ? AppButtonThemes.defaultStyle
                            : AppButtonThemes.cancelBtnStyle,
                        onPressed: _store.enableBtn ? _store.onContinue : null,
                        child: _store.uploadingLoader
                            ? const CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : Text(
                                StringProvider.continuee,
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
