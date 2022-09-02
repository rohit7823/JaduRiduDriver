import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/animated_jadu_ride_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/v_audit_step_view.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/vehicle_audit_nested_screens.dart';
import 'package:jadu_ride_driver/presentation/stores/vehicle_audit_screen_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

import '../custom_widgets/step_view.dart';
import '../ui/app_text_style.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class VehicleAuditScreen extends StatefulWidget {
  const VehicleAuditScreen({Key? key}) : super(key: key);

  @override
  State<VehicleAuditScreen> createState() => _VehicleAuditScreenState();
}

class _VehicleAuditScreenState extends State<VehicleAuditScreen> {
  late final VehicleAuditStore _store;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store = VehicleAuditStore();
    _store.getRequiredSteps();
    super.initState();

    _disposers = [
      reaction((p0) => _store.selectedStep, (p0) {
        if (p0 != null && p0 is VehicleAuditStep) {
          showModalBottomSheet(
              useRootNavigator: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r)),
              context: context,
              builder: (context) {
                return p0.provideUI();
              }).then((value) => _store.selectedStep = null);
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
          expand(flex: 2, child: _upperSideContent()),
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
              StringProvider.vehicleAudit
                  .text(AppTextStyle.enterNumberStyle)
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
      child: Column(
        children: [
          expand(
              flex: 9,
              child: fitBox(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0.05.sw),
                  width: 1.sw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StringProvider.requiredSteps
                          .text(AppTextStyle.requiredStepsStyle)
                          .padding(
                              insets: EdgeInsets.only(
                                  bottom: 0.03.sw, left: 0.05.sw, right: 0.05)),
                      Observer(
                        builder: (BuildContext context) {
                          return AnimatedCrossFade(
                            duration: const Duration(milliseconds: 300),
                            crossFadeState: _store.gettingDataLoader
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            firstChild: SizedBox(
                                height: 0.50.sh,
                                child: const AnimatedJaduRideView()),
                            secondChild: ListView.separated(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.05.sw, vertical: 0.03.sw),
                                itemBuilder: (context, idx) {
                                  return VAuditStepView(
                                      auditStep: _store.requiredSteps[idx],
                                      onClick: _store.onStepClicked);
                                },
                                separatorBuilder: (context, idx) {
                                  return SizedBox(height: 0.05.sw);
                                },
                                itemCount: _store.requiredSteps.length),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )),
          expand(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: AppButtonThemes.defaultStyle,
                    onPressed: () {},
                    child: StringProvider.done
                        .text(AppTextStyle.btnTextStyleWhite)),
              ))
          //expand(flex: 2, child: child)
        ],
      ),
    );
  }
}
