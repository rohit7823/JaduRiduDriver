import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jadu_ride_driver/core/domain/emergency_place.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class EmergencyRideLocationWidget extends StatelessWidget {
  dynamic starting;
  EmergencyPlace? ending;
  bool isStartingSelected;
  bool isEndingSelected;
  Function(Object) onSelectStaring;
  Function(EmergencyPlace?) onSelectEnding;

  EmergencyRideLocationWidget(
      {Key? key,
      required this.starting,
      required this.ending,
      this.isStartingSelected = false,
      this.isEndingSelected = false,
      required this.onSelectEnding,
      required this.onSelectStaring})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: .90.sw,
        padding: EdgeInsets.all(0.05.sw),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: allShadow()),
        child: Material(
          elevation: 10,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  onSelectStaring(starting);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.Apple),
                    ).paddings(all: 0.02.sw),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StringProvider.origin.text(
                            AppTextStyle.bankDetailsTextInputStyle.copyWith(
                                color: const Color(0xFFFDBA12),
                                fontWeight: FontWeightManager.medium)),
                        if (starting is Position)
                          StringProvider.currentLocation.text(AppTextStyle
                              .normal
                              .copyWith(fontWeight: FontWeightManager.medium))
                      ],
                    ).paddings(horizontal: 0.02.sw)
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.lightGray,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        boxShadow: allShadow()),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                          color: AppColors.lightGray, shape: BoxShape.circle),
                    ),
                  )
                ],
              ).paddings(vertical: 0.03.sw),
              InkWell(
                onTap: () {
                  onSelectEnding(ending);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    expand(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryVariant),
                      ).paddings(all: 0.02.sw),
                      flex: 0,
                    ),
                    expand(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            StringProvider.destination.text(
                                AppTextStyle.bankDetailsTextInputStyle.copyWith(
                                    color: const Color(0xFFFDBA12),
                                    fontWeight: FontWeightManager.medium)),
                            if (ending != null)
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: ending!.address.text(AppTextStyle.normal
                                    .copyWith(
                                        fontWeight: FontWeightManager.medium)),
                              ),
                            if (ending == null)
                              StringProvider.endingDestination.text(
                                  AppTextStyle.normal.copyWith(
                                      fontWeight: FontWeightManager.medium))
                          ],
                        ).paddings(horizontal: 0.02.sw))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
