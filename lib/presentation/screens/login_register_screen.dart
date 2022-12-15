import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/stores/login_registration_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:mobx/mobx.dart';
import '../ui/app_text_style.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class LoginRegisterScreen extends StatefulWidget {
  SharedStore sharedStore;
  LoginRegisterScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<LoginRegisterScreen> createState() =>
      _LoginRegisterScreenState(sharedStore: sharedStore);
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  SharedStore sharedStore;
  late final LRStore _store;
  late final List<ReactionDisposer> _disposers;
  _LoginRegisterScreenState({required this.sharedStore});

  @override
  void initState() {
    _store = LRStore();
    super.initState();

    _disposers = [
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.to(context, p0.screen,
              arguments: p0.argument,
              option: p0.option,
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
      backgroundColor: Colors.white,
      body: _mainContent(),
    );
  }

  Widget _mainContent() {
    return Column(
      children: [
        Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child:sharedStore.loginRegistrationData != null? FittedBox(
                child: SvgPicture.network(
                    sharedStore.loginRegistrationData?.coverImage??''),
              ) : const SizedBox.shrink(),
            )),
        Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 0.95.sw,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   if(sharedStore.loginRegistrationData != null) FittedBox(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 0.03.sw),
                        child: Text(sharedStore.loginRegistrationData!.heading,
                            style: AppTextStyle.introHeadingStyle),
                      ),
                    ),
                    if(sharedStore.loginRegistrationData != null)FittedBox(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 0.05.sw),
                        child: Text(
                            sharedStore.loginRegistrationData!.description
                                .replaceFirst(",", "\n"),
                            style: AppTextStyle.bodyTextStyle,
                            textAlign: TextAlign.center),
                      ),
                    ),
                    FittedBox(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 0.04.sw),
                        child: OutlinedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: AppColors.primaryVariant),
                                      borderRadius:
                                          BorderRadius.circular(16.r))),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.primaryVariant),
                              fixedSize: MaterialStateProperty.all(Size(
                                0.95.sw,
                                0.18.sw,
                              )),
                            ),
                            onPressed: _store.loginClicked,
                            child: Text(StringProvider.login,
                                style: AppTextStyle.btnTextStyleWhite)),
                      ),
                    ),
                    FittedBox(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 0.03.sw),
                        child: OutlinedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: AppColors.primaryVariant,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(16.r))),
                                backgroundColor:
                                    MaterialStateProperty.all(AppColors.white),
                                fixedSize: MaterialStateProperty.all(Size(
                                  0.95.sw,
                                  0.18.sw,
                                )),
                                side: MaterialStateProperty.all(
                                    const BorderSide(
                                        color: AppColors.primaryVariant,
                                        width: 2))),
                            onPressed: _store.registerClicked,
                            child: Text(StringProvider.register,
                                style: AppTextStyle.btnTextStyle)),
                      ),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
