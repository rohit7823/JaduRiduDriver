import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/animated_jadu_ride_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_snack_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/identify_question_item_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/stores/identify_details_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class IdentifyDetailsScreen extends StatefulWidget {
  const IdentifyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<IdentifyDetailsScreen> createState() => _IdentifyDetailsScreenState();
}

class _IdentifyDetailsScreenState extends State<IdentifyDetailsScreen> {
  late final IdentifyDetailStore _store;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;

  @override
  void initState() {
    _store = IdentifyDetailStore();
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();

    _disposers = [
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_store.dialogManager.errorData!, p0,
              positive: _store.onError,
              close: _store.dialogManager.closeErrorDialog);
        }
      }),
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          dependency<ChangeScreen>().from(context, p0.screen,
              result: p0.argument, onCompleted: _store.clear);
        }
      }),
      reaction((p0) => _store.informMessage, (p0) {
        if (p0 is String && p0.isNotEmpty) {
          AppSnackBar.show(context, message: p0, clear: () {
            _store.informMessage = "";
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          expand(flex: 1, child: _upperSideContent()),
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
        child: fitBox(
            child: StringProvider.indentifyDetails
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
              child: Align(
                alignment: Alignment.topCenter,
                child: Observer(
                  builder: (BuildContext context) {
                    return AnimatedCrossFade(
                      duration: const Duration(milliseconds: 400),
                      crossFadeState: _store.gettingDataLoader
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: const AnimatedJaduRideView(),
                      secondChild: _store.questionItems.isNotEmpty
                          ? ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.all(0.05.sw),
                              itemBuilder: (context, idx) {
                                return IdentifyQuestionItemView(
                                  item: _store.questionItems[idx],
                                  onSelect: (option) {
                                    debugPrint("selected ${option!.option}");
                                    _store.onSelectQuestion(option, idx);
                                  },
                                );
                              },
                              separatorBuilder: (context, idx) => SizedBox(
                                    height: 0.05.sw,
                                  ),
                              itemCount: _store.questionItems.length)
                          : const SizedBox.shrink(),
                    );
                  },
                ),
              )),
          const Divider(
            color: AppColors.lightGray,
            height: 0.05,
          ),
          expand(
              flex: 2,
              child: Align(
                child: Observer(
                  builder: (BuildContext context) {
                    return ElevatedButton(
                        style: _store.enableBtn
                            ? AppButtonThemes.defaultStyle
                            : AppButtonThemes.cancelBtnStyle,
                        onPressed: _store.enableBtn ? _store.onSave : null,
                        child: _store.onChangeLoader
                            ? const CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : StringProvider.saveAndProcced
                                .text(AppTextStyle.btnTextStyleWhite));
                  },
                ),
              ))
        ],
      ),
    );
  }
}
