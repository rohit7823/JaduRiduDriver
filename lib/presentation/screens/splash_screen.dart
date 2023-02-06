import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/batch_call_command.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/app_version.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/stores/splash_screen_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/lottie_asset.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/connectivity_state.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';

import '../../helpers_impls/my_dialog_impl.dart';
import '../../utills/dialog_controller.dart';
import '../custom_widgets/disclosure_dialog.dart';
import '../ui/image_assets.dart';

class SplashScreen extends StatefulWidget {
  SharedStore sharedStore;
  SplashScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState(sharedStore: sharedStore);
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  _SplashScreenState({required this.sharedStore});

  SharedStore sharedStore;
  late final List<ReactionDisposer> _disposers;
  late final SplashStore _store;
  late final DialogController _dialogController;

  @override
  void initState() {
    _store = SplashStore();
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    WidgetsBinding.instance.addObserver(this);
    super.initState();

    _disposers = [
      reaction((p0) => _store.dialogManager.currentState, (p0) {
        if (p0 == DialogState.displaying) {
          _showAppUpdatePopUp(_store.dialogManager.data!);
        }
      }),
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          debugPrint("baseUrlError");
          _showErrorPopUp(_store.dialogManager.errorData!, callback: () {
            _store.onErrorRetry();
          });
        }
      }),
      reaction((p0) => _store.batchCall, (p0) {
        if (p0 is BatchCallCommand && p0 == BatchCallCommand.initiate) {
          sharedStore.initiateBatchCall();
        }
      }),
      reaction((p0) => sharedStore.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.to(context, p0.screen,
              option: p0.option, onComplete: sharedStore.clear);
        }
      }),
      reaction((p0) => sharedStore.dialogManager.currentErrorState, (p0) {
        if (p0 == DialogState.displaying) {
          debugPrint("introDataError: ${sharedStore.dialogManager.errorData!}");
          _showErrorPopUp(sharedStore.dialogManager.errorData!,
              callback: sharedStore.onIntroError);
        }
      }),
      reaction((p0) => sharedStore.dialogManager.disclosureState, (p0) {
        if (p0 == DialogState.displaying) {
          showDisclosureDialog(
              context,
              sharedStore.dialogManager.disclosureData,
              onEvent: sharedStore.onDisclosureEvent
          );
        }
      }),
      reaction((p0) => widget.sharedStore.dialogManager.currentState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(widget.sharedStore.dialogManager.data!, p0,
              close: widget.sharedStore.dialogManager.closeDialog,
              positive: widget.sharedStore.onAction);
        }
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 6,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _appLogo(),
              )),
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          const Expanded(
                            flex: 7,
                            child: SizedBox.shrink(),
                          ),
                          Expanded(
                            flex: 3,
                            child: Observer(
                              builder: (BuildContext context) {
                                return AnimatedCrossFade(
                                    firstChild: Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 0.02.sw),
                                        child: Lottie.asset(
                                            LottieAsset.splashLoader)),
                                    secondChild: Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 0.02.sw),
                                        child: Lottie.asset(
                                            LottieAsset.noInternet)),
                                    crossFadeState: _store.connectivityState ==
                                            ConnectivityState.Gone
                                        ? CrossFadeState.showSecond
                                        : CrossFadeState.showFirst,
                                    duration:
                                        const Duration(milliseconds: 400));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: FittedBox(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 0.10.sw),
                          child: Observer(
                            builder: (BuildContext context) {
                              return _store.connectivityState ==
                                      ConnectivityState.Gone
                                  ? const Text(StringProvider.noInternet)
                                  : Text(
                                      "${StringProvider.appVersion}: ${_store.packageInfo.version}");
                            },
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("==============${state.name}");
    sharedStore.retrieveLocation();
  }

  Widget _appLogo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 0.03.sw),
            child: Image.asset(ImageAssets.logo)),
        Padding(
          padding: EdgeInsets.only(bottom: 0.03.sw),
          child: Image.asset(ImageAssets.logoText),
        )
      ],
    );
  }

  _showAppUpdatePopUp(AlertData alertData) {
    showDialog(
        barrierDismissible: (alertData.data as AppVersion).isSkipable,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(alertData.title, style: AppTextStyle.headingTextStyle),
            content: Text(
              alertData.message,
              style: AppTextStyle.bodyTextStyle,
            ),
            actions: [
              if ((alertData.data as AppVersion).isSkipable)
                ElevatedButton(
                    style: AppButtonThemes.defaultStyle,
                    onPressed: () {
                      Navigator.of(context).pop();
                      _store.appUpdatePostpone();
                    },
                    child: Text(alertData.negative ?? "",
                        style: AppTextStyle.btnTextStyleBlack)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _store.onUpdateApp((alertData.data as AppVersion).url);
                  },
                  child: Text(alertData.positive ?? "",
                      style: AppTextStyle.btnTextStyleBlack))
            ],
          );
        }).then((value) => _store.appUpdatePostpone());
  }

  _showErrorPopUp(AlertData alertData, {Function? callback}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(alertData.title, style: AppTextStyle.headingTextStyle),
            content: Text(
              alertData.message,
              style: AppTextStyle.bodyTextStyle,
            ),
            actions: [
              if (alertData.positive != null)
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      callback?.call();
                    },
                    child: Text(alertData.positive ?? ""))
            ],
          );
        }).then((value) => callback?.call());
  }
}
