import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/error_dialog_impl.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_snack_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/locale_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/stores/change_app_language_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/current_locale.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class ChangeAppLanguageScreen extends StatefulWidget {
  SharedStore sharedStore;
  ChangeAppLanguageScreen({Key? key, required this.sharedStore})
      : super(key: key);

  @override
  State<ChangeAppLanguageScreen> createState() => _ChangeAppLanguageState();
}

class _ChangeAppLanguageState extends State<ChangeAppLanguageScreen> {
  late final ChangeAppLanguageStore _store;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;

  @override
  void initState() {
    _store = ChangeAppLanguageStore();
    _dialogController = DialogController(dialog: ErrorDialogImpl(buildContext: context));
    super.initState();

    _disposers = [
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if(p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_store.dialogManager.errorData!, p0, close: _store.dialogManager.closeErrorDialog);
        }
      }),
      reaction((p0) => _store.currentChange, (p0) {
        if(p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.to(
              context,
              p0.screen,
              arguments: p0.argument,
              onComplete: _store.clear
          );
        }
      }),
      reaction((p0) => _store.languageChangedMsg, (p0) {
        if(p0 is String && p0.isNotEmpty) {
          AppSnackBar.show(context, message: p0, clear: () {
            _store.languageChangedMsg = "";
          });
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
  void didChangeDependencies() {
    _store.setCurrentLocale(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          expand(child: _upperSideContent(), flex: 2),
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
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sw),
            child: StringProvider.selectPrefferedLanguage
                .text(AppTextStyle.enterNumberStyle),
          ),
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
              child: Align(
                alignment: Alignment.topCenter,
                child: Observer(
                  builder: (BuildContext context) {
                    return GridView.count(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sw),
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.03.sw,
                      mainAxisSpacing: 0.03.sw,
                      childAspectRatio: 40 / 30,
                      children: _store.locales.entries.map((entry) => LocaleView(
                        entry: entry,
                        isSelected: entry.key == _store.selectedAppLocale ? true : false,
                        onClick: _store.onLocaleClick,)
                      ).toList(),
                    );
                  },
                ),
              )
          ),
          const Divider(color: AppColors.lightGray, height: 0.05),
          expand(flex: 2, child: Align(
            alignment: Alignment.center,
            child: Observer(
              builder: (BuildContext obContext) {
                return ElevatedButton(
                    style: _store.enableBtn
                        ? AppButtonThemes.cancelBtnStyle
                        : AppButtonThemes.defaultStyle,
                    onPressed: _store.enableBtn ? null : () {
                      _store.onNext(changeLang: () async {
                        await context.setLocale(Locale(_store.selectedAppLocale.value));

                      });
                    },
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
    );
  }
}
