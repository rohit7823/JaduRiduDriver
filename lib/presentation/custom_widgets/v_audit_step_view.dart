import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class VAuditStepView extends StatelessWidget {
  VehicleAuditStep auditStep;
  Function(VehicleAuditStep) onClick;
  VAuditStepView({Key? key, required this.auditStep, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onClick(auditStep);
        },
        borderRadius: BorderRadius.circular(16.r),
        overlayColor:
            MaterialStateProperty.all(AppColors.primaryVariant.withOpacity(.5)),
        child: fitBox(
          child: Container(
            width: 0.90.sw,
            padding: EdgeInsets.all(0.05.sw),
            decoration: BoxDecoration(
              color: auditStep.isCompleted
                  ? AppColors.appGreen.withOpacity(0.6)
                  : AppColors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.lightGray,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: AppColors.lightGray,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Row(
              children: [
                expand(
                    flex: 9,
                    child: auditStep.toAuditStepName().text(
                        auditStep.isCompleted
                            ? AppTextStyle.detailsTypeItemTextStyle
                                .copyWith(color: AppColors.white)
                            : AppTextStyle.detailsTypeItemTextStyle)),
                expand(
                    flex: 1,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: auditStep.isCompleted
                          ? AppColors.white
                          : AppColors.Acadia,
                    ))
              ],
            ),
          ),
        ));
  }
}
